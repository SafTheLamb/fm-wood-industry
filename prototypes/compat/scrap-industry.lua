if mods["scrap-industry"] then
  ScrapIndustry.products["woodchips"] = {priority=0.2}
  ScrapIndustry.items["wood"] = {scrap="woodchips", scale=ScrapIndustry.COMMON, failrate=0.02}
  ScrapIndustry.items["lumber"] = {scrap="woodchips", scale=ScrapIndustry.PRODUCT, failrate=0.01}
  ScrapIndustry.items["wood-transport-belt"] = {scrap="woodchips", scale=ScrapIndustry.CHEAP, failrate=0.02}
  ScrapIndustry.items["wood-underground-belt"] = {scrap="woodchips", scale=ScrapIndustry.COMMON, failrate=0.01}
  ScrapIndustry.items["wood-splitter"] = {scrap="woodchips", scale=ScrapIndustry.COMMON, failrate=0.01}
  ScrapIndustry.items["small-electric-pole"] = {scrap="woodchips", scale=ScrapIndustry.CHEAP, failrate=0.01}
  ScrapIndustry.recipes["woodchips"] = {ignore=true}
end
