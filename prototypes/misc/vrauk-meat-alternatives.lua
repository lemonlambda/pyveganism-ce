py_veganism_globals.repetitive_recipe(1, 3, {
    {
        type = "item",
        name = "native-flora",
        amount = 10,
    },
    {
        type = "item",
        name = "agar",
        amount = 10,
    },
    {
        type = "item",
        name = "moss-gen",
        amount = 1,
    },
    {
        type = "item",
        name = "saps",
        amount = 5,
    },
    {
        type = "item",
        name = "vrauks-codex",
        amount = 1
    }
}, function(i, ingredient_pairs)
    local additional = {}

    if i == 2 then
        ingredient_pairs["saps"].amount = 15
        
        additional.meat_amount = 3
        additional.guts_amount = 1
    elseif i == 3 then
        ingredient_pairs["native-flora"].amount = 25
        
        additional.meat_amount = 1
        additional.guts_amount = 3
    end
    
    return ingredient_pairs, additional
end, function(i, ingredients, counts, additional)
    RECIPE {
        type = "recipe",
        name = "synthetic-vrauk-meat-" .. i,
        category = "bio-printer",
        enabled = false,
        hidden = settings.startup["pyveganism-old-recipes"] and settings.startup["pyveganism-old-recipes"].value,
        energy_required = 30,
        ingredients = ingredients,
        results = {
            {
                type = "item",
                name = "meat",
                amount = additional.meat_amount or 2
            },
            {
                type = "item",
                name = "guts",
                amount = additional.guts_amount or 2
            },
            {
                type = "item",
                name = "vrauks-codex",
                amount = 1,
                probability = 0.99,
            },
        },
        icons = {
            {icon = "__pyalienlifegraphics__/graphics/icons/vrauks.png", icon_size = 64},
            {icon = "__pyveganism__/graphics/icons/vegan.png", icon_size = 64},
            {icon = "__pyalienlifegraphics__/graphics/icons/" .. i .. ".png", icon_size = 64, scale = .25, shift = {-8, 8}},
        },
        subgroup = "py-veganism-vrauk",
        allow_speed = true,
        allow_productivity = true,
        allow_efficiency = true,
        allowed_module_categories = {"vrauks"},
        order = "aaa",
    }:add_unlock("vrauks")
end)

py_veganism_globals.non_viable_vrauk_mass_icon = {
    {icon = "__pyveganism__/graphics/icons/burlap-sack.png", icon_size = 64},
    {icon = "__pyveganism__/graphics/icons/vrauks-gray.png", icon_size = 64, scale = 0.25, shift = {0, 3}},
}

ITEM {
    type = "item",
    name = "non-viable-vrauks-mass",
    icons = py_veganism_globals.non_viable_vrauk_mass_icon,
    subgroup = "py-veganism-vrauk",
    enabled = false,
    stack_size = 200,
}

py_veganism_globals.repetitive_recipe(1, 3,
    {
        {
            type = "item",
            name = "native-flora",
            amount = 10,
        },
        {
            type = "item",
            name = "petri-dish",
            amount = 5,
        },
        {
            type = "item",
            name = "moss-gen",
            amount = 3,
        },
        {
            type = "item",
            name = "saps",
            amount = 5,
        },
        {
            type = "item",
            name = "earth-generic-sample",
            amount = 2,
        },
        {
            type = "item",
            name = "vrauks-codex",
            amount = 1
        },
        {
            type = "item",
            name = "sack",
            amount = 1
        }
    }, function(i, ingredient_pairs)
        local additional = {
            energy_required = 200
        }
        
        if i == 1 then
            ingredient_pairs["vrauk-molt"] = {
                type = "item",
                name = "vrauk-molt",
                amount = 2
            }
        elseif i == 2 then
            ingredient_pairs["petri-dish"] = {
                type = "item",
                name = "agar",
                amount = 10
            }
            ingredient_pairs["vrauk-molt"] = {
                type = "item",
                name = "vrauk-molt",
                amount = 4
            }
            ingredient_pairs["earth-generic-sample"] = {
                type = "item",
                name = "earth-generic-sample",
                amount = 1,
                probability = 0.45
            }
            additional.nvm_vrauk_probability = 0.60
            additional.earth_generic_sample_amount = 1
            additional.earth_generic_sample_probability = .65
            additional.vrauks_codex_probability = .85
        elseif i == 3 then
            ingredient_pairs["native-flora"] = {
                type = "item",
                name = "native-flora",
                amount = 25
            }
            ingredient_pairs["carbon-dioxide"] = {
                type = "fluid",
                name = "carbon-dioxide",
                amount = 250
            }
            ingredient_pairs["petri-dish"] = {
                type = "item",
                name = "petri-dish",
                amount = 10
            }
            ingredient_pairs["water"] = {
                type = "fluid",
                name = "water",
                amount = 1000
            }
            ingredient_pairs["tar"] = {
                type = "fluid",
                name = "tar",
                amount = 15
            }
            ingredient_pairs["sack"].amount = 15
            additional.nvm_vrauk_amount = 15
            additional.earth_generic_sample_amount = 0
            additional.vrauks_codex_amount = 0
        end

        return ingredient_pairs, additional
    end, function(i, ingredients, counts, additional)
        local icons = table.deepcopy(py_veganism_globals.non_viable_vrauk_mass_icon)
        table.insert(icons,
            {icon = "__pyalienlifegraphics__/graphics/icons/" .. i .. ".png", icon_size = 64, scale = .25, shift = {-8, 8}}
        )
    
        RECIPE {
            type = "recipe",
            name = "synthetic-non-viable-vrauks-mass-" .. i,
            category = "bio-printer",
            enabled = false,
            hidden = settings.startup["pyveganism-old-recipes"] and settings.startup["pyveganism-old-recipes"].value,
            energy_required = additional.energy_required,
            ingredients = ingredients,
            results = py_veganism_globals.remove_improper_ingredients({
                {
                    type = "item",
                    name = "non-viable-vrauks-mass",
                    amount = additional.nvm_vrauk_amount or 1,
                    probability = additional.nvm_vrauk_probability
                },
                {
                    type = "item",
                    name = "earth-generic-sample",
                    amount = additional.earth_generic_sample_amount or 2,
                    probability = additional.earth_generic_sample_probability or 0.85,
                },
                {
                    type = "item",
                    name = "vrauks-codex",
                    amount = additional.vrauks_codex_amount or 1,
                    probability = additional.vrauks_codex_probability or 0.99,
                },
            }),
            icons = icons,
            subgroup = "py-veganism-vrauk",
            enabled = false,
            allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
            allowed_module_categories = {"vrauks"},
        }:add_unlock("vrauks")
    end
)

local new_icon = table.deepcopy(py_veganism_globals.non_viable_vrauk_mass_icon)
table.insert(new_icon, {
    icon = "__pyveganism__/graphics/icons/rendering.png",
    icon_size = 64,
})
RECIPE {
    type = "recipe",
    name = "render-non-viable-vrauks-mass",
    category = "slaughterhouse",
    energy_required = 10,
    ingredients = {
        {
            type = "item",
            name = "non-viable-vrauks-mass",
            amount = 1
        }
    },
    results = {
        {
            type = "item",
            name = "meat",
            amount = 2
        },
        {
            type = "item",
            name = "guts",
            amount = 2
        },
        {
            type = "item",
            name = "brain",
            amount = 1
        },
        {
            type = "fluid",
            name = "formic-acid",
            amount = 150
        },
        {
            type = "item",
            name = "sack",
            amount = 1
        }
    },
    icons = new_icon,
    subgroup = "py-veganism-vrauk",
}
