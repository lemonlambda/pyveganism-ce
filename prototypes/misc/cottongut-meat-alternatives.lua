py_veganism_globals.non_viable_cottongut_mass_icon = {
    {icon = "__pyveganism__/graphics/icons/burlap-sack.png", icon_size = 64},
    {icon = "__pyveganism__/graphics/icons/cottongut-gray.png", icon_size = 64, scale = 0.25, shift = {0, 3}},
}

ITEM {
    type = "item",
    name = "non-viable-cottongut-mass",
    icons = py_veganism_globals.non_viable_cottongut_mass_icon,
    subgroup = "py-veganism-cottongut",
    enabled = false,
    stack_size = 200,
}

ITEM {
    type = "item",
    name = "cottongut-fur-tuft",
    icon = "__pyveganism__/graphics/icons/fur-tuft-gray.png", icon_size = 64, tint = {217/255, 232/255, 232/255},
    icon_size = 64,
    subgroup = "py-veganism-cottongut",
    enabled = false,
    stack_size = 100,
}

ITEM {
    type = "item",
    name = "brush",
    icon = "__pyveganism__/graphics/icons/brush.png",
    icon_size = 64,
    subgroup = "py-veganism-cottongut",
    enabled = false,
    stack_size = 25,
}

RECIPE {
    type = "recipe",
    name = "brush",
    icon = "__pyveganism__/graphics/icons/brush.png",
    icon_size = 64,
    ingredients = {
        {
            type = "item",
            name = "hot-iron-stick",
            amount = 5
        },
        {
            type = "item",
            name = "plastic-bar",
            amount = 2
        }
    },
    results = {
        {
            type = "item",
            name = "brush",
            amount = 1
        }
    }
}:add_unlock("cottongut-mk01")

RECIPE {
    type = "recipe",
    name = "cottongut-fur-tuft-1",
    icons = {
        {icon = "__pyveganism__/graphics/icons/fur-tuft-gray.png", icon_size = 64, tint = {217/255, 232/255, 232/255}},
        {icon = "__pyalienlifegraphics__/graphics/icons/1.png", icon_size = 64, scale = .25, shift = {-8, 8}},
    },
    enabled = false,
    energy_required = 60.0,
    subgroup = "py-veganism-cottongut",
    category = "cottongut",
    ingredients = {
        {
            type = "item",
            name = "water-barrel",
            amount = 2
        },
        {
            type = "item",
            name = "wood-seeds",
            amount = 4,
        },
        {
            type = "item",
            name = "ralesia-seeds",
            amount = 3
        },
        {
            type = "item",
            name = "moondrop",
            amount = 4
        },
    },
    results = {
        {
            type = "item",
            name = "barrel",
            amount = 2,
        },
        {
            type = "item",
            name = "cottongut-fur-tuft",
            amount = 2
        },
    }
}:add_unlock("cottongut-mk01")

RECIPE {
    type = "recipe",
    name = "cottongut-fur-tuft-2",
    icons = {
        {icon = "__pyveganism__/graphics/icons/fur-tuft-gray.png", icon_size = 64, tint = {217/255, 232/255, 232/255}},
        {icon = "__pyalienlifegraphics__/graphics/icons/2.png", icon_size = 64, scale = .25, shift = {-8, 8}},
    },
    enabled = false,
    energy_required = 30.0,
    subgroup = "py-veganism-cottongut",
    category = "cottongut",
    ingredients = {
        {
            type = "item",
            name = "water-barrel",
            amount = 2
        },
        {
            type = "item",
            name = "wood-seeds",
            amount = 4,
        },
        {
            type = "item",
            name = "ralesia-seeds",
            amount = 3
        },
        {
            type = "item",
            name = "moondrop",
            amount = 4
        },
        {
            type = "item",
            name = "brush",
            amount = 5,
        }
    },
    results = {
        {
            type = "item",
            name = "barrel",
            amount = 2,
        },
        {
            type = "item",
            name = "cottongut-fur-tuft",
            amount = 20
        },
        {
            type = "item",
            name = "brush",
            amount = 4
        },
        {
            type = "item",
            name = "brush",
            amount = 1,
            probability = 0.8
        }
    }
}:add_unlock("cottongut-mk01")

