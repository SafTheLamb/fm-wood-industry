local frep = require("__fdsl__.lib.recipe")

if data.raw["recipe-category"]["basic-crushing"] and not data.raw["recipe-category"]["basic-crushing-or-crafting"] then
  data:extend({
    {
      type = "recipe-category",
      name = "basic-crushing-or-crafting"
    }
  })
end

if data.raw["recipe-category"]["basic-crushing-or-crafting"] then
  table.insert(data.raw.character.character.crafting_categories, "basic-crushing-or-crafting")
  for _,entity_type in pairs({"assembling-machine", "furnace"}) do
    for _,machine in pairs(data.raw[entity_type]) do
      for _,category in pairs(machine.crafting_categories or {}) do
        if category == "basic-crafting" then
          table.insert(machine.crafting_categories, "basic-crushing-or-crafting")
          break
        end
      end
    end
  end
end

if settings.startup["wood-industry-lubricant"].value then
  if mods["aai-loaders"] and data.raw.recipe["lubricant-from-crude-oil"] then
    frep.add_ingredient("lubricant-from-crude-oil", {type="item", name="charcoal", amount=1})
  end
end
