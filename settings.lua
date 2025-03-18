data:extend({
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
  },
  {
    type = "bool-setting",
    name = "wood-industry-heavy-oil-adsorption",
    setting_type = "startup",
    default_value = true,
    order = "c[adsorption]-a[heavy-oil]"
  },
  {
    type = "bool-setting",
    name = "wood-industry-lubricant",
    setting_type = "startup",
    default_value = true,
    order = "c[adsorption]-b[lubricant]"
  }
})
