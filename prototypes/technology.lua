data:extend({
  {
    type = "technology",
    name = "wood-pyrolysis",
    icon = "__wood-industry__/graphics/technology/wood-pyrolysis.png",
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
  }
})

if settings.startup["wood-industry-resin"].value then
  data:extend({
    {
      type = "technology",
      name = "resin-processing",
      icon = "__wood-industry__/graphics/technology/resin-processing.png",
      icon_size = 256,
      prerequisites = {"automation-2"},
      effects = {{type="unlock-recipe", recipe="resin"}},
      unit = {
        count = 100,
        ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
        time = 30
      }
    }
  })
end
