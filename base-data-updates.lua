local frep = require("__fdsl__.lib.recipe")

-------------------------------------------------------------------------- Item changes

if mods["space-age"] and settings.startup["wood-industry-carbon-buff"].value then
  data.raw.item["carbon"].fuel_value = "5MJ"
end

data.raw.item["stone-furnace"].order = "a[furnace]-a[stone]"
data.raw.item["steel-furnace"].order = "a[furnace]-b[steel]"
data.raw.item["electric-furnace"].order = "a[furnace]-c[electric]"
if mods["aai-industry"] then
  data.raw.item["industrial-furnace"].order = "a[furnace]-d[industrial]"
end

-------------------------------------------------------------------------- Recipe changes

if settings.startup["wood-industry-carbon-steel"].value then
  data.raw.recipe["steel-plate"].category = "kiln-smelting"

  if mods["space-age"] then
    frep.add_ingredient("steel-plate", {type="item", name="charcoal", amount=1})
    data.raw.recipe["steel-plate"].icons = {
      {icon="__base__/graphics/icons/steel-plate.png", draw_background=true},
      {icon="__wood-industry__/graphics/icons/charcoal.png", shift={-16, -16}, scale=0.5, draw_background=true}
    }

    frep.add_ingredient("casting-steel", {type="item", name="carbon", amount=1})
    frep.add_ingredient("tungsten-plate", {type="item", name="carbon", amount=1})
    frep.scale_result("casting-steel", "steel-plate", {amount=2})
    frep.change_time("casting-steel", {scale=2})
    data.raw.recipe["casting-steel"].icons = {
      {icon="__base__/graphics/icons/steel-plate.png", draw_background=true},
      {icon="__space-age__/graphics/icons/carbon.png", shift={-16, -16}, scale=0.5, draw_background=true}
    }
  else
    frep.add_ingredient("steel-plate", {type="item", name="charcoal", amount=1})
  end
end

if mods["space-age"] then
  frep.add_ingredient("carbon", {type="item", name="charcoal", amount=1})
  if settings.startup["wood-industry-carbon-buff"].value then
    frep.modify_ingredient("coal-synthesis", "carbon", {amount=3})
  end

  frep.replace_result("burnt-spoilage", "carbon", "charcoal")
  data.raw.recipe["burnt-spoilage"].category = "organic-or-kiln"
  data.raw.recipe["burnt-spoilage"].icons = {
    {icon="__wood-industry__/graphics/icons/charcoal-1.png", shift={8, 8}, scale=0.75, draw_background=true},
    {icon="__space-age__/graphics/icons/spoilage.png", shift={-8, -8}, scale=0.75, draw_background=true}
  }

  if settings.startup["wood-industry-carbon-military"].value then
    if mods["wood-military"] and settings.startup["wood-military-hard-mode"].value then
      frep.replace_ingredient("grenade", "coal", {type="item", name="carbon", amount=4})
    end
    frep.replace_ingredient("explosives", "coal", "carbon")
    frep.replace_ingredient("poison-capsule", "coal", {type="item", name="carbon", amount=6})
    frep.replace_ingredient("slowdown-capsule", "coal", {type="item", name="carbon", amount=4})
  end
end

if settings.startup["wood-industry-resin"].value then
  frep.add_ingredient("plastic-bar", {type="item", name="resin", amount=1})
  if mods["space-age"] then
    data.raw.recipe["resin"].category = "organic-or-chemistry"
    frep.add_ingredient("bioplastic", {type="item", name="resin", amount=1})
  end
end

-------------------------------------------------------------------------- Entity changes

if mods["space-age"] then
  table.insert(data.raw["assembling-machine"]["biochamber"].crafting_categories, "organic-or-kiln")

  if settings.startup["wood-industry-resin"].value then
    data.raw.tree["ashland-lichen-tree-flaming"].minable.results = {
      {type="item", name="charcoal", amount=5},
      {type="item", name="resin", amount=2}
    }
  else
    data.raw.tree["ashland-lichen-tree-flaming"].minable.results = {
      {type="item", name="charcoal", amount=5},
      {type="item", name="carbon", amount=2}
    }
  end
  data.raw.tree["ashland-lichen-tree"].minable.results = {
    {type="item", name="charcoal", amount=5},
    {type="item", name="carbon", amount=2}
  }
end
