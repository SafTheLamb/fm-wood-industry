local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

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

if mods["deadlock-beltboxes-loaders"] then
  deadlock.add_stack("woodchips", nil, data.raw.technology["deadlock-stacking-0"] and "deadlock-stacking-0" or "deadlock-stacking-1")
  deadlock.add_stack("charcoal", nil, data.raw.technology["deadlock-stacking-0"] and "deadlock-stacking-0" or "deadlock-stacking-1")
  if settings.startup["wood-industry-resin"].value then
    deadlock.add_stack("resin", nil, "deadlock-stacking-2")
  end
end

-------------------------------------------------------------------------- Recipe changes

local function smelt_in_kiln(recipe_name)
  if data.raw.recipe[recipe_name] then
    data.raw.recipe[recipe_name].category = "kiln-smelting"
    data.raw.recipe[recipe_name].auto_recycle = false
  end
end

if settings.startup["wood-industry-carbon-steel"].value then
  smelt_in_kiln("steel-plate")
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
end

if settings.startup["wood-industry-resin"].value then
  frep.replace_ingredient("plastic-bar", "coal", {type="item", name="resin", amount=1})
  if mods["space-age"] then
    data.raw.recipe["resin"].category = "organic-or-chemistry"
    frep.add_ingredient("bioplastic", {type="item", name="resin", amount=1})
  end
end

if settings.startup["wood-industry-heavy-oil-adsorption"].value then
  if mods["aai-industry"] then
    frep.add_ingredient("oil-processing-heavy", {type="item", name="coal", amount=1})
    frep.add_ingredient("advanced-oil-processing", {type="item", name="charcoal", amount=2})
    data.raw.recipe["advanced-oil-processing"].order = "a[oil-processing]-b[advanced-oil-processing]b"
  else
    frep.add_ingredient("advanced-oil-processing", {type="item", name="charcoal", amount=2})
  end
end

if settings.startup["wood-industry-lubricant"].value then
  frep.add_ingredient("lubricant", {type="item", name="charcoal", amount=1})

  if mods["space-age"] then
    frep.add_ingredient("biolubricant", {type="item", name="charcoal", amount=1})
  end
end

if mods["space-age"] then
  smelt_in_kiln("tungsten-carbide")
  frep.change_time("tungsten-carbide", {scale=6.4})
  data.raw.recipe["burnt-spoilage"].category = "organic-or-kiln-smelting"
  data.raw.recipe["burnt-spoilage"].allow_decomposition = false
  frep.add_ingredient("artificial-yumako-soil", {type="item", name="charcoal", amount=5})
  frep.add_ingredient("artificial-jellynut-soil", {type="item", name="charcoal", amount=5})
end

-------------------------------------------------------------------------- Technology changes

if settings.startup["wood-industry-carbon-steel"].value then
  ftech.add_prereq("steel-processing", "wood-pyrolysis")
end

if settings.startup["wood-industry-resin"].value then
  ftech.add_prereq("advanced-oil-processing", "synthetic-resin")

  if not (mods["any-planet-start"] and settings.startup["aps-planet"].value == "fulgora") then
    ftech.add_prereq("plastics", "resin-processing")
  end

  if mods["early-agriculture"] then
    ftech.add_prereq("resin-processing", "basic-agriculture")
  end
  if mods["aai-industry"] then
    ftech.add_prereq("resin-processing", "steam-power")
  end
end

if settings.startup["wood-industry-heavy-oil-adsorption"].value then
  ftech.add_unlock("advanced-oil-processing", "heavy-oil-adsorption")
end

if mods["space-age"] then
  ftech.add_unlock("space-platform", "reactivated-charcoal")

  ftech.add_prereq("planet-discovery-vulcanus", "wood-pyrolysis-2")
end

if mods["aai-industry"] then
  ftech.add_prereq("wood-pyrolysis", "automation-science-pack")
else
  ftech.add_prereq("automation-science-pack", "wood-pyrolysis")
end

-------------------------------------------------------------------------- BZ mods

if mods["bzlead"] and settings.startup["wood-industry-lead"].value then
  ftech.add_unlock("wood-pyrolysis", "lead-plate")
  ftech.add_unlock("wood-pyrolysis", "lead-chest")
  ftech.add_unlock("wood-pyrolysis", "lead-expansion-bolt")
end

if mods["bztin"] and settings.startup["wood-industry-tin"].value then
  if mods["aai-industry"] then
    ftech.add_unlock("wood-pyrolysis", "solder")
    ftech.add_prereq("electricity", "wood-pyrolysis")
    if not mods["apm_power_ldinc"] then
      ftech.add_prereq("glass-processing", "wood-pyrolysis")
    end
    ftech.add_prereq("basic-fluid-handling", "wood-pyrolysis")
  end
  if settings.startup["bztin-more-intermediates"].value == "bronze" then
    ftech.add_prereq("automation", "wood-pyrolysis")
  end
