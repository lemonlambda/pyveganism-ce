--[[
--> Lamp Recipes
]]--
RECIPE {
    type = "recipe",
    name = "sodium-vapor-lamp",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "item", name = "glass", amount = 2},
        {type = "item", name = "sodium-hydroxide", amount = 1},
        {type = "item", name = "copper-cable", amount = 3},
        {type = "fluid", name = "vacuum", amount = 20}
    },
    results = {
        {type = "item", name = "small-lamp", amount = 4}
    },
    icon = "__base__/graphics/icons/small-lamp.png",
    icon_size = 64,
    subgroup = "py-veganism-grow-equipment",
    order = "aaa",
    main_product = ""
}:add_unlock("optics")

--[[
--> Fertilizer Recipes
]]--
local size = py_veganism_globals["fertilizer_icon"].icon_size
RECIPE {
    type = "recipe",
    name = "pyveganism-fertilizer-ash-1",
    category = "mixer",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "item", name = "ash", amount = 10},
        {type = "item", name = "urea", amount = 10}, 
        {type = "item", name = "biomass", amount = 1},
        {type = "item", name = "limestone", amount = 1}
    },
    results = {
        {type = "item", name = "fertilizer", amount = 1}
    },
    icons = {
        {icon = py_veganism_globals["fertilizer_icon"].icon, icon_size = size},
        {icon = py_veganism_globals:get_vegan_icon(size), icon_size = size}
    },
    icon_size = size,
    subgroup = "py-veganism-grow-equipment",
    order = "aba"
}:add_unlock("cultivation-expertise-1")

RECIPE {
    type = "recipe",
    name = "pyveganism-fertilizer-ash-2",
    category = "mixer",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "item", name = "ash", amount = 10},
        {type = "item", name = "urea", amount = 6}, 
        {type = "item", name = "morgenroete-endospores", amount = 1},
        {type = "item", name = "biomass", amount = 2},
        {type = "item", name = "limestone", amount = 1}
    },
    results = {
        {type = "item", name = "fertilizer", amount = 2}
    },
    icons = {
        {icon = py_veganism_globals["fertilizer_icon"].icon, icon_size = size},
        {icon = py_veganism_globals:get_vegan_icon(size), icon_size = size}
    },
    icon_size = size,
    subgroup = "py-veganism-grow-equipment",
    order = "aba"
}:add_unlock("cultivation-expertise-2")

RECIPE {
    type = "recipe",
    name = "pyveganism-fertilizer-tailings-1",
    category = "mixer",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "fluid", name = "dirty-water-light", amount = 100},
        {type = "item", name = "urea", amount = 9}, 
        {type = "item", name = "morgenroete-endospores", amount = 1},
        {type = "item", name = "biomass", amount = 3},
        {type = "item", name = "limestone", amount = 1}
    },
    results = {
        {type = "item", name = "fertilizer", amount = 3}
    },
    icons = {
        {icon = py_veganism_globals["fertilizer_icon"].icon, icon_size = size},
        {icon = py_veganism_globals:get_vegan_icon(size), icon_size = size}
    },
    icon_size = size,
    subgroup = "py-veganism-grow-equipment",
    order = "aca"
}:add_unlock("cultivation-expertise-3")

RECIPE {
    type = "recipe",
    name = "pyveganism-fertilizer-tailings-dust-1",
    category = "mixer",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "item", name = "tailings-dust", amount = 6},
        {type = "item", name = "urea", amount = 12}, 
        {type = "item", name = "morgenroete-endospores", amount = 1},
        {type = "item", name = "biomass", amount = 4},
        {type = "item", name = "limestone", amount = 2}
    },
    results = {
        {type = "item", name = "fertilizer", amount = 4}
    },
    icons = {
        {icon = py_veganism_globals["fertilizer_icon"].icon, icon_size = size},
        {icon = py_veganism_globals:get_vegan_icon(size), icon_size = size}
    },
    icon_size = size,
    subgroup = "py-veganism-grow-equipment",
    order = "ada"
}:add_unlock("cultivation-expertise-4")

RECIPE {
    type = "recipe",
    name = "pyveganism-fertilizer-ammonium-sulfate",
    category = "mixer",
    enabled = false,
    energy_required = 0.5,
    ingredients = {
        {type = "item", name = "tailings-dust", amount = 10},
        {type = "item", name = "ammonium-sulfate", amount = 10}, 
        {type = "item", name = "biomass", amount = 8},
        {type = "item", name = "limestone", amount = 4}
    },
    results = {
        {type = "item", name = "fertilizer", amount = 8}
    },
    icons = {
        {icon = py_veganism_globals["fertilizer_icon"].icon, icon_size = size},
        {icon = py_veganism_globals:get_vegan_icon(size), icon_size = size}
    },
    icon_size = size,
    subgroup = "py-veganism-grow-equipment",
    order = "aea"
}:add_unlock("cultivation-expertise-3")
