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
  ["steam"] = 0.02
}

local sub_recipes = {
  ["vrauks"] = "vrauks-1",
  ["cocoon"] = "vrauks-cocoon-1",
  ["auog-pup"] = "auog-pup-breeding-1",
  ["cottongut-pup"] = "cottongut-cub-1",
  ["arqad-egg-nest"] = "arqad-egg-nests-1", 
  ["water-barrel"] = "water-barrel",
  ["natural-gas-barrel"] = "fill-natural-gas-barrel",
  ["arqad-honey-barrel"] = "fill-arqad-honey-barrel"
}

function hex2rgb(hex)
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
  {},
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
    special_container = "auog-approved-reinforced-wooden-chest"
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
  {},
  true
)
-- py_veganism_globals.create_recipe(
--   "arqad-queen",
--   {}
--   hex2rgb("#531f51"),

--   costs,
--   "arqad-queen-1",
--   sub_recipes,
--   {
--     filament_result_probability = 0.01
--   },
--   false
-- )
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
