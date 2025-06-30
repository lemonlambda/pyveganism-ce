local vegan_mode = settings.startup["pyveganism-hardcore-vegan"].value
local vegetarian_mode = settings.startup["pyveganism-hardcore-vegetarian"].value

if not vegan_mode and not vegetarian_mode then
    return
end

local nonvegan_recipes = {
}

local nonvegetarian_recipes = {
    "full-render-ulrics",
    "extract-ulric-eye",
    "full-render-auogs",
    "extract-auog-eye",
    "full-render-mukmoux",
    "extract-mukmoux-eye",
    "full-render-vrauks",
    "full-render-arthurian",
    "full-render-dhilmoss",
    "extract-dhilmos-eye",
    "full-render-scrondrixs",
    "extract-scrondrix-eye",
    "full-render-phadais",
    "full-render-fish",
    "full-render-dingrits",
    "full-render-kmauts",
    "full-render-vonix",
    "full-render-phagnots",
    "full-render-xenos",
    "full-render-antelope",
    "full-render-zipir",
    "full-render-trit",
    "full-render-xyhiphoe",
    "full-render-simik",
    "full-render-kor",
    "full-render-cottongut",
    "full-render-arqads",
    "full-render-num",
    "full-render-zun",

    -- misc stuff
    "magnetic-organ",
    "ex-used-auog",
    "glandular-myocluster",
    "polynuclear-ganglion",
    "autoantigens",
    "intestinal-ee",
    "subdermal-chemosnare",
    "snarer-heart",
    "geostabilization-tissue",
    "cognition-osteochain",
    "dimensional-gastricorg",
    "adaptable-automucosa",
    "hormonal",
    "cryogland",
    "lcc",
    "aeroorgan",
    "vsk",
    "adrenal-cortex",
    "ex-pelt-din",
    "ex-used-dingrits",
    "ex-chi-xeno",
    "sternite-lung",
    "ex-chi-arq",
    "ex-venom-arq",
}

local animals = {
    "ulr",
    "auog",
    "muk",
    "vrauks",
    "art",
    "dhi",
    "scro",
    "pha",
    "din",
    "kma",
    "von",
    "phag",
    "xeno",
    "zipir",
    "trit",
    "xyh",
    "sim",
    "khr",
    "cot",
    "kor",
    "arq",
    "num",
    "zun",
}

local prefixes = {
    "ex-blo",
    "ex-bon",
    "ex-bra",
    "ex-fat",
    "ex-gut",
    "ex-me",
    "ex-ski"
}

for _,animal in pairs(animals) do
    for _,prefix in pairs(prefixes) do
        table.insert(nonvegetarian_recipes, prefix .. "-" .. animal)
    end
end

local function disable_recipe(name)
    --seems like I don't need to check if the recipe exists
    --so the optional pymods are no problem
    local recipe = RECIPE(name)

    --setting them to hidden makes the player unable to craft them
    --disabling them would be harder to do because you would need to find all the technologies that unlock them
    --deleting them would break all mods who try to change the recipe in later stages
    recipe:set_fields{ hidden = true }
end

function each(tbl, callback)
    for k, v in pairs(tbl) do
        callback(v, k)
    end
    return tbl
end

if vegan_mode then
    each(nonvegan_recipes, disable_recipe)
end

each(nonvegetarian_recipes, disable_recipe)
