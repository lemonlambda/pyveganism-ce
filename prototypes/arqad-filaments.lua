FLUID {
  type = "fluid",
  name = "arqad-precursor-filament",
  icon = "__pyveganism__/graphics/icons/filaments/arqad-precursor-filament.png",
  default_temperature = 15,
  base_color = py_veganism_globals.hex2rgb("#fcbbff"),
  flow_color = py_veganism_globals.hex2rgb("#fcbbff"),
}
RECIPE {
  type = "recipe",
  name = "arqad-precursor-filament",
  category = "biofactory",
  subgroup = "py-veganism-filament",
  ingredients = {
    {
      type = "fluid",
      name = "coke-oven-gas",
      amount = 1000
    },
    {
      type = "item",
      name = "arqad-codex",
      amount = 1
    },
    {
      type = "item",
      name = "cdna",
      amount = 1
    },
    {
      type = "fluid",
      name = "vrauks-filament",
      amount = 100
    }
  },
  results = {
    {
      type = "fluid",
      name = "arqad-precursor-filament",
      amount = 2000
    },
    {
      type = "item",
      name = "arqad-codex",
      amount = 1,
      probability = 0.99
    }
  },
  main_product = "arqad-precursor-filament"
}

py_veganism_globals.create_non_viable_mass("arqad-queen", {
  subgroup_name = "arqad"
})
py_veganism_globals.register_replace_ingredients_caged("arqad-queen", "non-viable-arqad-queen-mass", "sack")
py_veganism_globals.create_recipe(
  "arqad-queen",
  {},
  py_veganism_globals.hex2rgb("#536f51"),

  py_veganism_globals.costs,
  "arqad-queen-1",
  py_veganism_globals.sub_recipes,
  {
    codex_name = "arqad-codex",
    filament_result_probability = 0.01,
    vegan_extra_ingredients = {
      {type = "fluid", name = "arqad-precursor-filament", amount = 2500}
    }
  },
  false
)
py_veganism_globals.create_recipe(
  "arqad-queen",
  {},
  py_veganism_globals.hex2rgb("#536f51"),

  py_veganism_globals.costs,
  "arqad-egg-1",
  py_veganism_globals.sub_recipes,
  {
    skip_nvm = true,
    recipe_name = "from-filament",
    codex_name = "arqad-codex",
    filament_result_probability = 0.999,
    vegan_extra_ingredients = {
      {type = "fluid", name = "arqad-queen-filament", amount = 100},
      {type = "fluid", name = "arqad-filament", amount = 500}
    },
    additional_results = {
      {type = "fluid", name = "arqad-precursor-filament", amount = 6000}
    },
    main_product = "arqad-precursor-filament",
    filament_icon_name = "arqad-precursor"
  },
  false
)

py_veganism_globals.create_non_viable_mass("arqad", {})
RECIPE {
    type = "recipe",
    name = "render-non-viable-arqad-mass",
    icons = table.extend(
      ITEM("non-viable-arqad-mass").icons,
      {{icon = "__pyveganism__/graphics/icons/rendering.png"}}
    ),
    category = "slaughterhouse",
    energy_required = 10,
    ingredients = {
        {
            type = "item",
            name = "non-viable-arqad-mass",
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
            amount = 2
        },
        {
            type = "fluid",
            name = "arthropod-blood",
            amount = 40
        },
        {
            type = "fluid",
            name = "bee-venom",
            amount = 30
        },
        {
            type = "item",
            name = "sack",
            amount = 1
        }
    },
    subgroup = "py-veganism-arqad",
}

py_veganism_globals.register_replace_ingredients_caged("arqad", "non-viable-arqad-mass", "sack")
py_veganism_globals.create_recipe(
  "arqad",
  {},
  py_veganism_globals.hex2rgb("#536f51"),

  py_veganism_globals.costs,
  "caged-arqad-1",
  py_veganism_globals.sub_recipes,
  {
    vegan_extra_ingredients = {
      {type = "fluid", name = "arqad-precursor-filament", amount = 500}
    }
  },
  false
)

