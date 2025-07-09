RECIPE {
    type = "recipe",
    name = "vegetable-lard",
    category = "hpf",
    enabled = false,
    energy_required = 60,
    ingredients = {
        {type = "item", name = "solid-fat", amount = 20},
    },
    results = {
        {type = "item", name = "mukmoux-fat", amount = 5}
    },
    icons = {
        {icon = "__pycoalprocessinggraphics__/graphics/icons/mukmoux-fat.png", icon_size = 32},
        {icon = "__pyveganism__/graphics/icons/vegan-small.png", icon_size = 32}
    },
    icon_size = 32,
    subgroup = "py-veganism-oil-plants",
    order = "aaa"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "fat-hardening",
    category = "fluid-separator",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {type = "fluid", name = "plant-oil", amount = 200},
        {type = "fluid", name = "hydrogen", amount = 100},
        {type = "item", name = "nickel-plate", amount = 1}
    },
    results = {
        {type = "item", name = "solid-fat", amount = 20}
    },
    icons = {
        {icon = "__pyveganism__/graphics/icons/solid-fat.png", icon_size = 64},
        {icon = "__pyveganism__/graphics/icons/steam-refining.png", icon_size = 64}
    },
    icon_size = 64,
    subgroup = "py-veganism-oil-plants",
    order = "aab"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "plant-oil-saponification-basic",
    category = "fts-reactor",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {type = "fluid", name = "plant-oil", amount = 200},
        {type = "fluid", name = "water", amount = 400},
        {type = "item", name = "sodium-hydroxide", amount = 2}
    },
    results = {
        {type = "fluid", name = "oleochemicals", amount = 150},
        {type = "fluid", name = "glycerol", amount = 100},
        {type = "fluid", name = "steam", amount = 400}
    },
    icons = {
        {icon = "__pycoalprocessinggraphics__/graphics/icons/oleochemicals.png", icon_size = 32},
        {icon = "__pyveganism__/graphics/icons/vegan-small.png", icon_size = 32}
    },
    icon_size = 32,
    subgroup = "py-veganism-oil-plants",
    order = "aab"
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "plant-oil-saponification-acidic",
    category = "fts-reactor",
    enabled = false,
    energy_required = 40,
    ingredients = {
        {type = "fluid", name = "plant-oil", amount = 400},
        {type = "fluid", name = "sulfuric-acid", amount = 40}
    },
    results = {
        {type = "fluid", name = "plant-oil", amount = 200},
        {type = "fluid", name = "oleochemicals", amount = 150},
        {type = "fluid", name = "glycerol", amount = 100}
    },
    icons = {
        {icon = "__pycoalprocessinggraphics__/graphics/icons/oleochemicals.png", icon_size = 32},
        {icon = "__pyveganism__/graphics/icons/vegan-small.png", icon_size = 32}
    },
    icon_size = 32,
    subgroup = "py-veganism-oil-plants",
    order = "aac"
}:add_unlock("oil-plants")
