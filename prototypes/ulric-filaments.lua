py_veganism_globals.create_non_viable_mass("ulric", {
  sack_icon = "reinforced-wooden-chest"
})

RECIPE {
  type = "recipe",
  name = "render-non-viable-ulric-mass",
  icons = table.extend(
    ITEM("non-viable-ulric-mass").icons,
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
      name = "bonemeal",
      amount = 4
    },
    {
      type = "item",
      name = "meat",
      amount = 3
    },
    {
      type = "item",
      name = "skin",
      amount = 1
    },
    {
      type = "item",
      name = "guts",
      amount = 15
    },
    {
      type = "item",
      name = "brain",
      amount = 1
    },
    {
      type = "fluid",
      name = "blood",
      amount = 30
    },
    {
      type = "item",
      name = "manure",
      amount = 10
    },
    {
      type = "item",
      name = "reinforced-wooden-chest",
      amount = 1
    }
  },
  subgroup = "py-veganism-arqad",
}

py_veganism_globals.register_replace_ingredients("ulric", "non-viable-ulric-mass")
py_veganism_globals.create_recipe(
  "ulric",
  {},
  py_veganism_globals.hex2rgb("#304657"),

  py_veganism_globals.costs,
  "ulric-1",
  py_veganism_globals.sub_recipes,
  {
    special_container = "reinforced-wooden-chest",
  },
  false
)
