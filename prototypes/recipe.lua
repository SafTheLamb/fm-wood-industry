local carpentry_category = "crafting"
if mods["wood-logistics"] and settings.startup["wood-logistics-lumber-mill"].value then
  carpentry_category = "crafting-or-carpentry"
end

local chemistry_category = "chemistry"
if mods["space-age"] then
  chemistry_category = "organic-or-chemistry"
end

data:extend({
  {
    type = "recipe",
    name = "brick-kiln",
    enabled = false,
    ingredients = {
      {type="item", name="stone-furnace", amount=1},
      {type="item", name="stone-brick", amount=5}
    },
    results = {{type="item", name="brick-kiln", amount=1}}
  },
  {
    type = "recipe",
    name = "woodchips",
    category = carpentry_category,
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    ingredients = {{type="item", name="wood", amount=1}},
    results = {{type="item", name="woodchips", amount=2}}
  },
  {
    type = "recipe",
    name = "charcoal",
    category = "kiln-smelting",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    energy_required = 6.4,
    ingredients = {{type="item", name="woodchips", amount=3}},
    results = {{type="item", name="charcoal", amount=1}}
  },
  {
    type = "recipe",
    name = "electric-kiln",
    enabled = false,
    energy_required = 5,
    ingredients = {
      {type="item", name="brick-kiln", amount=1},
      {type="item", name="electric-furnace", amount=1},
      {type="item", name="refined-concrete", amount=10},
      {type="item", name="advanced-circuit", amount=5}
    },
    results = {{type="item", name="electric-kiln", amount=1}}
  }
})

if settings.startup["wood-industry-resin"].value then
  data:extend({
    {
      type = "recipe",
      name = "resin",
      category = chemistry_category,
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      energy_required = 1,
      ingredients = {
        {type="item", name="woodchips", amount=5},
        {type="item", name="coal", amount=1},
        {type="fluid", name="steam", amount=50, minimum_temperature=165}
      },
      results = {{type="item", name="resin", amount=2}}
    }
  })
end

if settings.startup["wood-industry-heavy-oil-adsorption"].value then
  data:extend({
    {
      type = "recipe",
      name = "heavy-oil-adsorption",
      icon = "__wood-base-assets__/graphics/icons/fluid/heavy-oil-adsorption.png",
      category = chemistry_category,
      subgroup = "fluid-recipes",
      order = "b[fluid-chemistry]-a[heavy-oil-cracking]b",
      enabled = false,
      allow_productivity = true,
      energy_required = 3,
      ingredients = {
        {type="fluid", name="water", amount=30},
        {type="fluid", name="heavy-oil", amount=30},
        {type="item", name="charcoal", amount=1}
      },
      results = {
        {type="fluid", name="petroleum-gas", amount=30}
      },
      main_product = "",
      crafting_machine_tint = {
        primary = {r = 0.764, g = 0.596, b = 0.780, a = 1.000}, -- #c298c6ff
        secondary = {r = 0.762, g = 0.551, b = 0.844, a = 1.000}, -- #c28cd7ff
        tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
        quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
      }
    }
  })
end
