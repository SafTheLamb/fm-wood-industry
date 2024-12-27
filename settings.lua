data:extend({
  -- whether you need charcoal / carbon to forge steel, also affects tungsten
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
  },
  {
    type = "bool-setting",
    name = "wood-industry-nerf-wood-fuel",
    setting_type = "startup",
    default_value = true,
    order = "m[misc]-b[fuelnerf]"
  }
})

if mods["space-age"] then
  data:extend({
    -- whether to buff carbon, by doubling steel output
    {
      type = "bool-setting",
      name = "wood-industry-carbon-buff",
      setting_type = "startup",
      default_value = true,
      order = "a[carbon]-b[buff]"
    },
    -- whether to make military recipes require carbon instead of coal
    {
      type = "bool-setting",
      name = "wood-industry-carbon-military",
      setting_type = "startup",
      default_value = true,
      order = "m[misc]-a[carbon-military]"
    }
  })
end

if mods["bztitanium"] then
  data:extend({
    {
      type = "bool-setting",
      name = "wood-industry-titanium",
      setting_type = "startup",
      default_value = true,
      order = "a[carbon]-m[mods]-a[bztitanium]"
    }
  })
end