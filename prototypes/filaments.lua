local costs = {
  ["native-flora"] = 9.57,
  ["moondrop"] = 6.07,
  ["ralesia-seeds"] = 1.89,
  ["wood-seeds"] = 2.95,
  ["moss"] = 2.55,
  ["saps"] = 10,
  ["water"] = 0.01,
  ["barrel"] = 0,
  ["natural-gas"] = 3.35/50,
  ["arqad-honey"] = 45.7/50,
  ["fawogae"] = 0.46,
  ["agar"] = 17.7,
  ["cellulose"] = 7.73,
  ["empty-comb"] = 1, -- placeholder
  ["honeycomb"] = 1, -- placeholder
  ["redhot-coke"] = 1, -- placeholder
  ["ralesia"] = 1, -- placeholder
}

local sub_recipes = {
  ["water-barrel"] = "water-barrel",

  -- Vrauks
  ["non-viable-vrauk-mass"] = "vrauks-1",
  ["vrauks"] = "vrauks-1",
  ["cocoon"] = "vrauks-cocoon-1",

  -- Auogs
  ["auog-pup"] = "auog-pup-breeding-1",

  -- Cottonguts
  ["cottongut-pup"] = "cottongut-cub-1",

  -- Arqad
  ["natural-gas-barrel"] = "natural-gas-barrel",
  ["arqad-honey-barrel"] = "arqad-honey-barrel",
  ["arqad-egg-nest"] = "arqad-egg-nests-1",
  ["arqad-maggots"] = "arqad-maggots-1-vegan",
}

local function create_non_viable_mass(name, extra)
  py_veganism_globals["non_viable_" .. string.gsub(name, "-", "_") .. "_mass_icon"] = {
      {icon = "__pyveganism__/graphics/icons/burlap-sack.png", icon_size = 64},
      {icon = "__pyveganism__/graphics/icons/" .. name .. "-gray.png", icon_size = 64, scale = 0.25, shift = {0, 3}},
  }

  ITEM {
      type = "item",
      name = "non-viable-" .. name .. "-mass",
      icons = py_veganism_globals.non_viable_vrauk_mass_icon,
      subgroup = "py-veganism-" .. (extra.subgroup_name or name),
      enabled = false,
      stack_size = 200,
  }
end

local function hex2rgb(hex)
    hex = hex:gsub("#","")
    return {tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255}
end

-- New Filament Recipes
py_veganism_globals.create_recipe(
  "vrauks",
  {{type = "item", name = "vrauk-molt", amount = 2}},
  hex2rgb("#3b7958"),

  costs,
  "vrauks-1",
  sub_recipes,
  {
    vege = true
  },
  true
)
py_veganism_globals.create_recipe(
  "auog",
  {{type = "item", name = "auog-fur-tuft", amount = 2}},
  hex2rgb("#0f131d"),

  costs,
  "auog-maturing-1",
  sub_recipes,
  {
    special_container = "auog-approved-reinforced-wooden-chest",
    vege = true,
  },
  true
)
py_veganism_globals.create_recipe(
  "cottongut",
  {{type = "item", name = "cottongut-fur-tuft", amount = 2}},
  hex2rgb("#323d44"),

  costs,
  "caged-cottongut-1",
  sub_recipes,
  {
    vege = true
  },
  true
)

require("arqad-filaments")

-- py_veganism_globals.create_recipe(
--   "ulric",
--   {}
--   hex2rgb("#304657"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "korlex",
--   {}
--   hex2rgb("#38677e"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "xyhiphoe",
--   {}
--   hex2rgb("#ab7a3c"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   hex2rgb("#"),

--   costs,
--   "",
--   sub_recipes
-- )

py_veganism_globals.replace_ingredients()
