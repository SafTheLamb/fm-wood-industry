local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Technology changes

ftech.add_unlock("advanced-material-processing-2", "electric-kiln")

if settings.startup["wood-industry-carbon-steel"].value then
  ftech.add_prereq("steel-processing", "wood-pyrolysis")
  if mods["space-age"] then
    ftech.add_unlock("steel-processing", "carbon-from-charcoal")
  end
end

if settings.startup["wood-industry-resin"].value then
  ftech.add_prereq("plastics", "resin-processing")
  if mods["aai-industry"] then
    ftech.add_prereq("resin-processing", "steam-power")
  end
end
