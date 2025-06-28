ITEM {
    type = "item",
    name = "pressed-tofu",
    enabled = false,
    icon = "__pyveganism__/graphics/icons/pressed-tofu.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-veganism-guar",
    order = "aae",
    stack_size = 200
}

RECIPE {
    type = "recipe",
    name = "press-tofu",
    category = py_veganism_globals.plant_oil_pressing_category,
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "tofu-block", amount = 15}
    },
    results = {
        {type = "fluid", name = "plant-oil", amount = 35},
        {type = "item", name = "pressed-tofu", amount = 15},
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/tofu-block.png"},
        {icon = "__pyveganism__/graphics/icons/pressing.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aae",
}:add_unlock("oil-plants")
