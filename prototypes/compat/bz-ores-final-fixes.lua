if data.raw["recipe-category"]["basic-crushing"] and not data.raw["recipe-category"]["basic-crushing-or-crafting"] then
  data:extend({
    {
      type = "recipe-category",
      name = "basic-crushing-or-crafting"
    }
  })

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
