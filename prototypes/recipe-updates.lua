local frep = require("__fdsl__.lib.recipe")

if data.raw["recipe-category"]["basic-crushing-or-crafting"] then
  data.raw.recipe["woodchips"].category = "basic-crushing-or-crafting"

  table.insert(data.raw.furnace["basic-crusher"].crafting_categories, "basic-crushing-or-crafting")
  table.insert(data.raw.character.character.crafting_categories, "basic-crushing-or-crafting")
  for _,machine in pairs(data.raw["assembling-machine"]) do
    for _,category in pairs(machine.crafting_categories or {}) do
      if category == "basic-crafting" then
        table.insert(machine.crafting_categories, "basic-crushing-or-crafting")
        break
      end
    end
  end
end

if settings.startup["wood-industry-lubricant"].value then
  if mods["aai-loaders"] and data.raw.recipe["lubricant-from-crude-oil"] then
    frep.add_ingredient("lubricant-from-crude-oil", {type="item", name="charcoal", amount=1})
  end
end
