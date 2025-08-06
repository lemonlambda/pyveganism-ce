local function get_main_product(results, name)
  log(serpent.block(results))
  for _, result in pairs(table.deepcopy(results)) do
    log(serpent.line(result))
    if result.name == name then
      result.amount = result.amount or (result.amount_min + result.amount_max) / 2
      return result
    end
  end
end

-- Gets the recipe costs by passing ingredients and sub_recipes
-- Uses the main_product_amount as a dividing factor
local function _get_recipe_costs(self_func, main_product_amount, ingredients, established_costs, sub_recipes)
  local costs = {}

  for _, ingredient in pairs(ingredients) do
    local individual_cost

    if sub_recipes[ingredient.name] and data.raw["recipe"][sub_recipes[ingredient.name]] then
      local recipe = RECIPE(sub_recipes[ingredient.name])
      local sub_ingredients = recipe.ingredients
      local main_product = get_main_product(recipe.results, ingredient.name)

      local additional_costs = self_func(self_func, main_product.amount, sub_ingredients, established_costs, sub_recipes)

      for name, cost in pairs(additional_costs) do
        costs[name] = (costs[name] or 0) + cost
      end

      goto continue
    else
      individual_cost = established_costs[ingredient.name] or 0
    end

    costs[ingredient.name] = (costs[ingredient.name] or 0) + ((individual_cost * ingredient.amount) / main_product_amount)
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


function py_veganism_globals.create_partial_filament_recipe_from_trad(main_product_name, costs, trad_recipe_name, sub_recipes)
  local recipe = RECIPE(trad_recipe_name)
  local ingredients = recipe.ingredients
  local main_product = get_main_product(recipe.results, main_product_name)

  local trad_costs = get_recipe_costs(main_product.amount, ingredients, costs, sub_recipes)
  return trad_costs
end

local partial_recipe = py_veganism_globals.create_partial_filament_recipe_from_trad(
  "vrauks",
  {
    ["native-flora"] = 9.57,
    ["moss"] = 2.55,
    ["water-barrel"] = 0.01,
    ["saps"] = 10
  },
  "vrauks-1",
  {["cocoon"] = "vrauks-cocoon-1"}
)
log("Filament based off of Vrauk: " .. serpent.block(partial_recipe))
