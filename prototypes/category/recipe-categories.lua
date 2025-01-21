data:extend({
  {
    type = "recipe-category",
    name = "kiln-smelting"
  },
  {
    type = "recipe-category",
    name = "organic-or-kiln"
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