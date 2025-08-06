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

-- Create's a partial filament recipe from a traditional recipe
-- @param main_product_name string The name of the main_product, for example: `vrauks`
-- @param costs table<string, number> A table of the associated costs of each ingredient
-- @param trad_recipe_name string the name of the traditional recipe
-- @param sub_recipes table<string, string> the name of the ingredient matched with it's traditional recipe, for example: `["cocoon"] = "vrauks-cocoon-1"`
function py_veganism_globals.create_partial_filament_recipe_from_trad(main_product_name, costs, trad_recipe_name, sub_recipes)
  local recipe = RECIPE(trad_recipe_name)
  local ingredients = recipe.ingredients
  local main_product = get_main_product(recipe.results, main_product_name)
  log("Main product " .. main_product.name .. " with amount: " .. main_product.amount)

  local trad_costs = get_recipe_costs(main_product.amount, ingredients, costs, sub_recipes)
  return trad_costs
end

local partial_recipe = py_veganism_globals.create_partial_filament_recipe_from_trad(
  -- Name of the main_product in the recipe
  "vrauks",
  -- List of ingredient-cost associated values
  {
    ["native-flora"] = 9.57,
    ["moss"] = 2.55,
    ["water-barrel"] = 0.01,
    ["saps"] = 10
  },
  -- The traditional recipe name
  "vrauks-1",
  -- The sub recipes used in the traditional recipe
  {["cocoon"] = "vrauks-cocoon-1"}
)
log("Filament based off of Vrauk: " .. serpent.block(partial_recipe))

local partial_recipe = py_veganism_globals.create_partial_filament_recipe_from_trad(
  -- Name of the main_product in the recipe
  "vrauks",
  -- List of ingredient-cost associated values
  {
    ["native-flora"] = 9.57,
    ["moss"] = 2.55,
    ["water-barrel"] = 0.01,
    ["saps"] = 10,
    ["wood-seeds"] = 2.95,
    ["fawogae"] = 0.46,
    ["agar"] = 17.70,
    ["cellulose"] = 7.73,
    ["steam"] = 0.02,
  },
  -- The traditional recipe name
  "vrauks-2",
  -- The sub recipes used in the traditional recipe
  {["cocoon"] = "vrauks-cocoon-2", ["vrauks-food-01"] = "vrauks-food-01"}
)
log("Filament based off of Vrauk 2: " .. serpent.block(partial_recipe))
