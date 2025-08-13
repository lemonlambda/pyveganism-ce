RECIPE {
    type = "recipe",
    name = "bio-printer-mk00",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "steam-engine",       amount = 5},
        {type = "item", name = "glass",              amount = 15},
        {type = "item", name = "electronic-circuit", amount = 10},
        {type = "item", name = "iron-gear-wheel",    amount = 20},
    },
    results = {
        {type = "item", name = "bio-printer-mk00", amount = 1}
    }
}:add_unlock("vrauks")

data:extend{
    {
        type = "item-subgroup",
        name = "py-alienlife-buildings-mk00",
        group = "py-alienlife",
        order = "a"
    },
}

local tint = {r = 0.5, g = 0.5, b = 0.5, a = 1.0}
local i = 0
local name = "bio-printer-mk0" .. i
local icon = "__pyveganism__/graphics/icons/" .. name .. ".png"
local icon_size = 64

ITEM {
    type = "item",
    name = name,
    icon = icon,
    icon_size = icon_size,
    flags = {},
    subgroup = "py-alienlife-buildings-mk0" .. i,
    order = "a",
    place_result = name,
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = name,
    icon = icon,
    icon_size = icon_size,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = name},
    fast_replaceable_group = "bio-printer",
    max_health = 300,
    corpse = "medium-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.1, -4.1}, {4.1, 4.1}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    forced_symmetry = "diagonal-pos",
    module_slots = 1,
    crafting_categories = {"bio-printer"},
    crafting_speed = 0.5,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {
            pollution = 3 * i
        },
    },
    energy_usage = "900kW",
    fluid_boxes_off_when_no_fluid_recipe = true,
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            pipe_connections = {{flow_direction = "input", position = {0.0, -4.0}, direction = defines.direction.north}},
            secondary_draw_orders = {north = -1}
        },
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            pipe_connections = {{flow_direction = "input", position = {-2.0, -4.0}, direction = defines.direction.north}},
            secondary_draw_orders = {north = -1}
        },
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            pipe_connections = {{flow_direction = "input", position = {2.0, -4.0}, direction = defines.direction.north}},
            secondary_draw_orders = {north = -1}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            pipe_connections = {{flow_direction = "output", position = {0.0, 4.0}, direction = defines.direction.south}},
            secondary_draw_orders = {north = -1}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            pipe_connections = {{flow_direction = "output", position = {-2.0, 4.0}, direction = defines.direction.south}},
            secondary_draw_orders = {north = -1}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
            volume = 1000,
            pipe_connections = {{flow_direction = "output", position = {2.0, 4.0}, direction = defines.direction.south}},
            secondary_draw_orders = {north = -1}
        },
    },
    graphics_set = {
        animation = {
            layers = {
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/base.png",
                    priority = "high",
                    width = 320,
                    height = 32,
                    line_length = 6,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(16, 128)
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/base-mask.png",
                    priority = "high",
                    width = 320,
                    height = 32,
                    line_length = 6,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(16, 128),
                    tint = tint
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a1.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-112, -64)
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a1-mask.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-112, -64),
                    tint = tint
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a2.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-48, -64)
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a2-mask.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-48, -64),
                    tint = tint
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a3.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(16, -64)
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a3-mask.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(16, -64),
                    tint = tint
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a4.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(80, -64)
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a4-mask.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(80, -64),
                    tint = tint
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a5.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(144, -64)
                },
                {
                    filename = "__pyalienlifegraphics__/graphics/entity/bio-printer/a5-mask.png",
                    priority = "high",
                    width = 64,
                    height = 352,
                    line_length = 32,
                    frame_count = 150,
                    animation_speed = 0.4,
                    shift = util.by_pixel(144, -64),
                    tint = tint
                },
            }
        },
    },
    impact_category = "metal",
    working_sound = {
        sound = {filename = "__pyalienlifegraphics__/sounds/bio-printer.ogg", volume = 0.9},
        idle_sound = {filename = "__pyalienlifegraphics__/sounds/bio-printer.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}

local modules = {
    allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
    allowed_module_categories = {"speed", "productivity", "efficiency", "bioprinting", "vrauks", "auog", "cottongut"},
}

ENTITY("bio-printer-mk00"):set_fields(modules)
ENTITY("bio-printer-mk01"):set_fields(modules)
ENTITY("bio-printer-mk02"):set_fields(modules)
ENTITY("bio-printer-mk03"):set_fields(modules)
ENTITY("bio-printer-mk04"):set_fields(modules)

for i=1,4 do
    ENTITY("biofactory-mk0" .. i).fluid_boxes[7] = {
        production_type = "input",
        pipe_covers = py.pipe_covers(false, true, true, true),
        pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
        volume = 1000,
        pipe_connections = {{flow_direction = "input", position = {-3.0, -0.0}, direction = defines.direction.west}},
        secondary_draw_orders = {north = -1}
    }
    ENTITY("biofactory-mk0" .. i).fluid_boxes[8] = {
        production_type = "input",
        pipe_covers = py.pipe_covers(false, true, true, true),
        pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.88}, nil, nil),
        volume = 1000,
        pipe_connections = {{flow_direction = "input", position = {3.0, -0.0}, direction = defines.direction.east}},
        secondary_draw_orders = {north = -1}
    }
end
