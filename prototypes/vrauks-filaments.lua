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

py_veganism_globals.create_recipe(
  "vrauks-mk02",
  {{type = "item", name = "vrauk-molt", amount = 2}},
  py_veganism_globals.hex2rgb("#3b7958"),

  py_veganism_globals.costs,
  "vrauks-mk02",
  py_veganism_globals.sub_recipes,
  {
    filament_icon_name = "vrauks",
    filament_result_probability = 0.005,
    additional_results = {
      {type = "fluid", name = "vrauks-filament", amount_min = 100, amount_max = 5000, probability = 0.05}
    },
    main_product = "vrauks-mk02-filament",
    mk_level = 2,
    codex_name = "vrauks-codex",
    not_nvm = true
  },
  false
)

for i=3,4 do
  py_veganism_globals.create_recipe(
    "vrauks-mk0" .. i,
    {{type = "item", name = "vrauk-molt", amount = 2}},
    py_veganism_globals.hex2rgb("#3b7958"),

    py_veganism_globals.costs,
    "vrauks-mk0" .. i,
    py_veganism_globals.sub_recipes,
    {
      filament_icon_name = "vrauks",
      filament_result_probability = 0.005 - 0.001 * (i - 2),
      additional_results = {
        {type = "fluid", name = "vrauks-mk0" .. (i - 1) .. "-filament", amount_min = 100, amount_max = 5000, probability = 0.05 * (math.pow(2, i - 2))}
      },
      main_product = "vrauks-mk0" .. i .. "-filament",
      mk_level = i,
      codex_name = "vrauks-codex",
      not_nvm = true
    },
    false
  )
end

for i=2,4 do
  py_veganism_globals.create_recipe(
    "vrauks-mk0" .. i,
    {{type = "item", name = "vrauk-molt", amount = 2}},
    py_veganism_globals.hex2rgb("#3b7958"),

    py_veganism_globals.costs,
    "vrauks-mk0" .. i .. "-breeder",
    py_veganism_globals.sub_recipes,
    {
      filament_icon_name = "vrauks",
      vegan_extra_ingredients = {
        {type = "fluid", name = "vrauks-mk0" .. i .. "-filament", amount = 100},
      },
      additional_results = {
        {type = "fluid", name = "vrauks-mk0" .. i .. "-filament", amount = 100, probability = 0.95}
      },
      main_product = "vrauks-mk0" .. i .. "-filament",
      mk_level = i,
      codex_name = "vrauks-codex",
      not_alive = true,
      not_nvm = true
    },
    false
  )
end

for i=2,4 do
  RECIPE {
    type = "recipe",
    name = "vrauks-mk0" .. i .. "-downcast",
    energy_required = 15,
    category = "bio-printer",
    ingredients = {
      {
        type = "fluid",
        name = "vrauks-mk0" .. i .. "-filament",
        amount = 100
      }
    },
    results = {
      {
        type = "fluid",
        name = (i == 2 and "vrauks-filament") or ("vrauks-mk0" .. (i - 1) .. "-filament"),
        amount = 100 * math.pow(2, i)
      }
    },
    main_product = (i == 2 and "vrauks-filament") or ("vrauks-mk0" .. (i - 1) .. "-filament")
  }:add_unlock("vrauks-mk0" .. i)
end
