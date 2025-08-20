py_veganism_globals.costs = {
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
  ["ash"] = 1, -- placeholder
  ["steam"] = 1, -- placeholder
  ["tuuphra"] = 1, -- placeholder
  ["kicalk"] = 1, -- placeholder
  ["fish"] = 1, -- placeholder
  ["kicalk-seeds"] = 1, -- placeholder
  ["seaweed"] = 1, -- placeholder
  ["salt"] = 1, -- placeholder
  ["fish-oil"] = 1, -- placeholder
  ["stone-wool"] = 1, -- placeholder
  ["pressured-water"] = 1, -- placeholder
  ["fawogae-substrate"] = 1, -- placeholder
  ["bones"] = 1, -- placeholder
  ["starch"] = 1, -- placeholder
  ["guar-gum"] = 1, -- placeholder
  ["water-saline"] = 1, -- placeholder
  ["phytoplankton"] = 1, -- placeholder
  ["rennea"] = 1, -- placeholder
  ["navens"] = 1, -- placeholder
  ["blood"] = 1, -- placeholder
  ["sea-sponge"] = 1, -- placeholder
  ["alien-sample-02"] = 1, -- placeholder
  ["alien-sample-03"] = 1, -- placeholder
  ["vrauks-food-01"] = 1, -- placeholder
  ["vrauks-food-02"] = 1, -- placeholder
  ["vrauks-food-03"] = 1, -- placeholder
  ["ulric-food-01"] = 1, -- placeholder
  ["ulric-food-02"] = 1, -- placeholder
  ["ulric-food-03"] = 1, -- placeholder
  ["korlex-food-01"] = 1, -- placeholder
  ["korlex-food-02"] = 1, -- placeholder
  ["korlex-food-03"] = 1, -- placeholder
  ["zipir-food-01"] = 1, -- placeholder
  ["zipir-food-02"] = 1, -- placeholder
  ["zipir-food-03"] = 1, -- placeholder
  ["dna-polymerase"] = 1, -- placeholder
  ["fetal-serum"] = 1, -- placeholder
  ["artificial-blood"] = 1, -- placeholder
  ["fish-egg"] = 1, -- placeholder
  ["cottongut-food-01"] = 1, -- placeholder
  ["cottongut-food-02"] = 1, -- placeholder
  ["cottongut-food-03"] = 1, -- placeholder
  ["cottongut-food-04"] = 1, -- placeholder
  -- [""] = 1, -- placeholder
  -- [""] = 1, -- placeholder

}

py_veganism_globals.sub_recipes = {
  ["water-barrel"] = "water-barrel",

  -- Vrauks
  ["non-viable-vrauk-mass"] = "vrauks-1",
  ["vrauks"] = "vrauks-1",
  ["cocoon"] = "vrauks-cocoon-1",
  ["cocoon-mk02"] = "vrauks-mk02-cocoon",
  ["cocoon-mk03"] = "vrauks-mk03-cocoon",
  ["cocoon-mk04"] = "vrauks-mk04-cocoon",

  -- Auogs
  ["auog-pup"] = "auog-pup-breeding-1",

  -- Cottonguts
  ["cottongut-pup"] = "cottongut-cub-1",
  ["cottongut-mk01"] = "cottongut-mature-basic-01",
  ["cottongut-pup-mk01"] = "cottongut-pup-mk01-raising",
  

  -- Ulric
  ["ulric-cub"] = "ulric-cub-1",
  -- ["ulric-food-01"] = "ulric-food-01",

  -- Korlex
  ["korlex-pup"] = "korlex-pup-1",
  -- ["korlex-food-01"] = "korlex-food-01",

  -- Zipir
  ["zipir-eggs"] = "zipir-eggs-1",
  -- ["zipir-food-01"] = "zipir-food-01",
  -- ["zipir-food-02"] = "zipir-food-02",

  -- Arqad
  ["natural-gas-barrel"] = "natural-gas-barrel",
  ["arqad-honey-barrel"] = "arqad-honey-barrel",
  ["arqad-egg-nest"] = "arqad-egg-nests-1",
  ["arqad-maggots"] = "arqad-maggots-1-vegan",
}

function py_veganism_globals.create_non_viable_mass(name, extra)
  if not extra.empty then
    py_veganism_globals["non_viable_" .. string.gsub(name, "-", "_") .. "_mass_icon"] = {
        {icon = "__pyveganism__/graphics/icons/" .. (extra.sack_icon or "burlap-sack") .. ".png", icon_size = 64},
        {icon = "__pyveganism__/graphics/icons/" .. name .. "-gray.png", icon_size = 64, scale = 0.25, shift = {0, 3}},
    }

    ITEM {
        type = "item",
        name = "non-viable-" .. name .. "-mass",
        icons = py_veganism_globals["non_viable_" .. string.gsub(name, "-", "_") .. "_mass_icon"],
        subgroup = "py-veganism-" .. (extra.subgroup_name or name),
        enabled = false,
        stack_size = 200,
    }
  else
    ITEM {
        type = "item",
        name = "non-viable-" .. name .. "-mass",
        icon = "__pyveganism__/graphics/icons/filaments/lemon-filament.png",
        subgroup = "py-veganism-" .. (extra.subgroup_name or name),
        enabled = false,
        stack_size = 200,
    }
  end
end

function py_veganism_globals.hex2rgb(hex)
    hex = hex:gsub("#","")
    return {tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255}
end

-- New Filament Recipes
require("vrauks-filaments")

py_veganism_globals.create_recipe(
  "auog",
  {{type = "item", name = "auog-fur-tuft", amount = 2}},
  py_veganism_globals.hex2rgb("#0f131d"),

  py_veganism_globals.costs,
  "auog-maturing-1",
  py_veganism_globals.sub_recipes,
  {
    special_container = "auog-approved-reinforced-wooden-chest",
  },
  true
)

require("cottongut-filaments")
require("arqad-filaments")
require("ulric-filaments")
require("korlex-filaments")
require("zipir-filaments")

-- py_veganism_globals.create_recipe(
--   "korlex",
--   {}
--   py_veganism_globals.hex2rgb("#38677e"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "xyhiphoe",
--   {}
--   py_veganism_globals.hex2rgb("#ab7a3c"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )
-- py_veganism_globals.create_recipe(
--   "",
--   {}
--   py_veganism_globals.hex2rgb("#"),

--   py_veganism_globals.costs,
--   "",
--   py_veganism_globals.sub_recipes
-- )

py_veganism_globals.replace_ingredients()
