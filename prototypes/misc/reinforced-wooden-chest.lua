ITEM {
    type = "item",
    name = "reinforced-wooden-chest",
    icon = "__pyveganism__/graphics/icons/reinforced-wooden-chest.png",
    icon_size = 64,
    subgroup = "storage",
    stack_size = 30,
}

RECIPE {
    type = "item",
    name = "reinforced-wooden-chest",
    icon = "__pyveganism__/graphics/icons/reinforced-wooden-chest.png",
    icon_size = 64,
    subgroup = "storage",
    enabled = false,
    ingredients = {
        {
            type = "item",
            name = "log",
            amount = 10,
        },
        {
            type = "item",
            name = "steel-plate",
            amount = 10,
        },
        {
            type = "item",
            name = "titanium-plate",
            amount = 7
        },
    },
    results = {
        {
            type = "item",
            name = "reinforced-wooden-chest",
            amount = 1
        }
    },
}:add_unlock("alloys-mk01")
