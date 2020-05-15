invisible_glass = {}

-- Intllib
local S

if minetest.get_modpath("intllib") then
        S = intllib.Getter()
else
        S = function(s, a, ...) a = {a, ...}
                return s:gsub("@(%d+)", function(n)
                        return a[tonumber(n)]
                end)
        end

end

minetest.register_node("invisible_glass:glass", {
	description = S("Invisible Glass"),
	drawtype = "glasslike_framed_optional",
	tiles = {"invisible_glass.png"},
	inventory_image = "invisible_glass_inv.png",
	paramtype = "light",
	paramtype2 = "glasslikeliquidlevel",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky = 3}
})

minetest.register_craft({
	type = "shapeless",
	output = "invisible_glass:glass 2",
	recipe = {
		"default:glass", "default:glass",
	},
})
