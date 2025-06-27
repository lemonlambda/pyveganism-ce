local recipe_plankton_farm = RECIPE("plankton-farm")
recipe_plankton_farm:set_fields{ enabled = true, }
recipe_plankton_farm:replace_ingredient("storage-tank", "py-tank-1500")
recipe_plankton_farm:replace_ingredient("niobium-plate", "iron-plate")

local recipe_bio_reactor = RECIPE("bio-reactor")
recipe_bio_reactor:set_fields{ enabled = true, }
recipe_bio_reactor:replace_ingredient("advanced-circuit", "electronic-circuit")
recipe_bio_reactor:replace_ingredient("gasturbinemk02", "gasturbinemk01")
recipe_bio_reactor:remove_ingredient("super-alloy")
recipe_bio_reactor:remove_ingredient("mixer-mk01")

RECIPE("chemical-plant"):set_fields{ enabled = true, }
RECIPE("mixer-mk01"):set_fields{ enabled = true, }


for i = 1, 4 do
    local name = "bio-reactor-mk0" .. i

    -- Add more pipe connections to the bio reactor, so that it can have recipe with up to 4 fluid in-/outputs
    data.raw["assembling-machine"][name]["fluid_boxes"] = {
        --North
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {1.0, -3.0}, direction = defines.direction.north}},
            priority = "extra-high"
        },
        --North2
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {2.0, -3.0}, direction = defines.direction.north}},
            priority = "extra-high"
        },
        --North3
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {-1.0, -3.0}, direction = defines.direction.north}},
            priority = "extra-high"
        },
        --North4
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {-2.0, -3.0}, direction = defines.direction.north}},
            priority = "extra-high"
        },
        --South
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "input", position = {1.0, 3.0}, direction = defines.direction.south}},
            priority = "extra-high"
        },
        --South2
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "input", position = {2.0, 3.0}, direction = defines.direction.south}},
            priority = "extra-high"
        },
        --South3
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "input", position = {-1.0, 3.0}, direction = defines.direction.south}},
            priority = "extra-high"
        },
        --South4
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "input", position = {-2.0, 3.0}, direction = defines.direction.south}},
            priority = "extra-high"
        },
    }
end
