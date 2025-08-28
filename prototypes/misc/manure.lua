FLUID {
    type = "fluid",
    name = "bacterial-waste-suspension",
    icon = "__pyveganism__/graphics/icons/bacterial-waste-suspension.png",
    default_temperature = 30,
    subgroup = "py-veganism-manure",
    base_color = {0.18, 0.122, 0.11},
    flow_color = {0.18, 0.122, 0.11}
}

FLUID {
    type = "fluid",
    name = "digestive-bacteria",
    icon = "__pyveganism__/graphics/icons/digestive-bacteria.png",
    default_temperature = 20,
    subgroup = "py-veganism-manure",
    base_color = {0.11, 0.18, 0.122},
    flow_color = {0.11, 0.18, 0.122}
}

RECIPE {
    type = "recipe",
    name = "manure-from-waste-suspension",
    category = "evaporator",
    energy_required = 300,
    ingredients = {
        {
            type = "fluid",
            name = "bacterial-waste-suspension",
            amount = 2000
        }
    },
    results = {
        {
            type = "item",
            name = "manure",
            amount_min = 10,
            amount_max = 210
        },
        {
            type = "fluid",
            name = "digestive-bacteria",
            amount = 1100
        }
    },
    subgroup = "py-veganism-manure",
    icon = "__pyalienlifegraphics__/graphics/icons/mip/manure-02.png"
}:add_unlock("melamine")

RECIPE {
    type = "recipe",
    name = "bacterial-waste-creation",
    category = "bio-reactor",
    energy_required = 10,
    ingredients = {
        {
            type = "item",
            name = "native-flora",
            amount = 24
        },
        {
            type = "item",
            name = "moss",
            amount = 11
        },
        {
            type = "fluid",
            name = "water",
            amount = 300
        },
        {
            type = "fluid",
            name = "digestive-bacteria",
            amount = 100
        },
        {
            type = "fluid",
            name = "pressured-air",
            amount = 1000
        }
    },
    results = {
        {
            type = "fluid",
            name = "bacterial-waste-suspension",
            amount = 100
        }
    },
    subgroup = "py-veganism-manure",
    icon = "__pyveganism__/graphics/icons/bacterial-waste-suspension.png",
}:add_unlock("melamine")

RECIPE {
    type = "recipe",
    name = "breed-digestive-bacteria",
    category = "incubator",
    energy_required = 20,
    ingredients = {
        {
            type = "fluid",
            name = "digestive-bacteria",
            amount = 40
        },
        {
            type = "item",
            name = "biomass",
            amount = 2
        },
        {
            type = "fluid",
            name = "water",
            amount = 220
        }
    },
    results = {
        {
            type = "fluid",
            name = "digestive-bacteria",
            amount = 200
        },
        {
            type = "item",
            name = "rich-clay",
            probability = 0.1,
            amount_min = 1,
            amount_max = 3
        }
    },
    subgroup = "py-veganism-manure",
    icon = "__pyveganism__/graphics/icons/digestive-bacteria.png"
}:add_unlock("melamine")

RECIPE {
    type = "recipe",
    name = "engineer-digestive-bacteria",
    category = "genlab",
    energy_required = 300,
    ingredients = {
        {
            type = "item",
            name = "petri-dish",
            amount = 2
        },
        {
            type = "item",
            name = "cdna",
            amount = 6
        },
        {
            type = "item",
            name = "ground-sample01",
            amount = 10
        },
        {
            type = "item",
            name = "biomass",
            amount = 12
        },
        {
            type = "item",
            name = "bio-sample",
            amount = 8
        },
        {
            type = "item",
            name = "earth-generic-sample",
            amount = 4
        },
    },
    results = {
        {
            type = "fluid",
            name = "digestive-bacteria",
            amount = 40
        }
    },
    subgroup = "py-veganism-manure",
    icon = "__pyveganism__/graphics/icons/digestive-bacteria.png"
}:add_unlock("melamine")