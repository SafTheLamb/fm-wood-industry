if mods["simply-greenhouse"] then
  data.raw["bool-setting"]["sg-enable-charcoal-recipe"].hidden = true
  data.raw["string-setting"]["sg-enable-charcoal-recipe"].forced_value = "No"
  data.raw["string-setting"]["sg-enable-water-recipe"].default_value = "No"
end
