if mods["aai-industry"] then
  data:extend({
    {
      type = "technology",
      name = "wood-pyrolysis",
      icon = "__wood-base-assets__/graphics/technology/wood-pyrolysis.png",
      icon_size = 256,
      prerequisites = {"automation-science-pack"},
      effects = {
        {type="unlock-recipe", recipe="brick-kiln"},
        {type="unlock-recipe", recipe="woodchips"},
        {type="unlock-recipe", recipe="charcoal"}
      },
      unit = {
        count = 10,
        ingredients = {{"automation-science-pack", 1}},
        time = 10
      }
    },
    {
      type = "technology",
      name = "wood-pyrolysis-2",
      icon = "__wood-base-assets__/graphics/technology/wood-pyrolysis-2.png",
      icon_size = 256,
      prerequisites = {"processing-unit", "low-density-structure"},
      effects = {
        {type="unlock-recipe", recipe="electric-kiln"}
      },
      unit = {
        count = 300,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1}
        },
        time = 30
      }
    },
  })
end

if settings.startup["wood-industry-resin"].value then
  data:extend({
    {
      type = "technology",
      name = "resin-processing",
      icon = "__wood-base-assets__/graphics/technology/resin-processing.png",
      icon_size = 256,
      prerequisites = {"automation-2"},
      effects = {{type="unlock-recipe", recipe="resin"}},
      unit = {
        count = 100,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
        },
        time = 30
      }
    }
  })
end
