py_veganism_globals.non_viable_auog_mass_icon = {
    {icon = "__pyveganism__/graphics/icons/reinforced-wooden-chest.png", icon_size = 64},
    {icon = "__pyveganism__/graphics/icons/auog-gray.png", icon_size = 64, scale = 0.2, shift = {0, 8}},
}

ITEM {
    type = "item",
    name = "non-viable-auog-mass",
    icons = py_veganism_globals.non_viable_auog_mass_icon,
    subgroup = "py-veganism-auog",
    enabled = false,
    stack_size = 200,
}

local ingredients = {
    {
        type = "item",
        name = "bio-sample",
        amount = 5,
    },
    {
        type = "item",
        name = "earth-generic-sample",
        amount = 2,
    },
    {
        type = "item",
        name = "earth-bear-sample",
        amount = 1,
    },
    {
        type = "item",
        name = "auog-codex",
        amount = 1,
    },
    {
        type = "fluid",
        name = "water",
        amount = 1000,
    },
    {
        type = "item",
        name = "reinforced-wooden-chest",
        amount = 1
    }
}

local i = 1

local icons = table.deepcopy(py_veganism_globals.non_viable_auog_mass_icon)
table.insert(icons,
    {icon = "__pyalienlifegraphics__/graphics/icons/" .. i .. ".png", icon_size = 64, scale = .25, shift = {-8, 8}}
)

RECIPE {
    type = "recipe",
    name = "synthetic-non-viable-auog-mass-1",
    category = "bio-printer",
    enabled = false,
    energy_required = 30,
    ingredients = ingredients,
    results = {
        {
            type = "item",
            name = "non-viable-auog-mass",
            amount = 1
        },
        {
            type = "item",
            name = "earth-bear-sample",
            amount = 1,
            probability = 0.8,
        },
        {
            type = "item",
            name = "auog-codex",
            amount = 1,
            probability = 0.99,
        },
    },
    icons = icons,
    subgroup = "py-veganism-auog",
    allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
    allowed_module_categories = {"auog"},
    order = "aaa",
}:add_unlock("auog")

local new_icon = table.deepcopy(py_veganism_globals.non_viable_auog_mass_icon)
table.insert(new_icon, {
    icon = "__pyveganism__/graphics/icons/rendering.png",
    icon_size = 64,
})
RECIPE {
    type = "recipe",
    name = "render-non-viable-auog-mass",
    category = "slaughterhouse",
    energy_required = 10,
    ingredients = {
        {
            type = "item",
            name = "non-viable-auog-mass",
            amount = 1
        }
    },
    results = {
        {
            type = "item",
            name = "meat",
            amount = 8
        },
        {
            type = "item",
            name = "guts",
            amount = 3
        },
        {
            type = "item",
            name = "brain",
            amount = 1,
        },
        {
            type = "item",
            name = "skin",
            amount = 2
        },
        {
            type = "item",
            name = "bones",
            amount = 3,
        },
        {
            type = "fluid",
            name = "blood",
            amount = 10,
        },
        {
            type = "item",
            name = "reinforced-wooden-chest",
            amount = 1
        },
    },
    icons = new_icon,
    subgroup = "py-veganism-auog",
}

RECIPE{
    type = "recipe",
    name = "auog-blood-printing",
    
}

ITEM{
    type = "item",
    name = "syringe",
    icon = "__pyveganism__/graphics/icons/syringe.png",
    icon_size = 64,
    subgroup = "py-veganism-auog",
    stack_size = 200,
}

ITEM{
    type = "item",
    name = "used-syringe",
    icon = "__pyveganism__/graphics/icons/used-syringe.png",
    icon_size = 64,
    subgroup = "py-veganism-auog",
    stack_size = 200,
}

TECHNOLOGY{
    type = "techonolgy",
    name = "syringe",
    icon = "__pyalienlifegraphics__/graphics/icons/syringe.png",
    icon_size = 64,
    unit = {
        count = 45,
        time = 30.0,
        ingredients = {
            {"automation-science-pack", 1}
        },
    },
}:add_prereq("fiber-refining"):add_prereq("glass")

