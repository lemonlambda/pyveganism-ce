local DEBUG = true

require("prototypes.datastage-globals")
require("prototypes.item-group")
require("prototypes.crafting-category")

local enabled_concepts = {
    --technologies
    "technologies.oil-plants",
    "technologies.protein-plants",
    "technologies.oil-seeds",
    "technologies.sugar-plants",
    "technologies.growth-media",
    "technologies.plant-breeding",
    "technologies.cultivation-expertise",
    "technologies.biotechnology",
    --
    --buildings
    "buildings.bio-printer-mk00",
    --
    --plants
    "plants.tiriscefing-willow",
    "plants.oil-palm",
    "plants.calknut",
    "plants.cocoa",
    "plants.canola",
    "plants.guar",
    "plants.sugar-beet",
    "plants.sugar-cane",
    "plants.cadaver-arum",
    --
    --microorganisms
    "microorganisms.fiicorum",
    "microorganisms.zirrella",
    "microorganisms.solfaen",
    "microorganisms.sludge",
    "microorganisms.proxae",
    "microorganisms.pseudodaemonas",
    "microorganisms.morgenroete",
    "microorganisms.e-coli",
    "microorganisms.pemtenn",
    --
    --fungi
    "fungi.atztazzae",

    -- yes
    "plant-residues",
    
    --miscellaneous
    "misc.samples",
    "misc.citric-acid",
    "misc.grow-equipment",
    "misc.ammonium-sulfate"
}

local function try_load(file)
    local ok, err = pcall(require, file)
    if not ok and not err:find("^module .* not found") then
        error(err)
    end
end

for _, concept in pairs(enabled_concepts) do
    try_load("prototypes." .. concept)
end

for _, concept in pairs(enabled_concepts) do
    try_load("prototypes." .. concept .. "-recipes")
end

require("prototypes.generic-growing-recipes")
require("prototypes.trash-plant-recipes")

if DEBUG then
    require("prototypes.testing")
end
