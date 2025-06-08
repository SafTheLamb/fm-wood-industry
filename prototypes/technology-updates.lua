local ftech = require("__fdsl__.lib.technology")

local starting_planet = mods["any-planet-start"] and settings.startup["aps-planet"].value or "nauvis"

-------------------------------------------------------------------------- Woodchips & charcoal

ftech.add_unlock("kiln-smelting", "woodchips")
ftech.add_unlock("kiln-smelting", "charcoal")

if settings.startup["alloy-smelting-coke"].value then
  ftech.add_unlock("kiln-smelting", "coke-from-charcoal")
end

if mods["space-age"] then
  ftech.add_unlock("space-platform", "reactivated-charcoal")
end

-------------------------------------------------------------------------- Oil processing

if settings.startup["wood-industry-heavy-oil-adsorption"].value then
  ftech.add_unlock("advanced-oil-processing", "heavy-oil-adsorption")
end

-------------------------------------------------------------------------- Resin

if settings.startup["wood-industry-resin"].value then
  ftech.add_unlock("advanced-oil-processing", "synthetic-resin")

  if starting_planet == "vulcanus" then
    data.raw.technology["resin-processing"].unit = nil
    data.raw.technology["resin-processing"].research_trigger = {type="craft-fluid", fluid="steam"}
  end
  
  if starting_planet ~= "fulgora" then
    ftech.add_prereq("plastics", "resin-processing")
  end

  if mods["early-agriculture"] and starting_planet == "nauvis" then
    ftech.add_prereq("resin-processing", "basic-agriculture")
  end

  if mods["aai-industry"] and starting_planet ~= "vulcanus" then
    ftech.add_prereq("resin-processing", "steam-power")
  end

  if mods["space-age"] then
    ftech.add_unlock("bioflux-processing", "resin-from-yumako-mash")
  end
end

-------------------------------------------------------------------------- Air scrubbing

if mods["atan-air-scrubbing"] and mods["space-age"] then
  ftech.add_prereq("atan-pollution-scrubbing", "space-science-pack")
  ftech.remove_prereq("atan-pollution-scrubbing", "space-platform")
  ftech.add_cost_ingredient("atan-pollution-scrubbing", "space-science-pack")

  ftech.add_prereq("atan-spore-scrubbing", "carbon-fiber")
  ftech.add_cost_ingredient("atan-spore-scrubbing", "space-science-pack")
end
