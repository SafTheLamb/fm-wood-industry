for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  recipes["electric-kiln"].enabled = technologies["advanced-material-processing-2"].researched
  if script.active_mods["space-age"] then
    local carbon_technology = settings.startup["wood-industry-carbon-military"].value and "sulfur-processing" or "tungsten-carbide"
    recipes["carbon"].enabled = technologies[carbon_technology].researched

    local astroponics_technology = script.active_mods["astroponics"] and "astroponics" or "space-platform-thruster"
    recipes["reactivated-charcoal"].enabled = technologies[astroponics_technology].researched
    recipes["synthetic-resin"].enabled = technologies[astroponics_technology].researched
  end

  if settings.startup["wood-industry-heavy-oil-adsorption"].value then
    recipes["heavy-oil-adsorption"].enabled = technologies["advanced-oil-processing"].researched
  end
end
