py_veganism_globals.create_recipe(
  "vrauks",
  {{type = "item", name = "vrauk-molt", amount = 2}},
  py_veganism_globals.hex2rgb("#3b7958"),

  py_veganism_globals.costs,
  "vrauks-1",
  py_veganism_globals.sub_recipes,
  {},
  true
)

for i=2,4 do
  py_veganism_globals.create_recipe(
    "vrauks-mk0" .. i,
    {{type = "item", name = "vrauk-molt", amount = 2}},
    py_veganism_globals.hex2rgb("#3b7958"),

    py_veganism_globals.costs,
    "vrauks-mk0" .. i,
    py_veganism_globals.sub_recipes,
    {
      filament_icon_name = "vrauks",
      filament_result_probability = 0.005,
      additional_results = {
        {type = "fluid", name = "vrauks-filament", amount_min = 100, amount_max = 5000, probability = 0.05}
      },
      main_product = "vrauks-mk0" .. i .. "-filament",
      mk_level = i,
      codex_name = "vrauks-codex",
      not_nvm = true
    },
    true
  )
end
