-- Heights for underground
local underground = -75
local blackness = -10999

-- Heights for skyboxes
local atmos_low = 1000
local atmos_up = 2000         -- start height
local space_low = 4000        -- start height
local space_mid = 10000       -- start height
local space_high = 16000 - 1  -- end height
local redsky_low = 16000      -- start height
local redsky_high = 22000 - 1 -- end height
local space_deep_low = 22000  -- start height
local space_deep_high = 31000

local skyboxes = {
    underground = underground,
    blackness = blackness,
    atmos_low = atmos_low,
    atmos_up = atmos_up,
    space_low = space_low,
    space_mid = space_mid,
    space_high = space_high,
    redsky_low = redsky_low,
    redsky_high = redsky_high,
    space_deep_low = space_deep_low,
    space_deep_high = space_deep_high
}

-- accessors
otherworlds.skyboxes = skyboxes
otherworlds.skybox.blackness = blackness
otherworlds.skybox.underground = underground
otherworlds.skybox.atmos_low = atmos_low
otherworlds.skybox.atmos_up = atmos_up
otherworlds.skybox.space_low = space_low
otherworlds.skybox.space_mid = space_mid
otherworlds.skybox.space_high = space_high
otherworlds.skybox.redsky_low = redsky_low
otherworlds.skybox.redsky_high = redsky_high
otherworlds.skybox.space_deep_low = space_deep_low
otherworlds.skybox.space_deep_high = space_deep_high
