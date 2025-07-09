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

ITEM {
    type = "item",
    name = "auog-approved-reinforced-wooden-chest",
    icons = {
        {icon = "__pyveganism__/graphics/icons/reinforced-wooden-chest.png", icon_size = 64},
        {icon = "__pyveganism__/graphics/icons/claws.png", icon_size = 64, scale = 0.2, shift = {0, 8}},
    },
    subgroup = "storage",
    stack_size = 30,
}

RECIPE {
    type = "item",
    name = "auog-approved-reinforced-wooden-chest-1",
    icons = {
        {icon = "__pyveganism__/graphics/icons/reinforced-wooden-chest.png", icon_size = 64},
        {icon = "__pyveganism__/graphics/icons/claws.png", icon_size = 64, scale = 0.2, shift = {0, 8}},
    },
    category = "auog",
    subgroup = "storage",
    enabled = false,
    ingredients = {
        {
            type = "item",
            name = "reinforced-wooden-chest",
            amount = 1
        },
    },
    results = {
        {
            type = "item",
            name = "auog-approved-reinforced-wooden-chest",
            amount = 1,
            probability = 0.1
        }
    },
    energy_required = 30,
}:add_unlock("auog")

RECIPE {
    type = "item",
    name = "auog-approved-reinforced-wooden-chest-2",
    icons = {
        {icon = "__pyveganism__/graphics/icons/reinforced-wooden-chest.png", icon_size = 64},
        {icon = "__pyveganism__/graphics/icons/claws.png", icon_size = 64, scale = 0.2, shift = {0, 8}},
    },
    category = "crusher",
    subgroup = "storage",
    enabled = false,
    ingredients = {
        {
            type = "item",
            name = "reinforced-wooden-chest",
            amount = 1
        },
    },
    results = {
        {
            type = "item",
            name = "auog-approved-reinforced-wooden-chest",
            amount = 1,
            probability = 0.05
        }
    },
    energy_required = 10,
}:add_unlock("auog")
