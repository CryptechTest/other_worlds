-- Atmosphere Nodes

minetest.register_node(":asteroid:atmos", {
	description = "Comet Atmosphere",
	--drawtype = "glasslike",
	drawtype = "liquid",
	tiles = {"asteroid_atmos6.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	use_texture_alpha = "blend",--true,
	--post_effect_color = {a = 31, r = 241, g = 248, b = 255},
	post_effect_color = {a = 10, r = 241, g = 248, b = 255},
	groups = {not_in_creative_inventory = 1, atmosphere = 3},
	waving = 3
})


-- Nodes

minetest.register_node(":asteroid:stone", {
	description = "Asteroid Stone",
	tiles = {"default_stone.png"},
	is_ground_content = false,
	drop = 'asteroid:cobble',
	groups = {cracky = 3, stone = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:redstone", {
	description = "Red Asteroid Stone",
	tiles = {"asteroid_redstone.png"},
	is_ground_content = false,
	drop = 'asteroid:redcobble',
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:cobble", {
	description = "Asteroid Cobble",
	tiles = {"asteroid_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:redcobble", {
	description = "Red Asteroid Cobble",
	tiles = {"asteroid_redcobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:gravel", {
	description = "Asteroid Gravel",
	tiles = {"asteroid_gravel.png"},
	is_ground_content = false,
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.2}
	})
})

minetest.register_node(":asteroid:redgravel", {
	description = "Red Asteroid Gravel",
	tiles = {"asteroid_redgravel.png"},
	is_ground_content = false,
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.2}
	})
})

minetest.register_node(":asteroid:dust", {
	description = "Asteroid Dust",
	tiles = {"asteroid_dust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, sand = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.1}
	})
})

minetest.register_node(":asteroid:reddust", {
	description = "Red Asteroid Dust",
	tiles = {"asteroid_reddust.png"},
	is_ground_content = false,
	groups = {crumbly = 3, sand = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.1}
	})
})

