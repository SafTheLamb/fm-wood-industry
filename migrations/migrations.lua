for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  local mods = script.active_mods

  if recipes["brick-kiln"].enabled then
    technologies["wood-pyrolysis"].researched = true
  end

  if mods["space-age"] then
    recipes["reactivated-charcoal"].enabled = technologies["space-platform"].researched
  end

  if settings.startup["wood-industry-resin"].value then
    recipes["synthetic-resin"].enabled = technologies["advanced-oil-processing"].researched
  end

  if mods["bztin"] and mods["aai-industry"] and mods["space-age"] and settings.startup["wood-industry-tin-glass"].value then
    recipes["casting-glass"].enabled = technologies["foundry"].researched
  end

  if mods["bzlead"] and settings.startup["wood-industry-lead"].value then
    if technologies["wood-pyrolysis"].researched then
      recipes["lead-plate"].enabled = true
      recipes["lead-chest"].enabled = true
      recipes["lead-expansion-bolt"].enabled = true
    end
  end

  if settings.startup["wood-industry-heavy-oil-adsorption"].value then
    recipes["heavy-oil-adsorption"].enabled = technologies["advanced-oil-processing"].researched
  end
end
