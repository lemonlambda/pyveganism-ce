local function get_main_product(results, name, mode)
  log(serpent.block(results))
  for _, result in pairs(table.deepcopy(results)) do
    log(serpent.line(result))
    if result.name == name then
      local mode_value
      if not result.amount then 
        if mode == "max" then
          mode_value = result.amount_max
        elseif mode == "min" then
          mode_value = result.amount_min
        else
          mode_value = (result.amount_min + result.amount_max) / 2
        end
      end
      result.amount = result.amount or mode_value
      return result
    end
  end
end

-- Gets the recipe costs by passing ingredients and sub_recipes
-- Uses the main_product_amount as a dividing factor
local function _get_recipe_costs(self_func, main_product_amount, ingredients, established_costs, sub_recipes)
  -- Overall cost of each ingredient in the recipe
  local costs = {}

  for _, ingredient in pairs(ingredients) do
    local individual_cost

    -- If ingredient has a sub recipe go find out that sub recipes cost
    if sub_recipes[ingredient.name] and data.raw["recipe"][sub_recipes[ingredient.name]] then
      local recipe = RECIPE(sub_recipes[ingredient.name])
      local sub_ingredients = recipe.ingredients
      local ingredient_main_product = get_main_product(recipe.results, ingredient.name)

      -- Find the associated costs of that ingredient
      -- main_product.amount / ingredient.amount is what's used to find out how much of a product is
      -- main_product.amount = 5 cocoons
      -- ingredient.amount = 10 cocoons
      -- 0.5 cocoons is the result which we use to divide the cost which results in doubling the cost
      local additional_costs = self_func(self_func, ingredient_main_product.amount / ingredient.amount, sub_ingredients, established_costs, sub_recipes)

      for name, cost in pairs(additional_costs) do
        -- The cost needs to be divided by the main_product_amount
        -- main_product_amount is the amount of the main_product the trad recipe produces
        -- We need to divide cost by this because we need to scale down to per 1
        -- If we have a cost of $10 and we only use half of it's cost per main_product then we need to halve the cost
        -- The main product amount would be 2 in that example
        local additional_cost = cost / main_product_amount
        log("Ingredient " .. name .. " with cost: " .. serpent.block(additional_cost))
        costs[name] = (costs[name] or 0) + additional_cost
      end

      goto continue
    else
      -- Invidial cached cost of an ingredient
      individual_cost = established_costs[ingredient.name] or 0
    end

    local additional_cost = ingredient.amount / main_product_amount * individual_cost
    log("Ingredient " .. ingredient.name .. " amount: " .. ingredient.amount .. " with cost: " .. serpent.block(additional_cost))
    costs[ingredient.name] = (costs[ingredient.name] or 0) + additional_cost

    ::continue::
  end

  return costs
end

-- Gets the individual cost of a recipe
local function _get_recipe_cost(get_recipe_costs_func, main_product_amount, ingredients, established_costs, sub_recipes)
  local costs = get_recipe_costs_func(get_recipe_costs_func, main_product_amount, ingredients, established_costs, sub_recipes)

  local total_cost = 0
  for _, ingredient_cost in pairs(costs) do
    total_cost = total_cost + ingredient_cost
  end

  return total_cost
end

-- Public API
function get_recipe_cost(main_product_amount, ingredients, established_costs, sub_recipes)
  return _get_recipe_cost(_get_recipe_costs, main_product_amount, ingredients, established_costs, sub_recipes)
end

function get_recipe_costs(main_product_amount, ingredients, established_costs, sub_recipes)
  return _get_recipe_costs(_get_recipe_costs, main_product_amount, ingredients, established_costs, sub_recipes)
end

local function round(num, num_decimal_places)
  local mult = 10^(num_decimal_places or 0)
  return math.floor(num * mult) / mult
end

-- The base to the cost_factor exponent
local COST_BASE = 1.1

-- Tries to generate a list of ingredients from costs and a scalar which is applied to the amounts of each ingredient
-- @param target_costs table<string, number>
-- @param cost_factor number A number to weight out costs to be more ingredients
-- @param scalar number
-- @param cached_costs table<string, number> Cached costs that can be used to scale around an ingredient
local function ingredients_collapse(target_costs, cost_factor, scalar, cached_costs)
  local ingredients = {}

  for name, cost in pairs(target_costs) do
    if cost == 0 then
      goto continue
    end
    
    local cached_cost = cached_costs[name]
    local amount = (cost * math.pow(COST_BASE, cost_factor)) / cached_cost

    log("New ingredient " .. name .. " amount is " .. serpent.line(new_amount))

    -- Get the type
    local type
    if data.raw["item"][name] or data.raw["module"][name] then
      type = "item"
    else
      type = "fluid"
    end
    
    table.insert(ingredients, {
      name = name,
      type = type,
      amount = math.ceil(amount * scalar)
    })

    ::continue::
  end

  return ingredients
