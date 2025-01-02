local frep = require("__fdsl__.lib.recipe")

-------------------------------------------------------------------------- Item changes

if mods["space-age"] and settings.startup["wood-industry-carbon-buff"].value then
  data.raw.item["carbon"].fuel_value = "5MJ"
end

data.raw.item["stone-furnace"].order = "a[furnace]-a[stone]"
data.raw.item["steel-furnace"].order = "a[furnace]-b[steel]"
data.raw.item["electric-furnace"].order = "a[furnace]-c[electric]"
if mods["aai-industry"] then
  data.raw.item["industrial-furnace"].order = "a[furnace]-d[industrial]"
end

if settings.startup["wood-industry-nerf-wood-fuel"].value then
  data.raw.item["wood"].fuel_value = "1MJ"
  data.raw.item["woodchips"].fuel_value = "0.5MJ"
  if mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value then
    data.raw.item["lumber"].fuel_value = "2MJ"
  end
end

-------------------------------------------------------------------------- Recipe changes

if settings.startup["wood-industry-carbon-steel"].value then
  data.raw.recipe["steel-plate"].category = "kiln-smelting"
  frep.add_ingredient("steel-plate", {type="item", name="charcoal", amount=1})
  
  if mods["space-age"] then
    frep.add_ingredient("casting-steel", {type="item", name="carbon", amount=1})
    frep.scale_result("casting-steel", "steel-plate", {amount=2})
    frep.change_time("casting-steel", {scale=2})
    frep.add_ingredient("tungsten-plate", {type="item", name="charcoal", amount=1})
  end
end

if mods["space-age"] then
  frep.add_ingredient("carbon", {type="item", name="charcoal", amount=1})
  if settings.startup["wood-industry-carbon-buff"].value then
    frep.modify_ingredient("coal-synthesis", "carbon", {amount=3})
  end

  frep.add_ingredient("artificial-yumako-soil", {type="item", name="charcoal", amount=12})
  frep.add_ingredient("artificial-jellynut-soil", {type="item", name="charcoal", amount=12})

  if settings.startup["wood-industry-carbon-military"].value then
    if mods["wood-military"] and settings.startup["wood-military-hard-mode"].value then
      frep.replace_ingredient("grenade", "coal", {type="item", name="carbon", amount=4})
    end
    frep.replace_ingredient("explosives", "coal", "carbon")
    frep.replace_ingredient("poison-capsule", "coal", {type="item", name="carbon", amount=6})
    frep.replace_ingredient("slowdown-capsule", "coal", {type="item", name="carbon", amount=4})
  end
end

if settings.startup["wood-industry-resin"].value then
  frep.add_ingredient("plastic-bar", {type="item", name="resin", amount=1})
  if mods["space-age"] then
    data.raw.recipe["resin"].category = "organic-or-chemistry"
    frep.add_ingredient("bioplastic", {type="item", name="resin", amount=1})
  end
end

if settings.startup["wood-industry-heavy-oil-adsorption"].value then
  if mods["aai-industry"] then
    frep.add_ingredient("advanced-oil-processing", {type="item", name="charcoal", amount=1})
    data.raw.recipe["advanced-oil-processing"].order = "a[oil-processing]-b[advanced-oil-processing]b"
  end
end

if settings.startup["wood-industry-lubricant"].value then
  frep.add_ingredient("lubricant", {type="item", name="charcoal", amount=1})

  if mods["space-age"] then
    frep.add_ingredient("biolubricant", {type="item", name="charcoal", amount=1})
  end
end

if mods["space-age"] then
  frep.add_ingredient("artificial-yumako-soil", {type="item", name="charcoal", amount=5})
  frep.add_ingredient("artificial-jellynut-soil", {type="item", name="charcoal", amount=5})
end

-------------------------------------------------------------------------- BZ mods

if mods["bzlead"] and settings.startup["wood-industry-lead"].value then
  data.raw.recipe["lead-plate"].category = "kiln-smelting"
  frep.add_ingredient("lead-plate", {type="item", name="charcoal", amount=1})
  frep.scale_ingredient("lead-plate", "lead-ore", {amount=2.5})
  frep.scale_result("lead-plate", "lead-plate", {amount=2.5})
  frep.scale_result("lead-plate", "copper-ore", {probability=2.5})

  if mods["space-age"] then
    -- still use charcoal here instead of carbon, since its role in lead smelting is specifically a purifying agent
    frep.add_ingredient("molten-lead-from-lava", {type="item", name="charcoal", amount=5})
    frep.add_ingredient("molten-lead", {type="item", name="charcoal", amount=5})
  end
end

if mods["bztin"] and settings.startup["wood-industry-tin"].value then
  data.raw.recipe["solder"].category = "kiln-smelting"
  if mods["aai-industry"] then
    data.raw.recipe["glass"].category = "kiln-smelting"
    frep.add_ingredient("glass", {type="item", name="tin-ore", amount=1})
    frep.scale_ingredient("glass", "sand", {amount=5})
    frep.scale_result("glass", "glass", {amount=5})
  end
  if settings.startup["bztin-more-intermediates"].value == "bronze" then
    data.raw.recipe["bronze-plate"].category = "kiln-smelting"
    frep.add_ingredient("bronze-plate", {type="item", name="charcoal", amount=4})
    if mods["space-age"] then
      frep.add_ingredient("casting-bronze", {type="item", name="carbon", amount=1})
      frep.scale_ingredient("casting-bronze", "molten-copper", {amount=5})
      frep.scale_ingredient("casting-bronze", "molten-tin", {amount=5})
      frep.scale_result("casting-bronze", "bronze-plate", {amount=5})
    end
  end
end

if mods["bztitanium"] and settings.startup["wood-industry-titanium"].value then
  data.raw.recipe["titanium-plate"].category = "kiln-smelting"
  frep.add_ingredient("titanium-plate", {type="item", name="charcoal", amount=2})
  if mods["space-age"] then
    frep.add_ingredient("titanium-in-foundry", {type="item", name="carbon", amount=1})
  end
end

-------------------------------------------------------------------------- Air scrubbing

if mods["atan-air-scrubbing"] then
  local filter_ingredient = "coal"
  if mods["space-age"] then
    filter_ingredient = "carbon"
    frep.replace_ingredient("atan-spore-filter", "plastic-bar", "carbon-fiber")
    frep.replace_ingredient("atan-spore-filter", filter_ingredient, {type="item", name="charcoal", amount=5})
    frep.add_ingredient("atan-spore-filter-cleaning", {type="item", name="charcoal", amount=5})
  end
  frep.replace_ingredient("atan-pollution-filter", "plastic-bar", "low-density-structure")
  frep.replace_ingredient("atan-pollution-filter", filter_ingredient, {type="item", name="charcoal", amount=5})
  frep.add_ingredient("atan-pollution-filter-cleaning", {type="item", name="charcoal", amount=2})
end

-------------------------------------------------------------------------- Entity changes

if mods["space-age"] then
  table.insert(data.raw["assembling-machine"]["biochamber"].crafting_categories, "organic-or-kiln")

  if settings.startup["wood-industry-resin"].value then
    data.raw.tree["ashland-lichen-tree-flaming"].minable.results = {
      {type="item", name="charcoal", amount=5},
      {type="item", name="resin", amount=2}
    }
  else
    data.raw.tree["ashland-lichen-tree-flaming"].minable.results = {
      {type="item", name="charcoal", amount=5},
      {type="item", name="carbon", amount=2}
    }
  end
  data.raw.tree["ashland-lichen-tree"].minable.results = {
    {type="item", name="charcoal", amount=5},
    {type="item", name="carbon", amount=2}
  }
end
