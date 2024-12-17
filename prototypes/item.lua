data:extend({
  {
    type = "item",
    name = "brick-kiln",
    icon = "__wood-industry__/graphics/icons/brick-kiln.png",
    subgroup = "smelting-machine",
    order = "b[kiln]-a[brick]",
    place_result = "brick-kiln",
    stack_size = 50
  },
  {
    type = "item",
    name = "woodchips",
    icon = "__wood-industry__/graphics/icons/woodchips.png",
    pictures = {
      {size=64, filename="__wood-industry__/graphics/icons/woodchips.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/woodchips-1.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/woodchips-2.png", scale=0.5, mipmap_count=4},
      {size=64, filename="__wood-industry__/graphics/icons/woodchips-3.png", scale=0.5, mipmap_count=4}
    },
    fuel_category = "chemical",
    fuel_value = "1MJ",
    subgroup = "raw-material",
    order = "A[wood]-a[chips]",
    stack_size = 200
  },
  {
    type = "item",
    name = "charcoal",
    icon = "__wood-industry__/graphics/icons/charcoal.png",
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
    order = "A[wood]-b[charcoal]",
    stack_size = 50
  },
  {
    type = "item",
    name = "electric-kiln",
    icon = "__wood-industry__/graphics/icons/electric-kiln.png",
    subgroup = "smelting-machine",
    order = "b[kiln]-b[electric]",
    place_result = "electric-kiln",
    stack_size = 50
  }
})

if settings.startup["wood-industry-resin"].value then
  data:extend({
    {
      type = "item",
      name = "resin",
      icon = "__wood-industry__/graphics/icons/resin.png",
      fuel_category = "chemical",
      fuel_value = "2MJ",
      fuel_emissions_multiplier = 2,
      subgroup = "raw-material",
      order = "b[chemistry]-a[resin]",
      stack_size = 50
    }
  })
end