end

if mods["bztin"] and mods["aai-industry"] and mods["space-age"] and settings.startup["wood-industry-tin-glass"].value then
  ftech.add_unlock("foundry", "casting-glass")
end

-------------------------------------------------------------------------- Air scrubbing

if mods["atan-air-scrubbing"] and mods["space-age"] then
  local filter_ingredient = "coal"
  if mods["space-age"] then
    filter_ingredient = "carbon"
    ftech.add_prereq("atan-pollution-scrubbing", "space-science-pack")
    ftech.remove_prereq("atan-pollution-scrubbing", "space-platform")
    ftech.add_cost_ingredient("atan-pollution-scrubbing", "space-science-pack")

    ftech.add_prereq("atan-spore-scrubbing", "carbon-fiber")
    ftech.add_cost_ingredient("atan-spore-scrubbing", "space-science-pack")
    frep.replace_ingredient("atan-spore-filter", "plastic-bar", "carbon-fiber")
    frep.replace_ingredient("atan-spore-filter", filter_ingredient, {type="item", name="charcoal", amount=5})
    frep.add_ingredient("atan-spore-filter-cleaning", {type="item", name="charcoal", amount=5})
  end

  frep.replace_ingredient("atan-pollution-filter", "plastic-bar", "low-density-structure")
  frep.replace_ingredient("atan-pollution-filter", filter_ingredient, {type="item", name="charcoal", amount=5})
  frep.add_ingredient("atan-pollution-filter-cleaning", {type="item", name="charcoal", amount=2})
end

-------------------------------------------------------------------------- BZ mods

if mods["bzlead"] and settings.startup["wood-industry-lead"].value then
  smelt_in_kiln("lead-plate")
  frep.add_ingredient("lead-plate", {type="item", name="charcoal", amount=1})
  frep.scale_ingredient("lead-plate", "lead-ore", {amount=2.5})
  frep.scale_result("lead-plate", "lead-plate", {amount=2.5})
  frep.scale_result("lead-plate", "copper-ore", {probability=2.5})
  frep.change_time("lead-plate", {scale=2.5})

  if data.raw.item["lead-expansion-bolt"] then
    frep.add_ingredient("electric-kiln", {type="item", name="lead-expansion-bolt", amount=4})
  end

  if mods["space-age"] then
    -- still use charcoal here instead of carbon, since its role in lead smelting is specifically a purifying agent
    frep.add_ingredient("molten-lead-from-lava", {type="item", name="charcoal", amount=5})
    frep.add_ingredient("molten-lead", {type="item", name="charcoal", amount=5})
  end
end

if mods["bztin"] and settings.startup["wood-industry-tin"].value then
  smelt_in_kiln("solder")
  frep.change_time("solder", {scale=6.4})
  if settings.startup["bztin-more-intermediates"].value == "bronze" then
    smelt_in_kiln("bronze-plate")
    frep.add_ingredient("bronze-plate", {type="item", name="charcoal", amount=4})
    if mods["space-age"] then
      frep.add_ingredient("casting-bronze", {type="item", name="carbon", amount=1})
      frep.scale_ingredient("casting-bronze", "molten-copper", {amount=5})
      frep.scale_ingredient("casting-bronze", "molten-tin", {amount=5})
      frep.scale_result("casting-bronze", "bronze-plate", {amount=5})
    end
  end
end

if mods["bztin"] and mods["aai-industry"] and settings.startup["wood-industry-tin-glass"].value then
  smelt_in_kiln("glass")
  frep.add_ingredient("glass", {type="item", name="tin-plate", amount=1})
  frep.scale_ingredient("glass", "sand", {amount=5})
  frep.scale_result("glass", "glass", {amount=5})
  frep.change_time("glass", {scale=5})

  table.insert(data.raw["simple-entity"]["fulgoran-ruin-small"].minable.results, {type="item", name="glass", amount=3})
  table.insert(data.raw["simple-entity"]["fulgoran-ruin-medium"].minable.results, {type="item", name="glass", amount=3})
end

if mods["bztitanium"] and settings.startup["wood-industry-titanium"].value then
  smelt_in_kiln("titanium-plate")
  frep.add_ingredient("titanium-plate", {type="item", name="charcoal", amount=2})
  if mods["space-age"] then
    frep.add_ingredient("titanium-in-foundry", {type="item", name="carbon", amount=1})
  end
end

if mods["hot-metals"] then
  table.insert(HotMetals.craftingCategories, "kiln-smelting")
  table.insert(HotMetals.craftingCategories, "organic-or-kiln-smelting")
end

-------------------------------------------------------------------------- Entity changes

if mods["space-age"] then
  table.insert(data.raw["assembling-machine"]["biochamber"].crafting_categories, "organic-or-kiln-smelting")

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