-- Honey making

FLUID {
  type = "fluid",
  name = "flora-solution",
  icons = {
    {icon = "__base__/graphics/icons/fluid/water.png"},
    {icon = "__pyalienlifegraphics__/graphics/icons/mip/bio/03.png", icon_size = 64, scale = 0.25, shift = {8, 8}}
  },
  default_temperature = 15,
  base_color = {156/255, 203/255, 44/255},
  flow_color = {156/255, 203/255, 44/255},
}

FLUID {
  type = "fluid",
  name = "moondrop-solution",
  icons = {
    {icon = "__base__/graphics/icons/fluid/water.png"},
    {icon = "__pyalienlifegraphics__/graphics/icons/moondrop.png", icon_size = 64, scale = 0.25, shift = {8, 8}}
  },
  default_temperature = 15,
  base_color = {91/255, 158/255, 198/255},
  flow_color = {91/255, 158/255, 198/255},
}

FLUID {
  type = "fluid",
  name = "ralesia-solution",
  icons = {
    {icon = "__base__/graphics/icons/fluid/water.png"},
    {icon = "__pyalienlifegraphics__/graphics/icons/ralesia.png", icon_size = 64, scale = 0.25, shift = {8, 8}}
  },
  default_temperature = 15,
  base_color = {1, 187/255, 0},
  flow_color = {1, 187/255, 0},
}

FLUID {
  type = "fluid",
  name = "nectar-1",
  icons = {
    {icon = "__pyveganism__/graphics/icons/nectar.png"},
    {icon = "__pyalienlifegraphics__/graphics/icons/1.png", icon_size = 64, scale = 0.25, shift = {8, 8}}
  },
  default_temperature = 15,
  base_color = {174/255, 129/255, 84/255},
  flow_color = {174/255, 129/255, 84/255},
}

FLUID {
  type = "fluid",
  name = "nectar-2",
  icons = {
    {icon = "__pyveganism__/graphics/icons/nectar.png"},
    {icon = "__pyalienlifegraphics__/graphics/icons/2.png", icon_size = 64, scale = 0.25, shift = {8, 8}}
  },
  default_temperature = 15,
  base_color = {174/255, 129/255, 84/255},
  flow_color = {174/255, 129/255, 84/255},
}

FLUID {
  type = "fluid",
  name = "nectar-3",
  icons = {
    {icon = "__pyveganism__/graphics/icons/nectar.png"},
    {icon = "__pyalienlifegraphics__/graphics/icons/3.png", icon_size = 64, scale = 0.25, shift = {8, 8}}
  },
  default_temperature = 15,
  base_color = {174/255, 129/255, 84/255},
  flow_color = {174/255, 129/255, 84/255},
}

RECIPE {
  type = "recipe",
  name = "chloridemethane-from-cog",
  subgroup = "py-veganism-arqad",
  category = "chemistry",
  ingredients = {
    {
      type = "fluid",
      name = "coke-oven-gas",
      amount = 100,
    },
    {
      type = "fluid",
      name = "chlorine",
      amount = 100
    }
  },
  results = {
    {
      type = "fluid",
      name = "chloromethane",
      amount = 100
    },
    {
      type = "fluid",
      name = "hydrogen-chloride",
      amount = 100
    },
  },
  main_product = "chloromethane"
}:add_unlock("coke-mk01")

RECIPE {
  type = "recipe",
  name = "basic-dichloromethane",
  subgroup = "py-veganism-arqad",
  category = "chemistry",
  ingredients = {
    {
      type = "fluid",
      name = "chloromethane",
      amount = 100
    },
    {
      type = "fluid",
      name = "chlorine",
      amount = 100
    }
  },
  results = {
    {
      type = "fluid",
      name = "dcm",
      amount = 100
    },
    {
      type = "fluid",
      name = "hydrogen-chloride",
      amount = 100
    },
  },
  main_product = "dcm"
}:add_unlock("arqad")

