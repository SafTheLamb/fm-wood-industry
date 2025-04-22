if mods["Voidcraft"] then
  local vcc = require("__Voidcraft__.prototypes.costs")
  
  local charcoal_bad_product = mods["space-age"] and "spoilage" or "carbon"
  
  VOIDCRAFT.create_auto_groups({{"voidcraft-wood", "vccw"}})

  data:extend({
    VOIDCRAFT.voidcraft_recipe({prefix="__wood-industry__", subgroup="voidcraft-wood", amt2=2}, {"charcoal", "woodchips", charcoal_bad_product}, "vcba", vcc.smelted_product, "s6x-voidcraft", {0.48, 0.4, 0.1})
  })

  if settings.startup["wood-industry-resin"].value then
    data:extend({
      VOIDCRAFT.voidcraft_recipe({prefix="__wood-industry__", subgroup="voidcraft-wood"}, {"resin", "wood", "sulfur"}, "vcbb", vcc.petrochem_product, "s6x-voidcraft", {0.48, 0.4, 0.1})
    })
  end
end
