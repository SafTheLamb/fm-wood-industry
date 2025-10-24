if mods["Voidcraft"] then
  local vcc = require("__Voidcraft__.prototypes.costs")

  local charcoal_bad_product = mods["space-age"] and "spoilage" or "carbon"

  VOIDCRAFT.create_auto_groups({ { "voidcraft-wood", "vccw" } })
  local charcoal_recipe = {
    VOIDCRAFT.voidcraft_recipe({ prefix = "__wood-industry__", subgroup = "voidcraft-wood", amt2 = 2 },
      { "charcoal", "woodchips", charcoal_bad_product }, "vcba", vcc.smelted_product, "s6x-voidcraft", { 0.48, 0.4, 0.1 })
  }
  local charcoal_fluxcoh_recipe = {}
  for r, rd in pairs(charcoal_recipe) do
    rd.vc_fluxize = true
    rd.vc_coherize = true
    table.insert(charcoal_fluxcoh_recipe, VOIDCRAFT.fluxize(rd))
    table.insert(charcoal_fluxcoh_recipe, VOIDCRAFT.coherize(rd))
  end
  data:extend(charcoal_recipe)
  data:extend(charcoal_fluxcoh_recipe)

  if settings.startup["wood-industry-resin"].value then
    local resin_recipe = {
      VOIDCRAFT.voidcraft_recipe({ prefix = "__wood-industry__", subgroup = "voidcraft-wood" },
        { "resin", "wood", "sulfur" }, "vcbb", vcc.petrochem_product, "s6x-voidcraft", { 0.48, 0.4, 0.1 })
    }
    local resin_flxcoh_recipe = {}
    for r, rd in pairs(resin_recipe) do
      rd.vc_fluxize = true
      rd.vc_coherize = true
      table.insert(resin_flxcoh_recipe, VOIDCRAFT.fluxize(rd))
      table.insert(resin_flxcoh_recipe, VOIDCRAFT.coherize(rd))
    end
    data:extend(resin_recipe)
    data:extend(resin_flxcoh_recipe)
  end
end
