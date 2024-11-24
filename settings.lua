data:extend({
  -- whether you need carbon to forge steel (charcoal if no SA)
  {
    type = "bool-setting",
    name = "wood-industry-carbon-steel",
    setting_type = "startup",
    default_value = true,
    order = "a[carbon]-a[steel]"
  },
  -- whether to add resin as a necessary resource for 
  {
    type = "bool-setting",
    name = "wood-industry-resin",
    setting_type = "startup",
    default_value = true,
    order = "b[resin]"
  }
})

if mods["space-age"] then
  data:extend({
    -- whether to buff carbon, by doubling steel output and 
    {
      type = "bool-setting",
      name = "wood-industry-carbon-buff",
      setting_type = "startup",
      default_value = true,
      order = "a[carbon]-b[buff]"
    },
    {
      type = "bool-setting",
      name = "wood-industry-carbon-military",
      setting_type = "startup",
      default_value = true,
      order = "z[misc]-a[carbon-military]"
    }
  })
end
