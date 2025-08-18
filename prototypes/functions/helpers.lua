function py_veganism_globals.remove_improper_ingredients(ingredients)
  local new_ingredients = table.deepcopy(ingredients)
  local remove_count = 0
  for k,v in pairs(ingredients) do
    -- log(k .. ": " .. serpent.block(v))
    if v.amount == nil or v == nil or v.amount < 1 then
      -- log("removed: " .. k)
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

    -- log("Ingredient Pairs: " .. serpent.block(ingredient_pairs))
    
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

local ingredients_to_replace = {}
local caged = {}

function py_veganism_globals.register_replace_ingredients(from, to)
    ingredients_to_replace[from] = to
end

function py_veganism_globals.register_replace_ingredients_caged(from, to, container)
    ingredients_to_replace[from] = to
    caged[to] = container
end

local caching = false
local cached = {}
local tech_unlocked_cached = {}

-- Define this somewhere global
local blacklisted_recipes = {
    ["cottongut-cub-1"] = true,
    ["cottongut-cub-2"] = true,
    ["cottongut-cub-3"] = true,
    ["cottongut-cub-4"] = true,
    ["full-render-cottongut"] = true,
    ["cottongut-improved-growth-enhancement-1"] = true,
    ["cottongut-improved-growth-enhancement-2"] = true,
    ["cottongut-improved-growth-enhancement-3"] = true,
    ["cottongut-improved-growth-enhancement-4"] = true,
    ["cottongut-improved-growth-enhancement-5"] = true,
    ["cottongut-improved-growth-enhancement-6"] = true,
    ["cottongut-improved-growth-enhancement-7"] = true,
    -- ["arqad-egg-nests-1"] = true,
    -- ["arqad-egg-nests-2"] = true,
    -- ["arqad-egg-nests-3"] = true,
    -- ["arqad-egg-nests-4"] = true,
    ["arqad-egg-1"] = true,
    ["arqad-egg-1-cold"] = true,
    ["arqad-egg-2"] = true,
    ["arqad-egg-2-cold"] = true,
    ["arqad-egg-3"] = true,
    ["arqad-egg-3-cold"] = true,
    ["arqad-egg-4"] = true,
    ["arqad-egg-4-cold"] = true,
    ["arqad-egg-5"] = true,
    ["arqad-egg-5-cold"] = true,
    ["charged-auog"] = true,
}

function py_veganism_globals.replace_ingredients()
    if caching and #cached > 0 then
        data:extend(cached)
        return
    end

    local changed_recipes = {}
    local changed_effects = {}

    for name, recipe in pairs(data.raw.recipe) do
        -- Skip manually blacklisted recipes
        if blacklisted_recipes[name] then
            goto continue
        end

        if string.find(name, "caged") then
            goto continue
        end

        if not recipe.ingredients or not recipe.results then
            goto continue
        end

        if recipe.category == "slaughterhouse" then
            goto continue
        end

        local new_recipe = nil
        local modified = false
        local cage_return_amount = {}

        -- Replace ingredients
        for i, ingredient in pairs(recipe.ingredients) do
            for from, to in pairs(ingredients_to_replace) do
                if ingredient.name == from then
                    if not modified then
                        new_recipe = table.deepcopy(recipe)
                        new_recipe.name = name .. "-vegan"
                        modified = true
                    end
                    new_recipe.ingredients[i].name = to
                    if caged[to] then
                        cage_return_amount[caged[to]] = (cage_return_amount[caged[to]] or 0) + new_recipe.ingredients[i].amount
                    end
                end
            end
        end

        if not modified then
            goto continue
        end

        local has_cage = false
        -- Replace results
        for i, result in pairs(recipe.results) do
            for from, to in pairs(ingredients_to_replace) do
                if result.name == from then
                    if not modified then
                        new_recipe = table.deepcopy(recipe)
                        new_recipe.name = name .. "-vegan"
                        modified = true
                    end
                    new_recipe.results[i].name = to
                    if new_recipe.main_product == from then
                        new_recipe.main_product = to
                    end
                end

                if res_name == "cage" and caged[to] and modified then
                    has_cage = true
                    new_recipe.results[i].name = caged[to]
                end

                -- Change the main_product
            end
        end


        if not has_cage and modified then
            for name, amount in pairs(cage_return_amount) do
                if new_recipe.main_product ~= nil then
                    if amount > 0 then
                        table.insert(new_recipe.results, {
                            type = "item",
                            name = name,
                            amount = amount
                        })
                    end
                end
            end
        end

        if modified and not data.raw.recipe[new_recipe.name] then
            for _, technology in pairs(data.raw.technology) do
                for _, unlock in pairs(technology.effects) do
                    if unlock.type ~= "unlock-recipe" then
                        goto tech_continue
                    end

                    if unlock.recipe == name then
                        changed_effects[technology.name] = {
                            type = "unlock-recipe",
                            recipe = new_recipe.name
                        }
                    
                        table.insert(technology.effects, {
                            type = "unlock-recipe",
                            recipe = new_recipe.name
                        })
                    end
                
                    ::tech_continue::
                end
            end

            log("New vegan recipe replacement: " .. serpent.block(new_recipe))
            RECIPE(new_recipe)
            table.insert(changed_recipes, new_recipe)
        end

        ::continue::
    end

    log("New cached recipes: " .. serpent.line(changed_recipes))
    log("New cached tech effects: " .. serpent.line(changed_recipes))
end
