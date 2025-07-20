RECIPE {
    type = "recipe",
    name = "vegan-jerky",
    category = "smelting",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "pressed-tofu", amount = 1}
    },
    results = {
        {type = "item", name = "dried-meat", amount = 1},
    },
    icons = {
        {icon = "__pyalienlifegraphics__/graphics/icons/dried-meat.png", icon_size = 32},
        {icon = "__pyveganism__/graphics/icons/vegan-small.png", icon_size = 32}
    },
    subgroup = "py-veganism-guar",
    order = "aaa",
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "bio-scaffold-from-guar",
    category = "nmf",
    energy_required = 15,
    ingredients = {
        {
            type = "item",
            name = "guar-meal",
            amount = 5
        },
        {
            type = "item",
            name = "chitin",
            amount = 20
        },
        {
            type = "item",
            name = "sodium-alginate",
            amount = 1
        },
        {
            type = "fluid",
            name = "boric-acid",
            amount = 200,
        },
    },
    results = {
        {
            type = "item",
            name = "bio-scafold",
            amount = 1
        }
    },
    icons = {
        {icon = "__pyalienlifegraphics__/graphics/icons/bio-scafold.png", icon_size = 32},
        {icon = "__pyveganism__/graphics/icons/vegan-small.png", icon_size = 32}
    },
    subgroup = "py-veganism-guar",
    order = "aaa",
}:add_unlock("oil-plants")

require("vrauk-meat-alternatives")

py_veganism_globals.register_replace_ingredients("vrauks", "non-viable-vrauk-mass")

require("auog-meat-alternatives")

py_veganism_globals.register_replace_ingredients("auog", "non-viable-auog-mass")

require("cottongut-meat-alternatives")

py_veganism_globals.register_replace_ingredients("cottongut", "non-viable-cottongut-mass")
py_veganism_globals.replace_ingredients()
