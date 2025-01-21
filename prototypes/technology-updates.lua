local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Technology changes

if settings.startup["wood-industry-carbon-steel"].value then
  ftech.add_prereq("steel-processing", "wood-pyrolysis")
end

if settings.startup["wood-industry-resin"].value then
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

if mods["space-age"] then
  ftech.add_unlock("space-platform", "reactivated-charcoal")
  
  if mods["astroponics"] then
    ftech.add_prereq("astroponics", "wood-pyrolysis-2")
  else
    ftech.add_prereq("planet-discovery-vulcanus", "wood-pyrolysis-2")
  end

  if settings.startup["wood-industry-resin"].value then
    local astroponics_technology = mods["astroponics"] and "astroponics" or "space-platform-thruster"
    ftech.add_unlock(astroponics_technology, "synthetic-resin")
  end
end

if mods["space-age"] and settings.startup["wood-industry-carbon-military"].value then
  ftech.add_unlock("sulfur-processing", "carbon")
  if mods["wood-military"] and settings.startup["wood-military-hard-mode"].value then
    ftech.add_prereq("military-2", "sulfur-processing")
  end

  ftech.remove_unlock("tungsten-carbide", "carbon")
end

if settings.startup["wood-industry-heavy-oil-adsorption"].value then
  ftech.add_unlock("advanced-oil-processing", "heavy-oil-adsorption")
end

-------------------------------------------------------------------------- BZ mods

if mods["bzlead"] and settings.startup["wood-industry-lead"].value then
  if mods["aai-industry"] then
    ftech.add_unlock("electricity", "lead-expansion-bolt")
    ftech.add_unlock("wood-pyrolysis", "lead-plate")
    ftech.add_unlock("wood-pyrolysis", "lead-chest")
  else
    ftech.add_unlock("electronics", "lead-expansion-bolt")
  end
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
  ftech.add_prereq("atan-pollution-scrubbing", "space-science-pack")
  ftech.remove_prereq("atan-pollution-scrubbing", "space-platform")
  ftech.add_cost_ingredient("atan-pollution-scrubbing", "space-science-pack")

  ftech.add_prereq("atan-spore-scrubbing", "carbon-fiber")
  ftech.add_cost_ingredient("atan-spore-scrubbing", "space-science-pack")
end
