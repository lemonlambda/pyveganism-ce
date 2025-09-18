require("prototypes.updates.py-changes")
require("prototypes.updates.hardcore-modes")
require("prototypes.automatic-cost-balancer")
require("prototypes.filaments")

-- Regenerate the barreling recipes
for f, _ in pairs(data.raw.fluid) do
    for i, recipe_name in pairs {
        "empty-" .. f .. "-canister",
        "empty-" .. f .. "-barrel",
        "fill-" .. f .. "-canister",
        f .. "-barrel"
    } do
        local recipe = data.raw.recipe[recipe_name] and RECIPE(recipe_name)
        if recipe ~= nil then
            recipe:set_fields { hide_from_player_crafting = true, hide_from_stats = true }
            -- This is backwards, I blame king
            if recipe_name:match("^empty") then
                recipe.category = "py-barreling"
            else
                recipe.category = "py-unbarreling"
            end
        end
    end
end

if register_cache_file ~= nil then
    register_cache_file({ "pycoalprocessing", "pyfusionenergy", "pyindustry", "pyrawores", "pyhightech", "pypetroleumhandling", "pyalienlife", "pyalternativeenergy", "pyveganism" }, "__pyveganism__/cached-configs/pyalienlife+pyalternativeenergy+pycoalprocessing+pyfusionenergy+pyhightech+pyindustry+pypetroleumhandling+pyrawores+pyveganism")
end
