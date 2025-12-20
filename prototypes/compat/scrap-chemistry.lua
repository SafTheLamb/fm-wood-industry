local frep = require("__fdsl__.lib.recipe")

if mods["scrap-chemistry"] then
	if mods["crushing-industry"] and settings.startup["crushing-industry-coal"].value then
		frep.replace_ingredient("plastic-bar-from-butane", "crushed-coal", {type="item", name="resin", amount=2})
	else
		frep.replace_ingredient("plastic-bar-from-butane", "coal", {type="item", name="resin", amount=1})
	end
	if settings.startup["wood-industry-heavy-oil-adsorption"].value then
		data.raw.recipe["heavy-oil-adsorption"].localised_name = {"recipe-name.heavy-oil-adsorption-butane"}
		data.raw.recipe["heavy-oil-adsorption"].icon = "__wood-industry__/graphics/icons/fluid/heavy-oil-adsorption-butane.png"
		frep.add_result("heavy-oil-adsorption", {type="fluid", name="sour-gas", amount=30})
	end
end