RECIPE {
  type = "recipe",
  name = "flora-solution",
  subgroup = "py-veganism-arqad",
  category = "biofactory",
  ingredients = {
    {
      type = "item",
      name = "native-flora",
      amount = 20
    },
    {
      type = "fluid",
      name = "dcm",
      amount = 5
    }
  },
  results = {
    {
      type = "fluid",
      name = "flora-solution",
      amount = 80
    }
  },
  main_product = "flora-solution"
}:add_unlock("arqad")

RECIPE {
  type = "recipe",
  name = "moondrop-solution",
  subgroup = "py-veganism-arqad",
  category = "moon",
  ingredients = {
    {
      type = "item",
      name = "moondrop",
      amount = 5
    },
    {
      type = "fluid",
      name = "benzene",
      amount = 5
    }
  },
  results = {
    {
      type = "fluid",
      name = "moondrop-solution",
      amount = 30
    }
  },
  main_product = "moondrop-solution"
}:add_unlock("arqad")

RECIPE {
  type = "recipe",
  name = "ralesia-solution",
  subgroup = "py-veganism-arqad",
  category = "ralesia",
  ingredients = {
    {
      type = "item",
      name = "ralesia",
      amount = 3
    },
    {
      type = "fluid",
      name = "dcm",
      amount = 4
    }
  },
  results = {
    {
      type = "fluid",
      name = "ralesia-solution",
      amount = 25
    }
  },
  main_product = "ralesia-solution"
}:add_unlock("arqad")

RECIPE {
  type = "recipe",
  name = "separate-flora-solution",
  subgroup = "py-veganism-arqad",
  category = "fluid-separator",
  energy_required = 5,
  ingredients = {
    {
      type = "fluid",
      name = "flora-solution",
      amount = 100
    }
  },
  results = {
    {
      type = "fluid",
      name = "nectar-1",
      amount = 65
    }
  },
  main_product = "nectar-1"
}:add_unlock("arqad")

RECIPE {
  type = "recipe",
  name = "separate-moondrop-solution",
  subgroup = "py-veganism-arqad",
  category = "fluid-separator",
  energy_required = 5,
  ingredients = {
    {
      type = "fluid",
      name = "moondrop-solution",
      amount = 80
    },
    {
      type = "fluid",
      name = "nectar-1",
      amount = 100
    }
  },
  results = {
    {
      type = "fluid",
      name = "nectar-2",
      amount = 70
    }
  },
  main_product = "nectar-2"
}:add_unlock("arqad")

RECIPE {
  type = "recipe",
  name = "separate-ralesia-solution",
  subgroup = "py-veganism-arqad",
  category = "fluid-separator",
  energy_required = 5,
  ingredients = {
    {
      type = "fluid",
      name = "ralesia-solution",
      amount = 100
    },
    {
      type = "fluid",
      name = "nectar-2",
      amount = 40
    }
  },
  results = {
    {
      type = "fluid",
      name = "nectar-3",
      amount = 60
    }
  },
  main_product = "nectar-3"
}:add_unlock("arqad")

RECIPE {
  type = "recipe",
  name = "arqad-honey-from-nectar",
  subgroup = "py-veganism-arqad",
  category = "bio-printer",
  ingredients = {
    {
      type = "fluid",
      name = "nectar-3",
      amount = 70
    },
    {
      type = "fluid",
      name = "hot-air",
      amount = 20
    }
  },
  results = {
    {
      type = "fluid",
      name = "arqad-honey",
      amount = 100
    },
  },
  main_product = "arqad-honey"
}:add_unlock("arqad")

RECIPE {
  type = "recipe",
  name = "arqad-honeycomb-filling",
  subgroup = "py-veganism-arqad",
  category = "py-barreling",
  energy_required = 5,
  ingredients = {
    {
      type = "item",
      name = "empty-honeycomb",
      amount = 1
    },
    {
      type = "fluid",
      name = "arqad-honey",
      amount = 50
    }
  },
  results = {
    {
      type = "item",
      name = "honeycomb",
      amount = 1
    }
  },
  main_product = "honeycomb"
}:add_unlock("arqad")

