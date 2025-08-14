local item_icon = "__pyveganism__/graphics/icons/digosaur-prime.png"
local time_taken_for_digosaurus_to_mine = 15 -- seconds

RECIPE {
    type = "recipe",
    name = "digosaurus-prime",
    energy_required = 120,
    category = "creature-chamber",
    enabled = false,
    ingredients = {
        {type = "item",  name = "resistor1",             amount = 30},
        {type = "item",  name = "inductor1", amount = 10},
        {type = "item",  name = "small-parts-01",           amount = 10},
        {type = "item",  name = "titanium-plate",       amount = 50},
        {type = "fluid", name = "water-saline",         amount = 1000},
    },
    results = {{type = "item", name = "digosaurus-prime", amount = 1}}
}:add_unlock {"nexelit-mk01"}

ITEM {
    type = "module",
    name = "digosaurus-prime",
    icon = item_icon,
    icon_size = 64,
    subgroup = "py-alienlife-special-creatures",
    order = "xxa",
    stack_size = 10,
    flags = {},
    localised_name = {"entity-name.digosaurus-prime"},
    localised_description = {"entity-description.digosaurus-prime"},
    effect = {pollution = 1, speed = 1},
    category = "digosaurus",
    tier = 1,
}

local running_animation = {
    layers = {
        {
            filename = "__pyveganism__/graphics/entity/digosaurus-prime/walk.png",
            width = 128,
            height = 128,
            shift = util.by_pixel(0.0, 0.0),
            frame_count = 18,
            direction_count = 8,
            animation_speed = 1,
            scale = 0.8
        },
        {
            filename = "__pyalienlifegraphics3__/graphics/entity/dig-osaur/walk-sh.png",
            width = 128,
            height = 128,
            shift = util.by_pixel(6, 0),
            frame_count = 18,
            direction_count = 8,
            animation_speed = 1,
            draw_as_shadow = true,
            scale = 0.8
        }
    }
}

local mining_animation = {
    layers = {
        {
            stripes = {
                {
                    filename = "__pyveganism__/graphics/entity/digosaurus-prime/mining-1.png",
                    width_in_frames = 17,
                    height_in_frames = 8
                },
                {
                    filename = "__pyveganism__/graphics/entity/digosaurus-prime/mining-2.png",
                    width_in_frames = 18,
                    height_in_frames = 8
                }
            },
            width = 128,
            height = 128,
            shift = util.by_pixel(0, 0),
            frame_count = 35,
            direction_count = 8,
            animation_speed = 1,
            scale = 0.8
        },
        {
            stripes = {
                {
                    filename = "__pyalienlifegraphics3__/graphics/entity/dig-osaur/mining-sh1.png",
                    width_in_frames = 17,
                    height_in_frames = 8
                },
                {
                    filename = "__pyalienlifegraphics3__/graphics/entity/dig-osaur/mining-sh2.png",
                    width_in_frames = 18,
                    height_in_frames = 8
                }
            },
            width = 128,
            height = 128,
            shift = util.by_pixel(6, 0),
            frame_count = 35,
            direction_count = 8,
            animation_speed = 1,
            draw_as_shadow = true,
            scale = 0.8
        }
    }
}

ENTITY {
    type = "unit",
    name = "digosaurus-prime",
    icon = item_icon,
    icon_size = 64,
    ai_settings = {do_separation = false},
    flags = {"placeable-neutral", "placeable-player", "player-creation", "placeable-off-grid", "breaths-air", "not-repairable", "not-on-map", "not-flammable", "not-in-kill-statistics"},
    max_health = 300,
    subgroup = "creatures",
    healing_per_tick = 0.01,
    collision_box = {{0, 0}, {0, 0}},
    collision_mask = {layers = {}},
    attack_parameters = {
        type = "projectile",
        range = 1,
        cooldown = 30,
        ammo_category = "melee",
        ammo_type = _G.make_unit_melee_ammo_type(1),
        animation = mining_animation
    },
    --selectable_in_game = false,
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    vision_distance = 30,
    movement_speed = 0.076,
    distance_per_frame = 0.13,
    absorptions_to_join_attack = {pollution = 4},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    dying_explosion = "blood-explosion-small",
    has_belt_immunity = true,
    affected_by_tiles = true,
    run_animation = running_animation
}

RECIPE {
    type = "recipe",
    name = "digosaurus-prime-hidden-recipe",
    ingredients = {},
    results = {{type = "item", name = "nexelit-ore", amount = 4000}},
    category = "dino-dig-site",
    enabled = false,
    localised_name = {"entity-name.ore-nexelit"},
    hidden = true,
    energy_required = 1
}:add_unlock {"nexelit-mk01"}

local sound = {
    type = "play-sound",
    sound =
    {
        aggregation =
        {
            max_count = 3,
            remove = true
        },
        variations =
        {
            {
                filename = "__core__/sound/axe-mining-ore-1.ogg",
                volume = 0.4
            },
            {
                filename = "__core__/sound/axe-mining-ore-2.ogg",
                volume = 0.4
            },
            {
                filename = "__core__/sound/axe-mining-ore-3.ogg",
                volume = 0.4
            },
            {
                filename = "__core__/sound/axe-mining-ore-4.ogg",
                volume = 0.4
            },
            {
                filename = "__core__/sound/axe-mining-ore-5.ogg",
                volume = 0.4
            }
        }
    }
}

ENTITY {
    type = "simple-entity",
    name = "digosaurus-prime-mineable-proxy",
    localised_name = "",
    localised_description = "",
    icon = item_icon,
    icon_size = 64,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selectable_in_game = false,
    remove_decoratives = "false",
    collision_mask = {layers = {}},
    hidden = true,
    flags = {"not-in-kill-statistics", "placeable-neutral", "not-selectable-in-game", "not-rotatable", "not-flammable", "placeable-off-grid", "hide-alt-info"},
    max_health = time_taken_for_digosaurus_to_mine,
    picture = {
        filename = "__core__/graphics/empty.png",
        width = 1,
        height = 1
    },
    attack_reaction = {{
        range = 150,
        action = {
            action_delivery = {
                source_effects = {sound},
                type = "instant"
            },
            type = "direct"
        }
    }}
}

