local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "brick-kiln",
    icon = "__wood-base-assets__/graphics/icons/brick-kiln.png",
    subgroup = "smelting-machine",
    order = "b[kiln]-a[brick]",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    place_result = "brick-kiln",
    stack_size = 50,
    weight = 20*kg
  },
  {
    type = "item",
    name = "woodchips",
    icon = "__wood-base-assets__/graphics/icons/woodchips.png",
    icon_size = 64,
    pictures = {
      {size=64, filename="__wood-base-assets__/graphics/icons/woodchips.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-base-assets__/graphics/icons/woodchips-1.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-base-assets__/graphics/icons/woodchips-2.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-base-assets__/graphics/icons/woodchips-3.png", scale=0.5, mipmap_count=4}
    },
    fuel_category = "chemical",
    fuel_value = "1MJ",
    subgroup = "raw-material",
    order = "A[wood]-a[chips]",
    inventory_move_sound = item_sounds.wood_inventory_move,
    pick_sound = item_sounds.wood_inventory_pickup,
    drop_sound = item_sounds.wood_inventory_move,
    stack_size = 200,
    weight = 1*kg
  },
  {
    type = "item",
    name = "charcoal",
    icon = "__wood-base-assets__/graphics/icons/charcoal.png",
    icon_size = 64,
    pictures = {
      {size=64, filename="__wood-base-assets__/graphics/icons/charcoal.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-base-assets__/graphics/icons/charcoal-1.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-base-assets__/graphics/icons/charcoal-2.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-base-assets__/graphics/icons/charcoal-3.png", scale=0.5, mipmap_count=4}
    },
    fuel_category = "chemical",
    fuel_value = "3MJ",
    fuel_emissions_multiplier = 0.75,
    subgroup = "raw-material",
    order = "b[chemistry]-eb[charcoal]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2*kg
  },
  {
    type = "item",
    name = "electric-kiln",
    icon = "__wood-base-assets__/graphics/icons/electric-kiln.png",
    subgroup = "smelting-machine",
    order = "b[kiln]-b[electric]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "electric-kiln",
    stack_size = 50,
    weight = 20*kg
  },
})

if settings.startup["wood-industry-resin"].value then
  data:extend({
    {
      type = "item",
      name = "resin",
      icon = "__wood-base-assets__/graphics/icons/resin.png",
      icon_size = 64,
      subgroup = "raw-material",
      order = "b[chemistry]-a[resin]",
      inventory_move_sound = item_sounds.sulfur_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.sulfur_inventory_move,
      fuel_category = "chemical",
      fuel_value = "2MJ",
      fuel_emissions_multiplier = 2,
      stack_size = 50,
      weight = 5*kg
    }
  })
end
