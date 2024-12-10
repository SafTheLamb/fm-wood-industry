for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  recipes["electric-kiln"].enabled = technologies["advanced-material-processing-2"].researched
  if settings.startup["wood-industry-carbon-military"].value then
    recipes["carbon"].enabled = technologies["sulfur-processing"].researched
  end
end
