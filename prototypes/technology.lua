if settings.startup["wood-industry-resin"].value then
  data:extend({
    {
      type = "technology",
      name = "resin-processing",
      icon = "__wood-industry__/graphics/technology/resin-processing.png",
      icon_size = 256,
      prerequisites = {"oil-processing"},
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
