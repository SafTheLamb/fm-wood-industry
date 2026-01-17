if mods["quality"] then
  if data.raw.recipe["wood-recycling"] then
    data.raw.recipe["wood-recycling"].energy_required = 0.5/16
    data.raw.recipe["wood-recycling"].results = {{type="item", name="woodchips", amount=2, probability=0.5, ignored_by_stats=1}}
  end

  -- Replace wood results in recycling recipes with woodchips
  local wood_ratios = {["wood"]=1.5}
  for name,recipe in pairs(data.raw.recipe) do
    if recipe.category == "recycling" and name ~= "wood-recycling" and name ~= "woodchips-recycling" then
      for _,result in pairs(recipe.results) do
        local result_scalar = wood_ratios[result.name]
        if result_scalar then
          result.name = "woodchips"
          local amount = result_scalar * (result.amount - result.amount % 1 + (result.extra_count_fraction or 0.0))
          result.amount = amount
          result.extra_count_fraction = amount % 1
        end
      end
    end
  end
end
