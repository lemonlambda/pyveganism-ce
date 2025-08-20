FLUID {
  type = "fluid",
  name = "cottongut-chikawawa-filament",
  icon = "__pyveganism__/graphics/icons/filaments/cottongut-chikawawa-filament.png",
  default_temperature = 15,
  base_color = py_veganism_globals.hex2rgb("#323d44"),
  flow_color = py_veganism_globals.hex2rgb("#323d44"),
}

FLUID {
  type = "fluid",
  name = "cottongut-mije-filament",
  icon = "__pyveganism__/graphics/icons/filaments/cottongut-mije-filament.png",
  default_temperature = 15,
  base_color = py_veganism_globals.hex2rgb("#323d44"),
  flow_color = py_veganism_globals.hex2rgb("#323d44"),
}

py_veganism_globals.create_recipe(
  "cottongut",
  {{type = "item", name = "cottongut-fur-tuft", amount = 2}},
  py_veganism_globals.hex2rgb("#323d44"),

  py_veganism_globals.costs,
  "caged-cottongut-1",
  py_veganism_globals.sub_recipes,
  {
    vegan_extra_ingredients = {{
      type = "fluid",
      name = "cottongut-chikawawa-filament",
      amount = 100
    }}
  },
  true
)

py_veganism_globals.create_non_viable_mass("cottongut-mk01", {
  subgroup_name = "cottongut"
})
py_veganism_globals.register_replace_ingredients_caged("cottongut-mk01", "non-viable-cottongut-mk01-mass", "sack")
py_veganism_globals.create_recipe(
  "cottongut-mk01",
  {{type = "item", name = "cottongut-fur-tuft", amount = 2}},
  py_veganism_globals.hex2rgb("#323d44"),

  py_veganism_globals.costs,
  "cottongut",
  py_veganism_globals.sub_recipes,
  {
    codex_name = "cottongut-codex",
    filament_icon_name = "cottongut-stud",
    module_category = "cottongut",
  },
  false
)

RECIPE {
  type = "recipe",
  name = "cottongut-filament-breeding",
  category = "bio-printer",
  ingredients = {
    {
      type = "fluid",
      name = "cottongut-mk01-filament",
      amount = 200
    },
    {
      type = "item",
      name = "fish-egg",
      amount = 2
    },
    {
      type = "item",
      name = "cottongut-food-01",
      amount = 1
    },
    {
      type = "item",
      name = "seaweed",
      amount = 10
    },
    {
      type = "fluid",
      name = "water",
      amount = 50
    }
  },
  results = {
    {
      type = "fluid",
      name = "cottongut-mk01-filament",
      amount_min = 100,
      amount_max = 200,
    },
    {
      type = "fluid",
      name = "cottongut-mije-filament",
      amount_min = 300 * .8,
      amount_max = 800 * 1.8,
    },
    {
      type = "fluid",
      name = "cottongut-chikawawa-filament",
      amount_min = 50,
      amount_max = 100
    }
  },
  allowed_module_categories = {"cottongut"},
  main_product = "cottongut-mk01-filament"
}

RECIPE {
  type = "recipe",
  name = "cottongut-mije-filament-raising",
  category = "bio-printer",
  ingredients = {
    {
      type = "fluid",
      name = "cottongut-mije-filament",
      amount = 100
    },
    {
      type = "item",
      name = "wood",
      amount = 1
    },
    {
      type = "item",
      name = "cottongut-food-01",
      amount = 1
    },
    {
      type = "item",
      name = "moondrop",
      amount = 5
    },
    {
      type = "fluid",
      name = "water",
      amount = 50
    }
  },
  results = {
    {
      type = "fluid",
      name = "cottongut-mk01-filament",
      amount = 100,
    },
  },
  allowed_module_categories = {"cottongut"},
  main_product = "cottongut-mk01-filament"
}

