local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Wood changes

if settings.startup["wood-industry-nerf-wood-fuel"].value then
  data.raw.item["wood"].fuel_value = "1MJ"
  data.raw.item["woodchips"].fuel_value = "0.5MJ"
  if mods["wood-logistics"] and settings.startup["wood-logistics-lumber"].value then
    data.raw.item["lumber"].fuel_value = "2MJ"
  end
end

-------------------------------------------------------------------------- Woodchips & charcoal

ftech.add_unlock("kiln-smelting", "woodchips")
ftech.add_unlock("kiln-smelting", "charcoal")

if settings.startup["alloy-smelting-coke"].value then
  ftech.add_unlock("kiln-smelting", "coke-from-charcoal")
end

if mods["space-age"] then
  ftech.add_unlock("space-platform", "reactivated-charcoal")
end

if mods["crushing-industry"] and settings.startup["crushing-industry-byproducts"].value then
  frep.add_result("woodchips", {type="item", name="wood", amount=1, probability=0.05, show_details_in_recipe_tooltip=false})
end

-------------------------------------------------------------------------- Resin

if settings.startup["wood-industry-resin"].value then
  if mods["crushing-industry"] and settings.startup["crushing-industry-coal"].value then
    frep.replace_ingredient("plastic-bar", "crushed-coal", {type="item", name="resin", amount=2})
  else
    frep.replace_ingredient("plastic-bar", "coal", {type="item", name="resin", amount=1})
  end
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

-------------------------------------------------------------------------- Oil processing

if settings.startup["wood-industry-heavy-oil-adsorption"].value then
  ftech.add_unlock("advanced-oil-processing", "heavy-oil-adsorption")
end

if settings.startup["wood-industry-lubricant"].value then
  frep.add_ingredient("lubricant", {type="item", name="charcoal", amount=1})

  if mods["space-age"] then
    frep.add_ingredient("biolubricant", {type="item", name="charcoal", amount=1})
  end
end

-------------------------------------------------------------------------- Resin

if settings.startup["wood-industry-resin"].value then
  ftech.add_unlock("advanced-oil-processing", "synthetic-resin")

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

-------------------------------------------------------------------------- Vulcanus

if mods["space-age"] then
  if not (mods["alloy-smelting"] and settings.startup["alloy-smelting-coke"].value) then
    frep.add_ingredient("carbon", {type="item", name="charcoal", amount=1})
  end

  data.raw.tree["ashland-lichen-tree-flaming"].minable.results = {
    {type="item", name="charcoal", amount=5},
    {type="item", name=settings.startup["wood-industry-resin"].value and "resin" or "carbon", amount=2}
  }
  data.raw.tree["ashland-lichen-tree"].minable.results = {
    {type="item", name="charcoal", amount=5},
    {type="item", name="carbon", amount=2}
  }
end

-------------------------------------------------------------------------- Gleba

if mods["space-age"] then
  frep.add_ingredient("artificial-yumako-soil", {type="item", name="charcoal", amount=5})
  frep.add_ingredient("artificial-jellynut-soil", {type="item", name="charcoal", amount=5})
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

-------------------------------------------------------------------------- Deadlock stacking

if mods["deadlock-beltboxes-loaders"] then
  deadlock.add_stack("woodchips", nil, data.raw.technology["deadlock-stacking-0"] and "deadlock-stacking-0" or "deadlock-stacking-1")
  deadlock.add_stack("charcoal", nil, data.raw.technology["deadlock-stacking-0"] and "deadlock-stacking-0" or "deadlock-stacking-1")
  if settings.startup["wood-industry-resin"].value then
    deadlock.add_stack("resin", nil, "deadlock-stacking-2")
  end
end
