for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  local mods = script.active_mods

  if mods["space-age"] then
    recipes["reactivated-charcoal"].enabled = technologies["space-platform"].researched
  end

  if settings.startup["wood-industry-resin"].value then
    recipes["synthetic-resin"].enabled = technologies["advanced-oil-processing"].researched
  end

  if settings.startup["wood-industry-heavy-oil-adsorption"].value then
    recipes["heavy-oil-adsorption"].enabled = technologies["advanced-oil-processing"].researched
  end
end
