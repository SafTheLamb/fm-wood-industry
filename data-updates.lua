require("prototypes.recycling-updates")
require("prototypes.technology-updates")

local frep = require("__fdsl__.lib.recipe")

if settings.startup["wood-industry-lubricant"].value then
  if mods["aai-loaders"] and data.raw.recipe["lubricant-from-crude-oil"] then
    frep.add_ingredient("lubricant-from-crude-oil", {type="item", name="charcoal", amount=1})
  end
end
