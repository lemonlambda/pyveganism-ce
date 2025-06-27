RECIPE {
    type = "recipe",
    name = "grow-calknut-palm",
    category = "nursery",
    enabled = false,
    energy_required = 60,
    ingredients = {
        {type = "item", name = "soil", amount = 10},
        {type = "fluid", name = "water", amount = 500}
    },
    results = {
        {type = "item", name = "calknut", amount = 10},
        {type = "item", name = "plant-residues", amount = 2}
    },
    main_product = "calknut",
    icons = {
        {icon = "__pyveganism__/graphics/icons/grow-calknut-palm.png"},
        {icon = "__pyveganism__/graphics/icons/grow.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-calknut",
    order = "aba"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "core-calknut",
    category = "crafting",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "calknut", amount = 20}
    },
    results = {
        {type = "item", name = "copra", amount = 20},
        {type = "item", name = "plant-residues-dry", amount = 4}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/calknut.png"},
        {icon = "__pyveganism__/graphics/icons/crack-open.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-calknut",
    order = "aaa"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "halve-copra",
    category = "crafting",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "item", name = "copra", amount = 3}
    },
    results = {
        {type = "item", name = "copra-halved", amount = 1}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/copra.png"},
        {icon = "__pyveganism__/graphics/icons/crack-open.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-calknut",
    order = "aab"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "dry-copra",
    category = "evaporator",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "copra-halved", amount = 10}
    },
    results = {
        {type = "item", name = "copra-halved-dry", amount = 10}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/copra-halved.png"},
        {icon = "__pyveganism__/graphics/icons/hyperthermic-stress.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-calknut",
    order = "aac"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "press-copra",
    category = py_veganism_globals["plant_oil_pressing_category"],
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "copra-halved-dry", amount = 10}
    },
    results = {
        {type = "item", name = "calknut-butter", amount = 10},
        {type = "item", name = "plant-residues-dry", amount = 4}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/copra-halved-dry.png"},
        {icon = "__pyveganism__/graphics/icons/pressing.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-calknut",
    order = "aad"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "refine-calknut-butter",
    category = py_veganism_globals["plant_oil_refining_category"],
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "calknut-butter", amount = 10},
        {type = "fluid", name = "vacuum", amount = 50},
        {type = "fluid", name = "steam", amount = 200}
    },
    results = {
        {type = "item", name = "solid-fat", amount = 7},
        {type = "fluid", name = "plant-oil", amount = 84}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/calknut-butter.png"},
        {icon = "__pyveganism__/graphics/icons/steam-refining.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-calknut",
    order = "aad"
}:add_unlock("oil-plants")
