local DEBUG = true

require("prototypes.datastage-globals")
require("prototypes.item-group")
require("prototypes.crafting-category")
require("prototypes.functions.helpers")

local enabled_concepts = {
    --technologies
    "technologies.oil-plants",
    "technologies.oil-plants-recipes",
    "technologies.oil-seeds",
    "technologies.oil-seeds-recipes",
    "technologies.sugar-plants",
    "technologies.sugar-plants-recipes",
    "technologies.growth-media",
    "technologies.growth-media-recipes",

    --plants
    "plants.oil-palm",
    "plants.oil-palm-recipes",
    "plants.calknut",
    "plants.calknut-recipes",
    "plants.guar",
    "plants.guar-recipes",
    "plants.sugar-cane",
    "plants.sugar-cane-recipes",
    --
    --microorganisms
    "microorganisms.fiicorum",
    "microorganisms.fiicorum-recipes",
    -- "microorganisms.zirrella",
    -- "microorganisms.zirrella-recipes",
    -- "microorganisms.solfaen",
    -- "microorganisms.solfaen-recipes",
    -- "microorganisms.sludge",
    -- "microorganisms.sludge-recipes",
    "microorganisms.proxae",
    "microorganisms.proxae-recipes",
    -- "microorganisms.morgenroete",
    -- "microorganisms.morgenroete-recipes",
    "microorganisms.e-coli",
    "microorganisms.e-coli-recipes",
    "microorganisms.pemtenn",
    "microorganisms.pemtenn-recipes",

    -- organisms
    "filament-prefluids",
    "organisms.vrauk-molting",

    --fungi
    -- "fungi.atztazzae",
    -- "fungi.atztazzae-recipes",

    -- yes
    -- "plant-residues",
    "digosaurus-prime",

    --miscellaneous
    -- "misc.samples",
    -- "misc.samples-recipes",
    -- "misc.citric-acid",
    -- "misc.citric-acid-recipes",
    -- "misc.grow-equipment-recipes",
    -- "misc.ammonium-sulfate",
    -- "misc.ammonium-sulfate-recipes",
    "misc.tofu-recipes",
    "misc.burlap",
    "misc.reinforced-wooden-chest",
    "misc.meat-alternatives",

    --buildings
    "buildings.bio-printer-mk00",
    "buildings.ball-mill-mk00",
}

for _, concept in pairs(enabled_concepts) do
    require("prototypes." .. concept)
end

if DEBUG then
    require("prototypes.testing")
end
