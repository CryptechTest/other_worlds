-- mapping of applied gravity
local gravity_map = {
    unknown = 1.0,
    underground = 1.0,
    earth = 1.0,
    atmos_low = 0.8,
    atmos_high = 0.5,
    space_low = 0.1,
    space_mid = 0.09,
    redsky = 0.08,
    deepspace = 0.02,
    blackness = 0.03
}

local pova = minetest.get_modpath('pova')
-- gravity helper function
local set_player_gravity = function(player, grav)
    if pova then
        pova.add_override(player:get_player_name(), "default", {
            gravity = grav
        })
    else
        player:set_physics_override({
            gravity = grav
        })
    end
end

local reset = function(player)
    set_player_gravity(player, otherworlds.gravity.get(player))
end

-- set player gravity from sky
local set_gravity = function(player, sky)
    local grav = gravity_map[sky]
    if (grav) then
        set_player_gravity(player, grav)
    end
end

-- set player gravity
local set_direct = function(player, grav)
    set_player_gravity(player, grav)
end

-- get gravity of player
local get = function(obj)
    local pos = obj:get_pos()
    local y = pos.y
    local sky = "unknown"
    if pos.y > otherworlds.skybox.blackness + 1 and pos.y < otherworlds.skybox.underground then
        sky = "underground"
    elseif pos.y > otherworlds.skybox.underground and pos.y < otherworlds.skybox.atmos_low then
        sky = "earth"
    elseif pos.y > otherworlds.skybox.atmos_low and pos.y < otherworlds.skybox.atmos_up then
        sky = "atmos_low"
    elseif pos.y > otherworlds.skybox.atmos_up and pos.y < otherworlds.skybox.space_low then
        sky = "atmos_high"
    elseif pos.y > otherworlds.skybox.space_low and pos.y < otherworlds.skybox.space_mid then
        sky = "space_low"
    elseif pos.y > otherworlds.skybox.space_mid and pos.y < otherworlds.skybox.space_high then
        sky = "space_mid"
    elseif pos.y > otherworlds.skybox.redsky_low and pos.y < otherworlds.skybox.redsky_high then
        sky = "redsky"
    elseif pos.y > otherworlds.skybox.space_deep_low and pos.y < otherworlds.skybox.space_deep_high then
        sky = "deepspace"
    elseif pos.y < otherworlds.skybox.blackness then
        sky = "blackness"
    end
    return gravity_map[sky]
end

-- accessors
otherworlds.gravity = {}
otherworlds.gravity.map = gravity_map
otherworlds.gravity.reset = reset
otherworlds.gravity.xset = set_direct
otherworlds.gravity.set = set_gravity
otherworlds.gravity.get = get
