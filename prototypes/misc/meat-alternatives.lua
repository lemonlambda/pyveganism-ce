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
