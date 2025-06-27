require("prototypes.updates.compostable-items")
require("prototypes.updates.handcrafting")

-- we add the hidden stuff late to avoid problems with other mods that change
-- beacon or module prototypes
require("prototypes.buildings.hidden-beacon")

RECIPE("ralesia-biomass"):replace_ingredient("water", "hydrogen")
