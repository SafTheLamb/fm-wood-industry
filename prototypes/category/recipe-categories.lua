data:extend({
  {
    type = "recipe-category",
    name = "kiln-smelting"
  },
  {
    type = "recipe-category",
    name = "organic-or-kiln-smelting"
  }
})

if mods["bzsilicon"] then
  data:extend({
    {
      type = "recipe-category",
      name = "basic-crushing-or-crafting"
    }
  })
end