minetest.register_node(":asteroid:ironore", {
	description = "Red Asteroid Iron Ore",
	tiles = {"asteroid_redstone.png^default_mineral_iron.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:copperore", {
	description = "Red Asteroid Copper Ore",
	tiles = {"asteroid_redstone.png^default_mineral_copper.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:coalore", {
	description = "Red Asteroid Coal Ore",
	tiles = {"asteroid_redstone.png^default_mineral_coal.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	drop = "default:coal_lump",
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:diamondore", {
	description = "Red Asteroid Diamond Ore",
	tiles = {"asteroid_redstone.png^default_mineral_diamond.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:meseore", {
	description = "Red Asteroid Mese Ore",
	tiles = {"asteroid_redstone.png^default_mineral_mese.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node(":asteroid:mineral_tin", {
	description = S("Asteroid Tin Ore"),
	tiles = {"asteroid_cobble.png^moreores_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky=1, pickaxey=1},
	sounds = technic.sounds.node_sound_stone_defaults(),
	drop = "moreores:tin_lump",
})

minetest.register_node(":asteroid:red_mineral_tin", {
	description = S("Red Asteroid Tin Ore"),
	tiles = {"asteroid_redstone.png^moreores_mineral_tin.png"},
	is_ground_content = false,
	groups = {cracky=2, pickaxey=1},
	sounds = technic.sounds.node_sound_stone_defaults(),
	drop = "moreores:tin_lump",
})

minetest.register_node(":asteroid:mineral_gold", {
	description = S("Asteroid Gold Ore"),
	tiles = {"asteroid_cobble.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky=2, pickaxey=1},
	sounds = technic.sounds.node_sound_stone_defaults(),
	drop = "default:gold_lump",
})

minetest.register_node(":asteroid:red_mineral_gold", {
	description = S("Red Asteroid Gold Ore"),
	tiles = {"asteroid_redstone.png^default_mineral_gold.png"},
	is_ground_content = false,
	groups = {cracky=3, pickaxey=1},
	sounds = technic.sounds.node_sound_stone_defaults(),
	drop = "default:gold_lump",
})


if core.get_modpath("moreores") then

	minetest.register_node(":asteroid:mineral_silver", {
		description = S("Asteroid Silver Ore"),
		tiles = {"asteroid_cobble.png^moreores_mineral_silver.png"},
		is_ground_content = false,
		groups = {cracky=2, pickaxey=1},
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "moreores:mineral_silver_lump",
	})

	minetest.register_node(":asteroid:red_mineral_silver", {
		description = S("Red Asteroid Silver Ore"),
		tiles = {"asteroid_redstone.png^moreores_mineral_silver.png"},
		is_ground_content = false,
		groups = {cracky=3, pickaxey=1},
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "moreores:mineral_silver_lump",
	})

end

if core.get_modpath("technic") then

	minetest.register_node(":asteroid:mineral_uranium", {
		description = S("Asteroid Uranium Ore"),
		tiles = {"asteroid_cobble.png^technic_mineral_uranium.png"},
		is_ground_content = false,
		groups = {cracky=3, radioactive=1, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:uranium_lump",
	})

	minetest.register_node(":asteroid:red_mineral_uranium", {
		description = S("Red Asteroid Uranium Ore"),
		tiles = {"asteroid_redstone.png^technic_mineral_uranium.png"},
		is_ground_content = false,
		groups = {cracky=3, radioactive=1, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:uranium_lump",
	})

	minetest.register_node(":asteroid:mineral_chromium", {
		description = S("Asteroid Chromium Ore"),
		tiles = {"asteroid_cobble.png^technic_mineral_chromium.png"},
		is_ground_content = false,
		groups = {cracky=2, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:chromium_lump",
	})

	minetest.register_node(":asteroid:red_mineral_chromium", {
		description = S("Red Asteroid Chromium Ore"),
		tiles = {"asteroid_redstone.png^technic_mineral_chromium.png"},
		is_ground_content = false,
		groups = {cracky=3, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:chromium_lump",
	})

	minetest.register_node(":asteroid:mineral_zinc", {
		description = S("Asteroid Zinc Ore"),
		tiles = {"asteroid_cobble.png^technic_mineral_zinc.png"},
		is_ground_content = false,
		groups = {cracky=2, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:zinc_lump",
	})

	minetest.register_node(":asteroid:red_mineral_zinc", {
		description = S("Red Asteroid Zinc Ore"),
		tiles = {"asteroid_redstone.png^technic_mineral_zinc.png"},
		is_ground_content = false,
		groups = {cracky=3, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:zinc_lump",
	})

	minetest.register_node(":asteroid:mineral_lead", {
		description = S("Asteroid Lead Ore"),
		tiles = {"asteroid_cobble.png^technic_mineral_lead.png"},
		is_ground_content = false,
		groups = {cracky=2, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:lead_lump",
	})

	minetest.register_node(":asteroid:red_mineral_lead", {
		description = S("Red Asteroid Lead Ore"),
		tiles = {"asteroid_redstone.png^technic_mineral_lead.png"},
		is_ground_content = false,
		groups = {cracky=3, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:lead_lump",
	})

	minetest.register_node(":asteroid:mineral_sulfur", {
		description = S("Asteroid Sulfur Ore"),
		tiles = {"asteroid_cobble.png^technic_mineral_sulfur.png"},
		is_ground_content = false,
		groups = {cracky=2, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:sulfur_lump",
	})

	minetest.register_node(":asteroid:red_mineral_sulfur", {
		description = S("Red Asteroid Sulfur Ore"),
		tiles = {"asteroid_redstone.png^technic_mineral_sulfur.png"},
		is_ground_content = false,
		groups = {cracky=3, pickaxey=1},
		_mcl_hardness = 0.8,
		_mcl_blast_resistance = 1,
		sounds = technic.sounds.node_sound_stone_defaults(),
		drop = "technic:sulfur_lump",
	})

end