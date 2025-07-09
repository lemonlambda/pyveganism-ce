function py_veganism_globals.remove_improper_ingredients(ingredients)
  local new_ingredients = table.deepcopy(ingredients)
  local remove_count = 0
  for k,v in pairs(ingredients) do
    log(k .. ": " .. serpent.block(v))
    if v.amount == nil or v == nil or v.amount < 1 then
      log("removed: " .. k)
      table.remove(new_ingredients, k - remove_count)
      remove_count = remove_count + 1
    end
  end
  return new_ingredients
end

-- py_veganism_globals.repetitive_recipe(1, 3,
--   {
--
--   }, function(i, ingredient_pairs)
--
--   end, function(i, ingredients, counts, additional)
--
--   end
-- )
function py_veganism_globals.repetitive_recipe(start, stop, ingredients, ingredients_func, recipe_func)
    local ingredient_pairs = {}

    for _, ingredient in pairs(ingredients) do
        ingredient_pairs[ingredient.name] = ingredient
    end

    log("Ingredient Pairs: " .. serpent.block(ingredient_pairs))
    
    for i=start,stop do
        local new_ingredient_pairs, additional = ingredients_func(i, table.deepcopy(ingredient_pairs))

        local normalize_ingredients = {}
        local ingredient_counts = {}

        for name,ingredient_data in pairs(new_ingredient_pairs) do
            if ingredient_data ~= nil then
                if ingredient_data.name == nil then
                    error("Ingredient name cannot be nil: " .. serpent.block(ingredient_data))
                end
                table.insert(normalize_ingredients, ingredient_data)
                ingredient_counts[ingredient_data.name] = ingredient_data.amount
            end
        end

        recipe_func(i, py_veganism_globals.remove_improper_ingredients(normalize_ingredients), ingredient_counts, additional)
    end
end

