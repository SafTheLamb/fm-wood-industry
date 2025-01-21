for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  local mods = script.active_mods

  if mods["space-age"] then
    local carbon_technology = settings.startup["wood-industry-carbon-military"].value and "sulfur-processing" or "tungsten-carbide"
    recipes["carbon"].enabled = technologies[carbon_technology].researched

    recipes["reactivated-charcoal"].enabled = technologies["space-platform"].researched

    local astroponics_technology = mods["astroponics"] and "astroponics" or "space-platform-thruster"
    recipes["synthetic-resin"].enabled = technologies[astroponics_technology].researched
  end

  if mods["bztin"] and mods["aai-industry"] and mods["space-age"] and settings.startup["wood-industry-tin-glass"].value then
    recipes["casting-glass"].enabled = technologies["foundry"].researched
  end

  if settings.startup["wood-industry-heavy-oil-adsorption"].value then
    recipes["heavy-oil-adsorption"].enabled = technologies["advanced-oil-processing"].researched
  end
end