py_veganism_globals.repetitive_recipe(1, 3, {
    {
        type = "item",
        name = "bio-sample",
        amount = 5,
    },
    {
        type = "item",
        name = "earth-generic-sample",
        amount = 5,
    },
    {
        type = "item",
        name = "earth-mouse-sample",
        amount = 1,
    },
    {
        type = "item",
        name = "cottongut-codex",
        amount = 1,
    },
    {
        type = "fluid",
        name = "water",
        amount = 1000,
    },
    {
        type = "item",
        name = "sack",
        amount = 1
    }
    }, function(i, ingredient_pairs)
    local additional = {
        cottonguts_prod = 0
    }

    if i == 1 then
        additional.energy_required = 7

        ingredient_pairs["sack"].amount = 6
        ingredient_pairs["ralesia"] = {
            type = "item",
            name = "ralesia",
            amount = 7
        }
        ingredient_pairs["moondrop"] = {
            type = "item",
            name = "moondrop",
            amount = 4
        }

        additional.cottonguts_additional_output = 5
    elseif i == 2 then
        ingredient_pairs["sack"].amount = 2
        ingredient_pairs["non-viable-cottongut-mass"] = {
            type = "item",
            name = "non-viable-cottongut-mass",
            amount = 2
        }
        ingredient_pairs["earth-mouse-sample"].amount = 0
        ingredient_pairs["earth-generic-sample"].amount = 0
        ingredient_pairs["moondrop"] = {
            type = "item",
            name = "moondrop",
            amount = 4
        }
        ingredient_pairs["iron-plate"] = {
            type = "item",
            name = "iron-plate",
            amount = 3
        }

        additional.cottonguts_additional_output = 3
    elseif i == 3 then
        ingredient_pairs["sack"].amount = 12
        additional.energy_required = 20
        
        ingredient_pairs["fawogae-substrate"] = {
            type = "item",
            name = "fawogae-substrate",
            amount = 1
        }
        ingredient_pairs["moondrop"] = {
            type = "item",
            name = "moondrop",
            amount = 3
        }

        additional.cottonguts_prod = 1
    end
    
    return ingredient_pairs, additional
end, function(i, ingredients, counts, additional)
    local icons = table.deepcopy(py_veganism_globals.non_viable_cottongut_mass_icon)
    table.insert(icons,
        {icon = "__pyalienlifegraphics__/graphics/icons/" .. i .. ".png", icon_size = 64, scale = .25, shift = {-8, 8}}
    )

    RECIPE {
        type = "recipe",
        name = "synthetic-non-viable-cottongut-mass-" .. i,
        category = "bio-printer",
        enabled = false,
        energy_required = additional.energy_required or 15,
        ingredients = ingredients,
        results = py_veganism_globals.remove_improper_ingredients({
            {
                type = "item",
                name = "non-viable-cottongut-mass",
                amount = 1 + (additional.cottonguts_additional_output or 0),
            },
            {
                type = "item",
                name = "non-viable-cottongut-mass",
                probability = 0.9,
                amount = 1 * additional.cottonguts_prod,
            },
            {
                type = "item",
                name = "non-viable-cottongut-mass",
                probability = 0.7,
                amount = 2 * additional.cottonguts_prod,
            },
            {
                type = "item",
                name = "non-viable-cottongut-mass",
                probability = 0.5,
                amount = 2 * additional.cottonguts_prod,
            },
            {
                type = "item",
                name = "non-viable-cottongut-mass",
                probability = 0.3,
                amount = 3 * additional.cottonguts_prod,
            },
            {
                type = "item",
                name = "non-viable-cottongut-mass",
                probability = 0.1,
                amount = 3 * additional.cottonguts_prod,
            },
            {
                type = "item",
                name = "cottongut-codex",
                amount = 1,
                probability = 0.99,
            },
        }),
        icons = icons,
        subgroup = "py-veganism-vrauk",
        allow_speed = true,
        allow_productivity = true,
        allow_efficiency = true,
        allowed_module_categories = {"vrauks"},
        order = "aaa",
    }:add_unlock("cottongut-mk01")
end)

local new_icon = table.deepcopy(py_veganism_globals.non_viable_cottongut_mass_icon)
table.insert(new_icon, {
    icon = "__pyveganism__/graphics/icons/rendering.png",
    icon_size = 64,
})
RECIPE {
    type = "recipe",
    name = "render-non-viable-cottongut-mass",
    category = "slaughterhouse",
    energy_required = 10,
    ingredients = {
        {
            type = "item",
            name = "non-viable-cottongut-mass",
            amount = 1
        }
    },
    results = {
        {
            type = "item",
            name = "meat",
            amount = 1
        },
        {
            type = "item",
            name = "guts",
            amount = 1
        },
        {
            type = "item",
            name = "brain",
            amount = 1,
            probability = .5,
        },
        {
            type = "item",
            name = "skin",
            amount = 1
        },
        {
            type = "item",
            name = "bones",
            amount = 1,
        },
        {
            type = "fluid",
            name = "blood",
            amount = 5,
        },
        {
            type = "item",
            name = "sack",
            amount = 1
        }
    },
    icons = new_icon,
    subgroup = "py-veganism-cottongut",
}
