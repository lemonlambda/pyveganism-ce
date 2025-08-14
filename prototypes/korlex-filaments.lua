py_veganism_globals.create_non_viable_mass("korlex", {
  sack_icon = "reinforced-wooden-chest"
})

RECIPE {
  type = "recipe",
  name = "render-non-viable-korlex-mass",
  icons = table.extend(
    ITEM("non-viable-korlex-mass").icons,
    {{icon = "__pyveganism__/graphics/icons/rendering.png"}}
  ),
  category = "slaughterhouse",
  energy_required = 10,
  ingredients = {
    {
      type = "item",
      name = "non-viable-korlex-mass",
      amount = 1
    }
  },
  results = {
    {
      type = "item",
      name = "bones",
      amount = 2
    },
    {
      type = "item",
      name = "meat",
      amount = 3
    },
    {
      type = "item",
      name = "skin",
      amount = 3
    },
    {
      type = "item",
      name = "guts",
      amount = 1
    },
    {
      type = "item",
      name = "brain",
      amount = 1
    },
    {
      type = "fluid",
      name = "blood",
      amount = 10
    },
    {
      type = "item",
      name = "mukmoux-fat",
      amount = 6
    },
    {
      type = "item",
      name = "reinforced-wooden-chest",
      amount = 1
    }
  },
  subgroup = "py-veganism-arqad",
}

py_veganism_globals.register_replace_ingredients("korlex", "non-viable-korlex-mass")
py_veganism_globals.create_recipe(
  "korlex",
  {},
  py_veganism_globals.hex2rgb("#304657"),

  py_veganism_globals.costs,
  "korlex-1",
  py_veganism_globals.sub_recipes,
  {
    special_container = "reinforced-wooden-chest",
  },
  false
)

RECIPE {
  type = "recipe",
  name = "print-milk",
  category = "bio-printer",
  energy_required = 2,
  subgroup = "py-veganism-korlex",
  ingredients = {
    {
      type = "fluid",
      name = "korlex-filament",
      amount = 1
    },
    {
      type = "item",
      name = "empty-barrel-milk",
      amount = 1
    }
  },
  results = {
    {
      type = "item",
      name = "barrel-milk",
      amount = 1
    }
  },
  main_product = "barrel-milk"
}:add_unlock("korlex")
