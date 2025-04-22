local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "woodchips",
    icon = "__wood-industry__/graphics/icons/woodchips.png",
    icon_size = 64,
    pictures = {
      {size=64, filename="__wood-industry__/graphics/icons/woodchips.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/woodchips-1.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/woodchips-2.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/woodchips-3.png", scale=0.5, mipmap_count=4}
    },
    fuel_category = "chemical",
    fuel_value = "1MJ",
    subgroup = "raw-resource",
    order = "a[wood]-c[chips]",
    inventory_move_sound = item_sounds.wood_inventory_move,
    pick_sound = item_sounds.wood_inventory_pickup,
    drop_sound = item_sounds.wood_inventory_move,
    stack_size = 200,
    weight = 1*kg
  },
  {
    type = "item",
    name = "charcoal",
    icon = "__wood-industry__/graphics/icons/charcoal.png",
    icon_size = 64,
    pictures = {
      {size=64, filename="__wood-industry__/graphics/icons/charcoal.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/charcoal-1.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/charcoal-2.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/charcoal-3.png", scale=0.5, mipmap_count=4}
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
})

if settings.startup["wood-industry-resin"].value then
  data:extend({
    {
      type = "item",
      name = "resin",
      icon = "__wood-industry__/graphics/icons/resin.png",
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
