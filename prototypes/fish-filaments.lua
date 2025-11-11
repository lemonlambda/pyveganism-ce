py_veganism_globals.register_replace_ingredients_caged("fish", "non-viable-fish-fluid-barrel", "barrel")
py_veganism_globals.create_recipe(
    "fish",
    {},
    py_veganism_globals.hex2rgb("#3e597f"),

    py_veganism_globals.costs,
    "breed-fish-1",
    py_veganism_globals.sub_recipes,
    {
        codex_name = "seaweed",
        result_probability = 1,
        result_alive_probability = 1,
        result_multiplier = 1,
        result_alive_multiplier = 1,
        nvm_name = "non-viable-fish-fluid-barrel",
        special_container = "barrel",
        module_category = "fish"
    },
    false
)

local unviable_fish_eggs = table.deepcopy(data.raw.item["fish-egg"])
unviable_fish_eggs.name = "unviable-fish-egg"
unviable_fish_eggs.icons = {
    { icon = unviable_fish_eggs.icon },
    { icon = "__pyveganism__/graphics/icons/vegan.png" }
}
unviable_fish_eggs.icon = nil
ITEM(unviable_fish_eggs)

py_veganism_globals.register_replace_ingredients("fish-egg", "unviable-fish-egg")
RECIPE {
    type = "recipe",
    name = "print-fish-egg",
    category = "bio-printer",
    energy_required = 60,
    subgroup = "py-veganism-fish1",
    ingredients = {
        {
            type = "fluid",
            name = "fish-filament",
            amount = 50
        },
    },
    results = {
        {
            type = "item",
            name = "unviable-fish-egg",
            amount = 25
        }
    },
}:add_unlock("fish-mk01")
RECIPE {
    type = "recipe",
    name = "print-fish-egg",
    category = "bio-printer",
    energy_required = 60,
    subgroup = "py-veganism-fish1",
    ingredients = {
        {
            type = "fluid",
            name = "water-saline",
            amount = 400
        },
        {
            type = "item",
            name = "seaweed",
            amount = 50
        },
        {
            type = "fluid",
            name = "oxygen",
            amount = 100
        }
    },
    results = {
        {
            type = "item",
            name = "unviable-fish-egg",
            amount = 1
        }
    },
}:add_unlock("fish-mk01")
