display.setStatusBar(display.HiddenStatusBar)

local composer = require( "composer" )

local currentScore = 200

-- Later...
local options = {
    effect = "fade",
    time = 800
}
composer.gotoScene( "menu", options )