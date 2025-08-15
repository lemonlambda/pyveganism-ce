--<< Processing >>
RECIPE {
    type = "recipe",
    name = "wash-guar",
    category = "washer",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "guar", amount = 20},
        {type = "fluid", name = "water", amount = 200}
    },
    results = {
        {type = "item", name = "guar-pods-washed", amount = 20},
        {type = "fluid", name = "tailings", amount = 200}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-pods.png"},
        {icon = "__pyveganism__/graphics/icons/washing.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aaa"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "core-guar",
    category = "crafting",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "guar-pods-washed", amount = 10}
    },
    results = {
        {type = "item", name = "edamame", amount = 30},
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-pods-washed.png"},
        {icon = "__pyveganism__/graphics/icons/crack-open.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aab"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "ripen-edamame",
    category = "crafting",
    enabled = false,
    energy_required = 40,
    ingredients = {
        {type = "item", name = "edamame", amount = 300}
    },
    results = {
        {type = "item", name = "guarbeans", amount = 300}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-beans.png"},
        {icon = "__pyveganism__/graphics/icons/time.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aac"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "press-guarbeans",
    category = py_veganism_globals.plant_oil_pressing_category,
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "guarbeans", amount = 15}
    },
    results = {
        {type = "fluid", name = "plant-oil", amount = 35},
        {type = "item", name = "solid-fat", amount = 1},
        {type = "item", name = "guar-meal", amount = 5}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-beans.png"},
        {icon = "__pyveganism__/graphics/icons/pressing.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aad"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "guar-milk",
    category = "hpf",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "guarbeans", amount = 5},
        {type = "fluid", name = "sterile-water", amount = 100}
    },
    results = {
        {type = "fluid", name = "guar-milk", amount = 100},
        {type = "item", name = "guar-meal", amount = 1}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-milk.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aaf"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "tofu",
    category = "hpf",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "guar-milk", amount = 80},
        {type = "item", name = "citric-acid", amount = 15}
    },
    results = {
        {type = "item", name = "tofu-block", amount = 5},
        {type = "item", name = "yuba", amount = 5}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/tofu-block.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aag"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "tempeh",
    category = "bio-reactor",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "guarbeans", amount = 20},
        {type = "fluid", name = "proxae", amount = 50}
    },
    results = {
        {type = "item", name = "tempeh", amount = 5}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/tempeh.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aah"
}:add_unlock("oil-plants")
