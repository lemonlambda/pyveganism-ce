RECIPE {
  type = "recipe",
  name = "render-non-viable-zipir-mass",
  icons = table.extend(
    ITEM("non-viable-zipir-fluid-barrel").icons,
    {{icon = "__pyveganism__/graphics/icons/rendering.png"}}
  ),
  category = "slaughterhouse",
  energy_required = 10,
  ingredients = {
    {
      type = "item",
      name = "non-viable-zipir-fluid-barrel",
      amount = 1
    }
  },
  results = {
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
      amount = 3
    },
    {
      type = "item",
      name = "brain",
      amount = 1
    },
    {
      type = "fluid",
      name = "arthropod-blood",
      amount = 30
    },
    {
      type = "item",
      name = "mukmoux-fat",
      amount = 2
    },
    {
      type = "item",
      name = "barrel",
      amount = 1
    }
  },
  subgroup = "py-veganism-zipir1",
}

py_veganism_globals.register_replace_ingredients_caged("zipir1", "non-viable-zipir-fluid-barrel", "barrel")
py_veganism_globals.create_recipe(
  "zipir1",
  {},
  py_veganism_globals.hex2rgb("#3e597f"),

  py_veganism_globals.costs,
  "zipir-a-1",
  py_veganism_globals.sub_recipes,
  {
    codex_name = "zipir-codex",
    result_probability = 0.7,
    result_alive_probability = 0.7,
    result_multiplier = 1,
    result_alive_multiplier = 1,
    nvm_name = "non-viable-zipir-fluid-barrel",
    special_container = "barrel",
  },
  false
)

local unviable_zipir_eggs = table.deepcopy(data.raw.item["zipir-eggs"])
unviable_zipir_eggs.name = "unviable-zipir-eggs"
unviable_zipir_eggs.icons = {
  {icon = unviable_zipir_eggs.icon},
  {icon = "__pyveganism__/graphics/icons/vegan.png"}
}
unviable_zipir_eggs.icon = nil
ITEM(unviable_zipir_eggs)

local py2_recipe = table.deepcopy(data.raw.recipe["py-science-pack-2"])
py2_recipe.name = "py-science-pack-2-vegan"

for _, ingredient in pairs(py2_recipe.ingredients) do
  if ingredient.name == "zipir-eggs" then
    ingredient.name = "unviable-zipir-eggs"
  end
end

RECIPE(py2_recipe):add_unlock("py-science-pack-mk02")

RECIPE {
  type = "recipe",
  name = "print-zipir-egg",
  category = "bio-printer",
  energy_required = 60,
  subgroup = "py-veganism-zipir1",
  ingredients = {
    {
      type = "fluid",
      name = "zipir1-filament",
      amount = 50
    },
  },
  results = {
    {
      type = "item",
      name = "unviable-zipir-eggs",
      amount_min = 7,
      amount_max = 8
    }
  },
  main_product = "unviable-zipir-eggs"
}:add_unlock("zipir1")
