otherworlds.settings = {}


-- general
otherworlds.settings.crafting = {
	-- set to false to remove crafting recipes
	enable = minetest.settings:get_bool("otherworlds.crafting", true)
}

-- space_asteroids
otherworlds.settings.space_asteroids = {
	-- set to false to prevent space mapgen
	enable = minetest.settings:get_bool("otherworlds.space", true),
	-- minimum height of space layer
	YMIN = tonumber(minetest.settings:get("otherworlds.space.ymin") or 5000),
	-- maximum height for space layer
	YMAX = tonumber(minetest.settings:get("otherworlds.space.ymax") or 7000),
}


-- redsky_asteroids
otherworlds.settings.redsky_asteroids = {
	-- set to false to prevent redsky mapgen
	enable = minetest.settings:get_bool("otherworlds.redsky", true),
	-- minimum height of redsky layer
	YMIN = tonumber(minetest.settings:get("otherworlds.redsky.ymin") or 15000),
	-- maximum height for redsky layer
	YMAX = tonumber(minetest.settings:get("otherworlds.redsky.ymax") or 17000),
}


-- gravity
otherworlds.settings.gravity = {
	-- set to true to enable gravity
	enable = minetest.settings:get_bool("otherworlds.gravity", false),
}
