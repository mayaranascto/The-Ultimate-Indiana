local composer = require( "composer" )

local scene = composer.newScene()

local physics = require("physics")
physics.start()
physics.setGravity( 0, 0 )
--physics.setDrawMode( "hybrid" )


function scene:create( event )

    local sceneGroup = self.view
    local w = display.contentWidth
	local h = display.contentHeight

	local soundBack = audio.loadSound( "jazz.ogg" )
	audio.play( soundBack )

	local background = display.newImage("bkp.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.width = 570
	background.height = 320



	local image_key = "key.png"

	local image_outline_key = graphics.newOutline(2, image_key )

	local image_star_key = display.newImage( image_key)
	image_star_key.x = 490
	image_star_key.y = 220
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star_key,"static", { outline=image_outline_key})


	local image_walls = "walls.png"

	local image_outline_walls = graphics.newOutline(2, image_walls )

	local image_star_walls = display.newImage( image_walls)
	image_star_walls.x = display.contentCenterX
	image_star_walls.y = display.contentCenterY
	image_star_walls.width = 570
	image_star_walls.height = 320

	local image_name = "ob1.png"

	local image_outline = graphics.newOutline(2, image_name )

	local image_star = display.newImage( image_name)
	image_star.x = 160
	image_star.y = 70
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star,"static", { outline=image_outline})


	local image_name2 = "ob2.png"

	local image_outline2 = graphics.newOutline(2, image_name2 )

	local image_star2 = display.newImage( image_name2)
	image_star2.x = 40
	image_star2.y = 170
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star2,"static", { outline=image_outline2})


	local image_name3 = "ob3.png"

	local image_outline3 = graphics.newOutline(2, image_name3 )

	local image_star3 = display.newImage( image_name3)
	image_star3.x = 130
	image_star3.y = 175
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star3,"static", { outline=image_outline3})


	local image_name4 = "ob4.png"

	local image_outline4 = graphics.newOutline(2, image_name4 )

	local image_star4 = display.newImage( image_name4)
	image_star4.x = 130
	image_star4.y = 265
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star4,"static", { outline=image_outline4})

	local image_name5 = "ob5.png"

	local image_outline5 = graphics.newOutline(2, image_name5 )

	local image_star5 = display.newImage( image_name5)
	image_star5.x = 210
	image_star5.y = 160
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star5,"static", { outline=image_outline5})

	local image_name6 = "ob6.png"

	local image_outline6 = graphics.newOutline(2, image_name6 )

	local image_star6 = display.newImage( image_name6)
	image_star6.x = 275
	image_star6.y = 160
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star6,"static", { outline=image_outline6})

	local image_name7 = "ob7.png"

	local image_outline7 = graphics.newOutline(2, image_name7 )

	local image_star7 = display.newImage( image_name7)
	image_star7.x = 350
	image_star7.y = 173
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star7,"static", { outline=image_outline7})

	local image_name8 = "ob8.png"

	local image_outline8 = graphics.newOutline(2, image_name8 )

	local image_star8 = display.newImage( image_name8)
	image_star8.x = 320
	image_star8.y = 70
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star8,"static", { outline=image_outline8})

	local image_name9 = "ob9.png"

	local image_outline9 = graphics.newOutline(2, image_name9 )

	local image_star9 = display.newImage( image_name9)
	image_star9.x = 440
	image_star9.y = 170
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star9,"static", { outline=image_outline9})

	local image_name10 = "ob10.png"

	local image_outline10 = graphics.newOutline(2, image_name10 )

	local image_star10 = display.newImage( image_name10)
	image_star10.x = 345
	image_star10.y = 265
	--image_star.width = display.contentWidth
	--image_star.height = display.contentHeight

	physics.addBody( image_star10,"static", { outline=image_outline10})

	local wallUp = display.newLine( -45, 1, 1050, 1 )
	local wallDown = display.newLine( -45, 320, 1050, 320 )
	local wallRight = display.newLine( 524,2,524,590 )
	local wallLeft = display.newLine( -43,220,-43,550 )
	local passDoor = display.newLine( -40, 20, -40, 50 )

	wallUp.isVisible = false
	wallDown.isVisible = false
	wallRight.isVisible = false
	wallLeft.isVisible = false
	passDoor.isVisible = false

	physics.addBody( wallUp, "static" )
	physics.addBody( wallDown, "static" )
	physics.addBody( wallRight, "static" )
	physics.addBody( wallLeft, "static" )
	

	--local options =
	--{
	--    width = 420,
	--   height = 120,
	--    numFrames = 2,
	--   sheetContentWidth = 123,  -- width of original 1x size of entire sheet
	--    sheetContentHeight = 118  -- height of original 1x size of entire sheet
	--}

	--local letterSheet = graphics.newImageSheet( "teste6.png", options )

	--local frameIndex = 2

	--local letterOutline = graphics.newOutline( 2, letterSheet, frameIndex )

	--local letterImage = display.newImage( letterSheet, frameIndex )
	--letterImage.x = display.contentWidth/2
	--letterImage.y = display.contentHeight/2
	--letterImage.width = display.contentWidth
	--letterImage.height = display.contentHeight

	--physics.addBody( letterImage, { outline=letterOutline } )


	local sheetUp = {width=29, height=33, numFrames=3}
	local sheetSide = {width=23.4999999999, height=33, numFrames=3}

	local sheetup = graphics.newImageSheet( "walk-up.png", sheetUp )
	local sheetdown = graphics.newImageSheet( "walk-down.png", sheetUp )
	local sheetleft = graphics.newImageSheet( "walk-left-0.png",  sheetSide )
	local sheetright = graphics.newImageSheet( "walk-right.png", sheetSide )

	local sequenceData =
	{
		{name = "idleUp", sheet = sheetup,start = 2, count = 1, time = 0, loopCount = 1},
		{name = "moveUp", sheet = sheetup, start = 1, count = 3, time = 300, loopCount = 0},
		{name = "idleDown", sheet = sheetdown, start = 2, count = 1, time = 0, loopCount = 1},
		{name = "moveDown", sheet = sheetdown, start = 1, count = 3, time = 300, loopCount = 0},
		{name = "idleLeft", sheet = sheetleft, start = 2, count = 1, time = 0, loopCount = 1},
		{name = "moveLeft", sheet = sheetleft, start = 1, count = 3, time = 300, loopCount, 0},
		{name = "idleRight", sheet = sheetright, start = 2, count = 1, time = 300, loopCount = 1},
		{name = "moveRight", sheet = sheetright, start = 1, count = 3, time = 300, loopCount = 0}
	}



	local indiana = display.newSprite( sheetdown, sequenceData )
	indiana.x = w * .5
	indiana.y = h * .5
	physics.addBody(indiana,"dynamic")
	indiana.isFixedRotation = true

	indiana:setSequence( "idleUp" )

	local buttons = {}

	buttons[1] = display.newImage( "arrow-right.png" ) -- up
	buttons[1].x = 445
	buttons[1].y = 235
	buttons[1].rotation = 90
	buttons[1].myName = "up"

	buttons[2] = display.newImage( "arrow-right.png" ) -- right
	buttons[2].x = 470
	buttons[2].y = 260
	buttons[2].rotation = 180
	buttons[2].myName = "right"

	buttons[3] = display.newImage( "arrow-right.png" ) -- left
	buttons[3].x = 420
	buttons[3].y = 260
	buttons[3].myName = "left"

	buttons[4] = display.newImage( "arrow-right.png" ) -- down
	buttons[4].x = 445
	buttons[4].y = 285
	buttons[4].rotation = 270
	buttons[4].myName = "down"

	local passosX = 0
	local passosY = 0

	local touchFunction = function(e)
		local eventName = e.phase
		local direction = e.target.myName

		if e.phase == "began" or e.phase == "moved" then
			if direction == "up" then
				indiana:setSequence( "moveUp" )
				indiana:play()
				passosY = -5
				passosX = 0
			elseif direction == "down" then
				indiana:setSequence( "moveDown" )
				indiana:play()
				passosY = 5
				passosX = 0
			elseif direction == "right" then
				indiana:setSequence( "moveRight" )
				indiana:play()
				passosX = 5
				passosY = 0
			elseif direction == "left" then
				indiana:setSequence( "moveLeft" )
				indiana:play()
				passosX = -5
				passosY = 0
			end
			else
			indiana:setSequence( "idleDown" )
			passosY = 0
			passosX = 0
			end

		end

	local j=1

	for j=1, #buttons do
		buttons[j]:addEventListener( "touch", touchFunction )
	end

	local update = function ()
		indiana.x = indiana.x + passosX
		indiana.y = indiana.y + passosY
	end

	Runtime:addEventListener("enterFrame", update)

	local function onCollisionKey( event ) 
	  
	        image_star_key:removeSelf( )
	        local sound = audio.loadSound( "key_pickup.mp3" )
	        audio.play( sound )

	        local image_door = "door.png"

			local image_outline_door = graphics.newOutline(2, image_door )

			local image_star_door = display.newImage( image_door)
			image_star_door.x = -17
			image_star_door.y = 60
			--image_star.width = display.contentWidth
			--image_star.height = display.contentHeight

			physics.addBody( image_star_door,"static", { outline=image_outline_door})
	    end

		image_star_key:addEventListener('collision', onCollisionKey)
    
	end



-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene