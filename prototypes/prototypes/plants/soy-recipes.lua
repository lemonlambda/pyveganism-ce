--<< Growing >>
RECIPE {
    type = "recipe",
    name = "grow-guar",
    category = "nursery",
    enabled = false,
    energy_required = 60,
    ingredients = {
        {type = "item", name = "soil", amount = 10},
        {type = "fluid", name = "water", amount = 500}
    },
    results = {
        {type = "item", name = "guar-pods", amount = 10},
        {type = "item", name = "plant-residues", amount = 2}
    },
    main_product = "guar-pods",
    icons = {
        {icon = "__pyveganism__/graphics/icons/grow-guar.png"},
        {icon = "__pyveganism__/graphics/icons/grow.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aca"
}:add_unlock("oil-plants"):add_unlock("protein-plants")

--<< Processing >>
RECIPE {
    type = "recipe",
    name = "wash-guar",
    category = "washer",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "guar-pods", amount = 20},
        {type = "fluid", name = "water", amount = 200}
    },
    results = {
        {type = "item", name = "guar-pods-washed", amount = 20},
        {type = "fluid", name = "dirty-water-light", amount = 200}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-pods.png"},
        {icon = "__pyveganism__/graphics/icons/washing.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aaa"
}:add_unlock("oil-plants"):add_unlock("protein-plants")

RECIPE {
    type = "recipe",
    name = "core-guar-pods",
    category = "crafting",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "guar-pods-washed", amount = 10}
    },
    results = {
        {type = "item", name = "edamame", amount = 30},
        {type = "item", name = "plant-residues", amount = 5}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-pods-washed.png"},
        {icon = "__pyveganism__/graphics/icons/crack-open.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aab"
}:add_unlock("oil-plants"):add_unlock("protein-plants")

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
        {icon = "__pyveganism__/graphics/icons/guarbeans.png"},
        {icon = "__pyveganism__/graphics/icons/time.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aac"
}:add_unlock("oil-plants"):add_unlock("protein-plants")

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
        {icon = "__pyveganism__/graphics/icons/guarbeans.png"},
        {icon = "__pyveganism__/graphics/icons/pressing.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aad"
}:add_unlock("oil-plants")

--[[RECIPE {
    type = "recipe",
    name = "declassify-guar-meal",
    category = "crafting",
    enabled = false,
    energy_required = 0.05,
    ingredients = {
        {type = "item", name = "guar-meal", amount = 10}
    },
    results = {
        {type = "item", name = "plant-residues-dry", amount = 1}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-meal.png"},
        {icon = "__pyveganism__/graphics/icons/arrow-down.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aae"
}:add_unlock("oil-plants")]]

RECIPE {
    type = "recipe",
    name = "guar-milk",
    category = "hpf",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "guarbeans", amount = 5},
        {type = "fluid", name = "clean-water", amount = 100}
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
}:add_unlock("protein-plants")

RECIPE {
    type = "recipe",
    name = "tofu",
    category = "hpf",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "guar-milk", amount = 80},
        {type = "fluid", name = "citric-acid", amount = 15}
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
}:add_unlock("protein-plants")

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
}:add_unlock("protein-plants")

--<< Extraction Recipes >>
RECIPE {
    type = "recipe",
    name = "extract-protein-guar-meal",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "guar-meal", amount = 10},
        {type = "fluid", name = "ethanol-solution", amount = 40}
    },
    results = {
        {type = "item", name = "protein", amount = 9}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/guar-meal.png"},
        {icon = "__pyveganism__/graphics/icons/refine.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "aba"
}:add_unlock("protein-plants")

RECIPE {
    type = "recipe",
    name = "extract-protein-tofu-block",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "tofu-block", amount = 10},
        {type = "fluid", name = "ethanol-solution", amount = 40}
    },
    results = {
        {type = "item", name = "protein", amount = 4}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/tofu-block.png"},
        {icon = "__pyveganism__/graphics/icons/refine.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "abb"
}:add_unlock("protein-plants")

RECIPE {
    type = "recipe",
    name = "extract-protein-yuba",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "yuba", amount = 10},
        {type = "fluid", name = "ethanol-solution", amount = 40}
    },
    results = {
        {type = "item", name = "protein", amount = 1}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/yuba.png"},
        {icon = "__pyveganism__/graphics/icons/refine.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "abc"
}:add_unlock("protein-plants")

RECIPE {
    type = "recipe",
    name = "extract-protein-tempeh",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "tempeh", amount = 10},
        {type = "fluid", name = "ethanol-solution", amount = 40}
    },
    results = {
        {type = "item", name = "protein", amount = 17}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/tempeh.png"},
        {icon = "__pyveganism__/graphics/icons/refine.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-guar",
    order = "abd"
}:add_unlock("protein-plants")