end

-- Create's a partial filament recipe from a traditional recipe
-- @param main_product_name string The name of the main_product, for example: `vrauks`
-- @param costs table<string, number> A table of the associated costs of each ingredient
-- @param cost_factor number A number to weight out costs to be more ingredients
-- @param trad_recipe_name string the name of the traditional recipe
-- @param sub_recipes table<string, string> the name of the ingredient matched with it's traditional recipe, for example: `["cocoon"] = "vrauks-cocoon-1"`
-- @param scalar number How much should we scale the ingredients down by
function py_veganism_globals.get_filament_ingredients(main_product_name, costs, cost_factor, trad_recipe_name, sub_recipes, scaler)
  local recipe = RECIPE(trad_recipe_name)
  local ingredients = recipe.ingredients
  local main_product = get_main_product(recipe.results, main_product_name)
  log("Main product " .. main_product.name .. " with amount: " .. main_product.amount)

  local trad_costs = get_recipe_costs(main_product.amount, ingredients, costs, sub_recipes)
  for name, cost in pairs(trad_costs) do
    trad_costs[name] = round(cost, 3)
  end

  log("Costs: " .. serpent.block(trad_costs))

  local new_ingredients = ingredients_collapse(trad_costs, cost_factor, scaler, costs)
  
  return new_ingredients
end

-- Generates a new filament recipe based off of some criteria
-- @param recipe_name string The new recipe's name
-- @param icon_path string The path to the icon
-- @param extra_ingredients table<string, any>[] The extra ingredients in the recipe
-- @param scalar number The scalar to scale the trad ingredients by
--
-- @param filament_name string The name of the filament
-- @param filament_color number[3] RGB of the filament's color
-- @param filament_amount number The amount of filament to output
-- 
-- @param main_product_name string The name of the main_product, for example: `vrauks`
-- @param costs table<string, number> A table of the associated costs of each ingredient
-- @param cost_factor number A number to weight out costs to be more ingredients
-- @param trad_recipe_name string the name of the traditional recipe
-- @param sub_recipes table<string, string> the name of the ingredient matched with it's traditional recipe, for example: `["cocoon"] = "vrauks-cocoon-1"`
function py_veganism_globals.generate_new_automatic_filament_recipe(
  recipe_name,
  icon_path,
  extra_ingredients,
  scalar,
  
  filament_name,
  filament_color,
  filament_amount,
  
  main_product_name,
  costs,
  cost_factor,
  trad_recipe_name,
  sub_recipes
)
  local ingredients = py_veganism_globals.get_filament_ingredients(main_product_name, costs, cost_factor, trad_recipe_name, sub_recipes, scalar)
  log("Ingredients: " .. serpent.block(ingredients))

  if not data.raw["fluid"][filament_name] then
    FLUID {
      type = "fluid",
      name = filament_name,
      icon = icon_path,
      default_temperature = 15,
      base_color = filament_color,
      flow_color = filament_color,
    }
    log("New Filament: " .. serpent.block(data.raw["fluid"][filament_name]))
  end

  return {
    type = "recipe",
    name = recipe_name,
    icon = icon_path,
    subgroup = "py-veganism-filament",
    ingredients = py.merge(ingredients, extra_ingredients),
    results = {
      {
        type = "fluid",
        name = filament_name,
        amount = filament_amount * math.pow(COST_BASE, cost_factor)
      }
    }
  }
end

local new_recipe = py_veganism_globals.generate_new_automatic_filament_recipe(
  "vrauk-filament-vegan", -- Name
  "__pyveganism__/graphics/icons/filaments/vrauk-filament.png", -- Filament Icon
  {}, -- Extra ingredients
  1, -- Scalar value
  "vrauk-filament", -- Filament name
  {59/255, 121/255, 88/255}, -- Filament Color
  100, -- Filament Amount

  "vrauks", -- Main Product
  { -- Ingredient Costs
    ["native-flora"] = 9.57,
    ["moss"] = 2.55,
    ["saps"] = 10,
    ["water"] = 0.01,
    ["barrel"] = 0,
  },
  0, -- Cost factor
  "vrauks-1", -- Original Recipe
  {["cocoon"] = "vrauks-cocoon-1", ["water-barrel"] = "water-barrel"} -- Sub recipes
)
new_recipe.category = "bio-printer"

log("New recipe: " .. serpent.block(new_recipe))

data:extend{
  new_recipe
}
