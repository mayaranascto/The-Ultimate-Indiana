local composer = require( "composer" )

local currentScore = 200

-- Later...
local options = {
    effect = "fade",
    time = 800
}
composer.gotoScene( "scene1", options )