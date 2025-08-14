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
      amount = 2
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
      amount = 1000
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
py_veganism_globals.register_replace_ingredients("arqad-queen", "non-viable-arqad-queen-mass")
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
      {type = "fluid", name = "arqad-precursor-filament", amount = 3000}
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
      {type = "fluid", name = "arqad-precursor-filament", amount = 1000}
    },
    main_product = "arqad-precursor-filament",
    filament_icon_name = "arqad-precursor"
  },
  false
)

py_veganism_globals.create_non_viable_mass("arqad", {})
py_veganism_globals.register_replace_ingredients("arqad", "non-viable-arqad-mass")
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
RECIPE {
  type = "recipe",
  name = "dichloromethane",
  ingredients = {
  
  }
}
