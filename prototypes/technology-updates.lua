local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Technology changes

ftech.add_unlock("advanced-material-processing-2", "electric-kiln")

if settings.startup["wood-industry-carbon-steel"].value then
  ftech.add_prereq("steel-processing", "wood-pyrolysis")
end

if settings.startup["wood-industry-resin"].value then
  ftech.add_prereq("plastics", "resin-processing")
  if mods["early-agriculture"] then
    ftech.add_prereq("resin-processing", "basic-agriculture")
  end
  if mods["aai-industry"] then
    ftech.add_prereq("resin-processing", "steam-power")
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
