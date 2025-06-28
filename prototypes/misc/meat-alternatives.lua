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

RECIPE {
    type = "recipe",
    name = "bio-scaffold-from-guar",
    category = "nmf",
    energy_required = 15,
    ingredients = {
        {
            type = "item",
            name = "guar-meal",
            amount = 5
        },
        {
            type = "item",
            name = "chitin",
            amount = 20
        },
        {
            type = "item",
            name = "sodium-alginate",
            amount = 1
        },
        {
            type = "fluid",
            name = "boric-acid",
            amount = 200,
        },
    },
    results = {
        {
            type = "item",
            name = "bio-scafold",
            amount = 1
        }
    },
    icons = {
        {icon = "__pyalienlifegraphics__/graphics/icons/bio-scafold.png", icon_size = 32},
        {icon = "__pyveganism__/graphics/icons/vegan-small.png", icon_size = 32}
    },
    subgroup = "py-veganism-guar",
    order = "aaa",
}:add_unlock("oil-plants")

RECIPE {
    type = "recipe",
    name = "synthetic-vrauk-meat",
    category = "bio-printer",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {
            type = "item",
            name = "native-flora",
            amount = 10,
        },
        {
            type = "item",
            name = "petri-dish",
            amount = 10,
        },
        {
            type = "item",
            name = "moss-gen",
            amount = 3,
        },
        {
            type = "item",
            name = "vrauks-codex",
            amount = 1
        }
    },
    results = {
        {
            type = "item",
            name = "meat",
            amount = 2
        },
        {
            type = "item",
            name = "guts",
            amount = 2
        },
        {
            type = "item",
            name = "vrauks-codex",
            amount = 1,
            probability = 0.99,
        },
    },
    icons = {
        {icon = "__pyalienlifegraphics__/graphics/icons/vrauks.png", icon_size = 64},
        {icon = "__pyveganism__/graphics/icons/vegan.png", icon_size = 64}
    },
    subgroup = "py-veganism-vrauk",
    order = "aaa",
}:add_unlock("vrauks")

py_veganism_globals.non_viable_vrauk_mass_icon = {
      {icon = "__pyveganism__/graphics/icons/burlap-sack.png", icon_size = 64},
      {icon = "__pyveganism__/graphics/icons/vrauks-gray.png", icon_size = 64, scale = 0.25, shift = {0, 3}},
  }

ITEM {
    type = "item",
    name = "non-viable-vrauk-mass",
    icons = py_veganism_globals.non_viable_vrauk_mass_icon,
    subgroup = "py-veganism-vrauk",
    enabled = false,
    stack_size = 200,
}

RECIPE {
    type = "recipe",
    name = "synthetic-non-viable-vrauk-mass",
    category = "bio-printer",
    enabled = false,
    energy_required = 200,
    ingredients = {
        {
            type = "item",
            name = "native-flora",
            amount = 10,
        },
        {
            type = "item",
            name = "petri-dish",
            amount = 10,
        },
        {
            type = "item",
            name = "moss-gen",
            amount = 3,
        },
        {
            type = "item",
            name = "earth-generic-sample",
            amount = 2,
        },
        {
            type = "item",
            name = "vrauks-codex",
            amount = 1
        }
    },
    results = {
        {
            type = "item",
            name = "non-viable-vrauk-mass",
            amount = 1,
        },
        {
            type = "item",
            name = "earth-generic-sample",
            amount = 2,
            probability = 0.85,
        },
        {
            type = "item",
            name = "vrauks-codex",
            amount = 1,
            probability = 0.99,
        },
    },
    icons = py_veganism_globals.non_viable_vrauk_mass_icon,
    subgroup = "py-veganism-vrauk",
    enabled = false,
}:add_unlock("vrauks")

local new_icon = table.deepcopy(py_veganism_globals.non_viable_vrauk_mass_icon)
table.insert(new_icon, {
    icon = "__pyveganism__/graphics/icons/rendering.png",
    icon_size = 64,
})
RECIPE {
    type = "recipe",
    name = "render-non-viable-vrauk-mass",
    category = "slaughterhouse",
    energy_required = 10,
    ingredients = {
        {
            type = "item",
            name = "non-viable-vrauk-mass",
            amount = 1
        }
    },
    results = {
        {
            type = "item",
            name = "meat",
            amount = 2
        },
        {
            type = "item",
            name = "guts",
            amount = 2
        },
        {
            type = "item",
            name = "brain",
            amount = 1
        },
        {
            type = "fluid",
            name = "formic-acid",
            amount = 25
        },
    },
    icons = new_icon,
    subgroup = "py-veganism-vrauk",
}