RECIPE{
    type = "recipe",
    name = "syringe",
    icon = "__pyveganism__/graphics/icons/syringe.png",
    icon_size = 64,
    category = "glassworks",
    ingredients = {
        {
            type = "fluid",
            name = "molten-glass",
            amount = 20,
        },
        {
            type = "item",
            name = "needle",
            amount = 1
        },
    },
    results = {
        {
            type = "item",
            name = "syringe",
            amount = 1
        }
    },
    order = "baa",
    energy_required = 15,
    subgroup = "py-veganism-auog"
}:add_unlock("syringe")

RECIPE{
    type = "recipe",
    name = "clean-syringe-1",
    icons = {
        {icon = "__pyveganism__/graphics/icons/syringe.png", icon_size = 64},
        {icon = "__pyalienlifegraphics__/graphics/icons/1.png", icon_size = 64, scale = .25, shift = {-8, 8}}
    },
    icon_size = 64,
    category = "washer",
    ingredients = {
        {
            type = "fluid",
            name = "steam",
            amount = 1000,
        },
        {
            type = "item",
            name = "used-syringe",
            amount = 1
        },
    },
    results = {
        {
            type = "item",
            name = "syringe",
            amount = 1
        }
    },
    order = "bba",
    subgroup = "py-veganism-auog",
    energy_required = 300,
}:add_unlock("syringe")

RECIPE{
    type = "recipe",
    name = "clean-syringe-2",
    icons = {
        {icon = "__pyveganism__/graphics/icons/syringe.png", icon_size = 64},
        {icon = "__pyalienlifegraphics__/graphics/icons/2.png", icon_size = 64, scale = .25, shift = {-8, 8}}
    },
    icon_size = 64,
    category = "washer",
    ingredients = {
        {
            type = "fluid",
            name = "pressured-steam",
            amount = 20,
        },
        {
            type = "item",
            name = "used-syringe",
            amount = 1
        },
    },
    results = {
        {
            type = "item",
            name = "syringe",
            amount = 1
        }
    },
    order = "bba",
    subgroup = "py-veganism-auog",
    energy_required = 300,
}:add_unlock("coalplant-mk01"):add_unlock("biomassplant-mk01"):add_unlock("oilplant-mk01"):add_unlock("gasplant-mk01")

RECIPE{
    type = "recipe",
    name = "break-used-syringe",
    icon = "__pyveganism__/graphics/icons/syringe.png",
    icon_size = 64,
    category = "glassworks",
    ingredients = {
        {
            type = "item",
            name = "used-syringe",
            amount = 1
        },
    },
    results = {
        {
            type = "item",
            name = "needle",
            amount = 1
        },
        {
            type = "fluid",
            name = "molten-glass",
            amount = 20,
        }
    },
    order = "bca",
    subgroup = "py-veganism-auog",
    energy_required = 10,
}:add_unlock("syringe")

TECHNOLOGY{
    type = "techonolgy",
    name = "auog-blood-drive",
    icons = {
        {icon = "__pyalienlifegraphics__/graphics/icons/auog.png", icon_size = 64},
        {icon = "__pyalienlifegraphics__/graphics/icons/syringe.png", scale = 2, shift = {2, 8}, icon_size = 64},
    },
    unit = {
        count = 200,
        time = 60.0,
        ingredients = {
            {"automation-science-pack", 1},
            {"py-science-pack-1", 1}
        },
    },
}:add_prereq("auog"):add_prereq("syringe")

RECIPE{
    type = "recipe",
    name = "auog-blood-drive",
    icon = "__pyalienlifegraphics__/graphics/icons/blood.png",
    icon_size = 64,
    category = "slaughterhouse",
    ingredients = {
        {
            type = "item",
            name = "syringe",
            amount = 20
        },
        {
            type = "item",
            name = "charged-auog",
            amount = 20,
        }
    },
    results = {
        {
            type = "item",
            name = "used-syringe",
            amount_min = 18,
            amount_max = 20
        },
        {
            type = "item",
            name = "used-auog",
            amount = 3
        },
        {
            type = "item",
            name = "auog",
            amount = 17
        },
        {
            type = "fluid",
            name = "blood",
            amount = 15
        }
    },
    energy_required = 180,
    subgroup = "py-veganism-auog",
}:add_unlock("auog-blood-drive")
