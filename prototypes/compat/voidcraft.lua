if mods["Voidcraft"] then
	local vcc = require("__Voidcraft__.prototypes.costs")

	local charcoal_bad_product = mods["space-age"] and "spoilage" or "carbon"

	VOIDCRAFT.create_auto_groups({{"voidcraft-wood", "vccw"}})

	local vc_recipes = {}
	table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix="__wood-industry__", subgroup="voidcraft-wood", amt2=2}, {"charcoal", "woodchips", charcoal_bad_product}, "vcba", vcc.smelted_product, "s6x-voidcraft", {0.48, 0.4, 0.1}))
	if settings.startup["wood-industry-resin"].value then
		table.insert(vc_recipes, VOIDCRAFT.voidcraft_recipe({prefix="__wood-industry__", subgroup="voidcraft-wood"}, {"resin", "wood", "sulfur"}, "vcbb", vcc.petrochem_product, "s6x-voidcraft", {0.48, 0.4, 0.1}))
	end

	if next(vc_recipes) ~= nil then
		data:extend(vc_recipes)
		for _,recipe in pairs(vc_recipes) do
			data:extend({
				VOIDCRAFT.coherize(recipe),
				VOIDCRAFT.fluxize(recipe)
			})
		end
	end
end
