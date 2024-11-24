local sounds = require("__base__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

data:extend({
  {
    type = "assembling-machine",
    name = "brick-kiln",
    icon = "__wood-industry__/graphics/icons/brick-kiln.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "brick-kiln"},
    max_health = 250,
    corpse = "brick-kiln-remnants",
    dying_explosion = "stone-furnace-explosion",
    resistances = {
      {type="fire", percent=90},
      {type="explosion", percent=30},
      {type="impact", percent=30}
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
    damaged_trigger_effect = hit_effects.rock(),
    crafting_categories = {"kiln-smelting", "organic-or-kiln"},
    crafting_speed = 1,
    energy_usage = "90kW",
    energy_source = {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = {pollution=2},
      light_flicker = {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke = {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 1,
          position = {0.0, -0.8},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.car_stone_impact,
    working_sound = data.raw.furnace["stone-furnace"].working_sound,
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__wood-industry__/graphics/entity/brick-kiln/brick-kiln.png",
            priority = "extra-high",
            width = 151,
            height = 146,
            frame_count = 1,
            shift = util.by_pixel(-0.25, 6),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-shadow.png",
            priority = "extra-high",
            width = 164,
            height = 74,
            frame_count = 1,
            draw_as_shadow = true,
            force_hr_shadow = true,
            shift = util.by_pixel(14.5, 13),
            scale = 0.5
          }
        }
      },
      working_visualisations = data.raw.furnace["stone-furnace"].graphics_set.working_visualisations,
      water_reflection = data.raw.furnace["stone-furnace"].graphics_set.water_reflection
    },
  },
  {
    type = "assembling-machine",
    name = "electric-kiln",
    icon = "__wood-industry__/graphics/icons/electric-kiln.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "electric-kiln"},
    max_health = 450,
    corpse = "electric-kiln-remnants",
    dying_explosion = "electric-furnace-explosion",
    resistances = {
      {type="fire", percent=90},
      {type="explosion", percent=30},
      {type="impact", percent=30}
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    module_specification = {
      module_slots = 2,
      module_info_icon_shift = {0, 0.8}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"kiln-smelting", "organic-or-kiln"},
    crafting_speed = 2,
    energy_usage = "180kW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = {pollution=1}
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = data.raw.furnace["electric-furnace"].working_sound,
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__wood-industry__/graphics/entity/electric-kiln/electric-kiln.png",
            priority = "high",
            width = 239,
            height = 219,
            frame_count = 1,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            frame_count = 1,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      },
      working_visualisations = data.raw.furnace["electric-furnace"].graphics_set.working_visualisations,
      water_reflection = data.raw.furnace["electric-furnace"].graphics_set.water_reflection
    }
  }
})
