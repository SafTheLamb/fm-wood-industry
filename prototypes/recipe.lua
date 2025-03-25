local carpentry_category = mods["wood-logistics"] and settings.startup["wood-logistics-lumber-mill"].value and "crafting-or-carpentry" or "crafting"
local crushing_category = mods["crushing-industry"] and "basic-crushing-or-hand-crafting" or carpentry_category
local is_crushed_coal_enabled = mods["crushing-industry"] and settings.startup["crushing-industry-coal"].value

local chemistry_category = mods["space-age"] and "organic-or-chemistry" or "chemistry"

data:extend({
  {
    type = "recipe",
    name = "woodchips",
    icons = mods["crushing-industry"] and CrushingIndustry.make_crushing_icons("wood") or nil,
    category = crushing_category or carpentry_category or nil,
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    ingredients = {{type="item", name="wood", amount=1}},
    results = {
      {type="item", name="wood", amount=1, probability=0.05, ignored_by_stats=1, ignored_by_productivity=1, show_details_in_recipe_tooltip=false},
      {type="item", name="woodchips", amount=2}
    },
    main_product = "woodchips"
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
    results = {{type="item", name="charcoal", amount=2}}
  },
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
        {type="item", name="wood", amount=3},
        is_crushed_coal_enabled and {type="item", name="crushed-coal", amount=2} or {type="item", name="coal", amount=1},
        {type="fluid", name="steam", amount=50}
      },
      results = {{type="item", name="resin", amount=2}}
    },
    {
      type = "recipe",
      name = "synthetic-resin",
      localised_name = {"recipe-name.synthetic-resin"},
      icons = {
        {icon="__wood-base-assets__/graphics/icons/resin.png"},
        {icon="__base__/graphics/icons/fluid/sulfuric-acid.png", shift={-8,-8}, scale=0.3}
      },
      category = mods["space-age"] and "chemistry-or-cryogenics" or "chemistry",
      subgroup = "raw-material",
      order = "n",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      ingredients = {
        {type="fluid", name="light-oil", amount=20},
        {type="fluid", name="sulfuric-acid", amount=10}
      },
      results = {{type="item", name="resin", amount=2}}
    }
  })
end

if mods["space-age"] then
  data:extend({
    {
      type = "recipe",
      name = "reactivated-charcoal",
      icon = mods["wood-universe-assets"] and "__wood-universe-assets__/graphics/icons/reactivated-charcoal.png",
      icons = not mods["wood-universe-assets"] and {
        {icon="__wood-base-assets__/graphics/icons/charcoal.png"},
        {icon="__space-age__/graphics/icons/carbon.png", shift={-8,-8}, scale=0.3}
      } or nil,
      category = "organic-or-chemistry",
      subgroup = "raw-material",
      order = "l",
      energy_required = 6.4,
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      ingredients = {
        {type="item", name="solid-fuel", amount=1},
        {type="item", name="carbon", amount=3},
        {type="fluid", name="steam", amount=50}
      },
      results = {{type="item", name="charcoal", amount=2}}
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
        {type="fluid", name="heavy-oil", amount=40},
        {type="item", name="charcoal", amount=1}
      },
      results = {
        {type="fluid", name="petroleum-gas", amount=60}
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

if settings.startup["alloy-smelting-coke"].value then
  data:extend({
    {
      type = "recipe",
      name = "coke-from-charcoal",
      icons = {
        {icon="__wood-base-assets__/graphics/icons/charcoal.png", shift={-12, -12}, scale=0.4},
        {icon="__alloy-smelting__/graphics/icons/coke.png", draw_background=true}
      },
      category = "organic-or-kiln-smelting",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      energy_required = 6.4,
      ingredients = {{type="item", name="charcoal", amount=1}},
      results = {{type="item", name="coke", amount=2}}
    }
  })
end
