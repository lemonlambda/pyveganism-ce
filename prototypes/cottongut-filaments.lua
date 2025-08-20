py_veganism_globals.create_recipe(
  "cottongut",
  {{type = "item", name = "cottongut-fur-tuft", amount = 2}},
  py_veganism_globals.hex2rgb("#323d44"),

  py_veganism_globals.costs,
  "caged-cottongut-1",
  py_veganism_globals.sub_recipes,
  {
    extra_vegan_ingredients = {{
      type = "fluid",
      name = "cottongut-stud-filament",
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
    filament_icon_name = "cottongut-stud"
  },
  false
)
