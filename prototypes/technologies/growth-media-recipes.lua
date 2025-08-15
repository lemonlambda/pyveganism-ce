--sterile water recipes
RECIPE {
    type = "recipe",
    name = "sterile-water-boiling",
    category = "hpf",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "water", amount = 150}
    },
    results = {
        {type = "fluid", name = "sterile-water", amount = 150}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/water-drop.png"},
        {icon = "__pyveganism__/graphics/icons/hyperthermic-stress.png"},
        {icon = "__pyveganism__/graphics/icons/1.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-media",
    order = "aaa",
    main_product = ""
}:add_unlock("growth-media-1")

RECIPE {
    type = "recipe",
    name = "sterile-water-chlorine",
    category = "chemistry",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "fluid", name = "water", amount = 600},
        {type = "fluid", name = "chlorine", amount = 10}
    },
    results = {
        {type = "fluid", name = "sterile-water", amount = 600}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/water-drop.png"},
        {icon = "__pyveganism__/graphics/icons/toxic-stress.png"},
        {icon = "__pyveganism__/graphics/icons/1.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-media",
    order = "aac",
    main_product = ""
}:add_unlock("growth-media-1")

RECIPE {
    type = "recipe",
    name = "sterile-water-chlorate",
    category = "chemistry",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "fluid", name = "water", amount = 1600},
        {type = "item", name = "sodium-chlorate", amount = 1}
    },
    results = {
        {type = "fluid", name = "sterile-water", amount = 1600}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/water-drop.png"},
        {icon = "__pyveganism__/graphics/icons/toxic-stress.png"},
        {icon = "__pyveganism__/graphics/icons/1.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-media",
    order = "aab",
    main_product = ""
}:add_unlock("growth-media-1")


--ultra pure water recipes
RECIPE {
    type = "recipe",
    name = "electrodeionisation",
    category = py_veganism_globals.electrodeionisation_category,
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "deionized-water", amount = 500}
    },
    results = {
        {type = "fluid", name = "ultra-pure-water", amount = 480},
        {type = "fluid", name = "water-saline", amount = 20}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/water-drop.png"},
        {icon = "__pyveganism__/graphics/icons/blitz.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-media",
    order = "ada"
}:add_unlock("growth-media-4")

--<< Growth Media >>
RECIPE {
    type = "recipe",
    name = "sugar-growth-medium-from-sugar",
    category = "hpf",
    enabled = true,
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "clean-water", amount = 50},
        {type = "item", name = "sugar", amount = 10}
    },
    results = {
        {type = "fluid", name = "sugar-growth-medium", amount = 50}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/water-drop.png"},
        {icon = "__pyveganism__/graphics/icons/sugar-in-solution.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-media",
    order = "caa"
}:add_unlock("growth-media-2")

RECIPE {
    type = "recipe",
    name = "sugar-growth-medium-from-molasses",
    category = "hpf",
    enabled = true,
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "clean-water", amount = 50},
        {type = "item", name = "molasses", amount = 20}
    },
    results = {
        {type = "fluid", name = "sugar-growth-medium", amount = 50}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/water-drop.png"},
        {icon = "__pyveganism__/graphics/icons/sugar-in-solution.png"}
    },
    icon_size = 64,
    subgroup = "py-veganism-media",
    order = "cab"
}:add_unlock("growth-media-2")
