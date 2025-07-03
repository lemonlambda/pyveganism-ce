py_veganism_globals.non_viable_auog_mass_icon = {
    {icon = "__pyveganism__/graphics/icons/burlap-sack.png", icon_size = 64},
    {icon = "__pyveganism__/graphics/icons/auog-gray.png", icon_size = 64, scale = 0.25, shift = {0, 3}},
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
}

local i = 1
local sap_count = 0
local moss_count = 0

local icons = table.deepcopy(py_veganism_globals.non_viable_auog_mass_icon)
table.insert(icons,
    {icon = "__pyalienlifegraphics__/graphics/icons/" .. i .. ".png", icon_size = 64, scale = .25, shift = {-8, 8}}
)

RECIPE {
    type = "recipe",
    name = "synthetic-non-viable-auog-mass-1",
    category = "bio-printer",
    enabled = false,
    energy_required = 30 - 5 * math.log(sap_count),
    ingredients = ingredients,
    results = {
        {
            type = "item",
            name = "non-viable-auog-mass",
            amount = 2 + 2 * moss_count
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
    allow_speed = true,
    allow_productivity = true,
    allow_efficiency = true,
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
            amount = 1
        },
        {
            type = "item",
            name = "guts",
            amount = 1
        },
        {
            type = "item",
            name = "brain",
            amount = 1,
            probability = .5,
        },
        {
            type = "item",
            name = "skin",
            amount = 1
        },
        {
            type = "item",
            name = "bones",
            amount = 1,
        },
        {
            type = "fluid",
            name = "blood",
            amount = 20,
        },
        {
            type = "item",
            name = "sack",
            amount = 1
        }
    },
    icons = new_icon,
    subgroup = "py-veganism-auog",
}
