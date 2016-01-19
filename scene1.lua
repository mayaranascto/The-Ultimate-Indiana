--display.setStatusBar( display.HiddenStatusBar )

local composer = require( "composer" )

local scene = composer.newScene()

local physics = require("physics")
--physics.setDrawMode( "hybrid" )
physics.start()
physics.setGravity( 0, 0 )

score = 0
vida = 3
local haveKey = false
local ok = false
local obs = false
local over = false
local time = false


function scene:create( event )
	local tempo

    local scene1Group = self.view
    local w = display.contentWidth
	local h = display.contentHeight

	local soundBack = audio.loadStream( "buddy.mp3" )
	local ch1 = audio.play( soundBack )


	local background = display.newImage("bkp.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.width = 550
	background.height = 320

	
	local image_key = "key1.png"	

	local image_outline_key = graphics.newOutline(2, image_key )

	local image_star_key = display.newImage( image_key)
	image_star_key.x = 470
	image_star_key.y = 220

	physics.addBody( image_star_key,"static", { outline=image_outline_key})

	local image_door = "door4.png"	

	local image_outline_door = graphics.newOutline(2, image_door )

	local image_star_door = display.newImage( image_door)
	image_star_door.x = -22
	image_star_door.y = 34.5

	physics.addBody( image_star_door,"static", { outline=image_outline_door})


	local image_walls = "walls.png"


	local image_outline_walls = graphics.newOutline(2, image_walls )

	local image_star_walls = display.newImage( image_walls)
	image_star_walls.x = display.contentCenterX
	image_star_walls.y = display.contentCenterY
	image_star_walls.width = 535
	image_star_walls.height = 320



	local image_name = "ob1.png" -- Início da criação e posicionamento dos obstáculos

	local image_outline = graphics.newOutline(2, image_name )

	local image_star = display.newImage( image_name)
	image_star.x = 160
	image_star.y = 70
	image_star.Myname="obstaculo"

	physics.addBody( image_star,"static", { outline=image_outline})

	scene1Group:insert(image_star)

	local image_name2 = "ob2.png"

	local image_outline2 = graphics.newOutline(2, image_name2 )

	local image_star2 = display.newImage( image_name2)
	image_star2.x = 55
	image_star2.y = 170
	image_star2.Myname="obstaculo"


	physics.addBody( image_star2,"static", { outline=image_outline2})


	local image_name3 = "ob3_1.png"

	local image_outline3 = graphics.newOutline(2, image_name3 )

	local image_star3 = display.newImage( image_name3)
	image_star3.x = 145
	image_star3.y = 160
	image_star3.myName="obstaculo3"

	physics.addBody( image_star3,"static", { outline=image_outline3})


	local image_name4 = "ob4.png"

	local image_outline4 = graphics.newOutline(2, image_name4 )

	local image_star4 = display.newImage( image_name4)
	image_star4.x = 130
	image_star4.y = 245
	image_star4.Myname="obstaculo"

	physics.addBody( image_star4,"static", { outline=image_outline4})

	local image_name5 = "ob5.png"

	local image_outline5 = graphics.newOutline(2, image_name5 )

	local image_star5 = display.newImage( image_name5)
	image_star5.x = 215
	image_star5.y = 160
	image_star5.Myname="obstaculo"


	physics.addBody( image_star5,"static", { outline=image_outline5})

	local image_name6 = "ob6.png"

	local image_outline6 = graphics.newOutline(2, image_name6 )

	local image_star6 = display.newImage( image_name6)
	image_star6.x = 270
	image_star6.y = 160
	image_star6.name="obstaculo"

	physics.addBody( image_star6,"static", { outline=image_outline6})

	local image_name7 = "ob7_1.png"

	local image_outline7 = graphics.newOutline(2, image_name7 )

	local image_star7 = display.newImage( image_name7)
	image_star7.x = 335
	image_star7.y = 160
	image_star7.myName="obstaculo7"

	physics.addBody( image_star7,"static", { outline=image_outline7})

	local image_name8 = "ob8.png"

	local image_outline8 = graphics.newOutline(2, image_name8 )

	local image_star8 = display.newImage( image_name8)
	image_star8.x = 320
	image_star8.y = 70
	image_star8.Myname="obstaculo"

	physics.addBody( image_star8,"static", { outline=image_outline8})

	local image_name9 = "ob9.png"

	local image_outline9 = graphics.newOutline(2, image_name9 )

	local image_star9 = display.newImage( image_name9)
	image_star9.x = 425
	image_star9.y = 170
	image_star9.Myname="obstaculo"

	physics.addBody( image_star9,"static", { outline=image_outline9})

	local image_name10 = "ob10.png"

	local image_outline10 = graphics.newOutline(2, image_name10 )

	local image_star10 = display.newImage( image_name10)
	image_star10.x = 345
	image_star10.y = 245
	image_star10.Myname="obstaculo"

	physics.addBody( image_star10,"static", { outline=image_outline10}) --Final

	local wallUp = display.newLine( -45, 1, 1090, 1 )
	local wallDown = display.newLine( -45, 305, 1090, 305 )
	local wallRight = display.newLine( 499,2,499,630 )
	local wallLeft = display.newLine( -19,220,-19,550 )
	local passDoor = display.newLine( -20, 30, -20, 40 )
	passDoor.myName = "door"

	wallUp.isVisible = false
	wallDown.isVisible = false
	wallRight.isVisible = false
	wallLeft.isVisible = false
	passDoor.isVisible = false

	physics.addBody( wallUp, "static" )
	physics.addBody( wallDown, "static" )
	physics.addBody( wallRight, "static" )
	physics.addBody( wallLeft, "static" )
	physics.addBody( passDoor, "static")

	local back = display.newImage( "menuBtn.png" ,480, 30, 30, 30 )
	back.alpha = 0.7
	

	local sheetC = {width=512/32, height=512/32, numFrames=16, sheetContentWidth=2048/32, sheetContentHeight=2048/32} -- Início da criação e posicionamento das moedas
	local sheetcoin = graphics.newImageSheet( "coin.png", sheetC )
	local sequenceDataCoin =
	{
		{name="coin", sheet=sheetcoin ,start=1, count=16, time = 1000, loopCount=0}
	}
	local coin1
	coin1 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin1.x = 80
	coin1.y = 40
	physics.addBody( coin1, "static")
	coin1.myName = "moeda"

	local coin2
	coin2 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin2.x = 150
	coin2.y = 110
	physics.addBody( coin2, "static")
	coin2.myName = "moeda"

	local coin3
	coin3 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin3.x = 10
	coin3.y = 120
	physics.addBody( coin3, "static")
	coin3.myName = "moeda"

	local coin4
	coin4 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin4.x = 250
	coin4.y = 60
	physics.addBody( coin4, "static")
	coin4.myName = "moeda"

	local coin5
	coin5 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin5.x = 95
	coin5.y = 220
	physics.addBody( coin5, "static")
	coin5.myName = "moeda"

	local coin6
	coin6 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin6.x = 300
	coin6.y = 150
	physics.addBody( coin6, "static")
	coin6.myName = "moeda"

	local coin7
	coin7 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin7.x = 400
	coin7.y = 250
	physics.addBody( coin7, "static")
	coin7.myName = "moeda"

	local coin8
	coin8 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin8.x = 230
	coin8.y = 280
	physics.addBody( coin8, "static")
	coin8.myName = "moeda"

	local coin9
	coin9 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin9.x = 470
	coin9.y = 170
	physics.addBody( coin9, "static")
	coin9.myName = "moeda"

	local coin10
	coin10 = display.newSprite( sheetcoin, sequenceDataCoin )
	coin10.x = 400
	coin10.y = 50
	physics.addBody( coin10, "static")
	coin10.myName = "moeda"

	coin1:play( )
	coin2:play( )
	coin3:play( )
	coin4:play( )
	coin5:play( )
	coin6:play( )
	coin7:play( )
	coin8:play( )
	coin9:play( )
	coin10:play( )	-- Final

	local coracao = display.newImage( "heart.png" )
	coracao.x = 390
	coracao.y = 150
	physics.addBody( coracao, "static" )
	coracao.myName = "heart"
	

	local sheetUp = {width=29, height=33, numFrames=3}
	local sheetUp1 = {width=30, height=33, numFrames=2}
	local sheetSide = {width=23, height=34, numFrames=2}
	local sheetSide1 = {width=26.49999999999, height=34, numFrames=2}

	local sheetup = graphics.newImageSheet( "walk-up.png", sheetUp1 )
	local sheetdown = graphics.newImageSheet( "walk-down.png", sheetUp )
	local sheetleft = graphics.newImageSheet( "walk-left1.png",  sheetSide1 )
	local sheetright = graphics.newImageSheet( "walk-right.png", sheetSide )

	local sequenceData =
	{
		{name = "idleUp", sheet = sheetup,start = 2, count = 1, time = 0, loopCount = 1},
		{name = "moveUp", sheet = sheetup, start = 1, count = 2, time = 300, loopCount = 0},
		{name = "idleDown", sheet = sheetdown, start = 2, count = 1, time = 0, loopCount = 1},
		{name = "moveDown", sheet = sheetdown, start = 1, count = 3, time = 300, loopCount = 0},
		{name = "idleLeft", sheet = sheetleft, start = 2, count = 1, time = 0, loopCount = 1},
		{name = "moveLeft", sheet = sheetleft, start = 1, count = 2, time = 300, loopCount, 0},
		{name = "idleRight", sheet = sheetright, start = 2, count = 1, time = 300, loopCount = 1},
		{name = "moveRight", sheet = sheetright, start = 1, count = 2, time = 300, loopCount = 0}
	}

	local indiana = display.newSprite( sheetdown, sequenceData )
	indiana.x = w * .5
	indiana.y = h * .5
	physics.addBody(indiana,"dynamic")
	indiana.isFixedRotation = true
	indiana.myName = "indiana"

	indiana:setSequence( "idleUp" )

	local buttons = {}

	buttons[1] = display.newImage( "arrow-right.png" ) -- up
	buttons[1].x = 20
	buttons[1].y = 240	buttons[1].rotation = 90
	buttons[1].myName = "up"
	buttons[1].alpha = 0.01

	buttons[2] = display.newImage( "arrow-right.png" ) -- right
	buttons[2].x = 50
	buttons[2].y = 270
	buttons[2].rotation = 180
	buttons[2].myName = "right"
	buttons[2].alpha = 0.01

	buttons[3] = display.newImage( "arrow-right.png" ) -- left
	buttons[3].x = -10
	buttons[3].y = 270
	buttons[3].myName = "left"
	buttons[3].alpha = 0.01

	buttons[4] = display.newImage( "arrow-right.png" ) -- down
	buttons[4].x = 20
	buttons[4].y = 300
	buttons[4].rotation = 270
	buttons[4].myName = "down"
	buttons[4].alpha = 0.01

	local control = display.newImage( "control1.png" )
	control.x = 20
	control.y = 270
	control.alpha = .6

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


	--[[timeCount = 30

	function listener( event )
		if (timeCount >= 1) then

    		timeCount = timeCount - 1
    		print(timeCount)
    		print(tempo)
    	elseif (time == true) then
    		timer.cancel( tempo )
    	else
    		over = true
    	end
	end	

	tempo = timer.performWithDelay( 1000, listener, 0 )]]--	
	--timer.cancel( tempo )

	--[[local function timeUpdate()
		timer.text = ""..string.format( "%d", timeCount )
	end]]--

	local scoreLabel = display.newImage("moedas.png")
	scoreLabel.x = 150
	scoreLabel.y = 10

	local moedas = display.newText ("", 170, 10, "hobon.ttf", 15 )
	moedas:toFront( )
	moedas:setFillColor( 1, 1, 1 )

	local function scoreUpdate()
		moedas.text = ""..string.format( "%d", score )
	end

	local vidasLabel = display.newImage ("vidas1.png" )
	vidasLabel.x = 300
	vidasLabel.y = 10

	local vidas = display.newText ("", 320, 10, "hobon.ttf", 15 )
	vidas:toFront( )
	vidas:setFillColor( 1, 1, 1 )

	local function vidaUpdate()
		vidas.text = ""..string.format( "%d", vida )
	end

	--[[local vida1 = display.newImage ("heart.png")
	vida1.x = 345
	vida1.y = 10
	local vida2 = display.newImage ("heart.png")
	vida2.x = 365
	vida2.y = 10
	local vida3 = display.newImage ("heart.png")
	vida3.x = 385
	vida3.y = 10]]--
	

	function onCollisionCoin (e)
		if (e.phase == "began") then
			if (e.other.myName == "moeda") then
				e.other:removeSelf( )

				score = score + 1
				print( score )

			end
		end
	end

	function onCollisionHeart (e)
		if (e.phase == "began") then
			if (e.other.myName == "heart") then
				e.other:removeSelf( )

				vida = vida + 1
				print( vida )

			end
		end
	end

	local function onCollisionObs (e)
		if (e.phase == "began" and (e.other.myName == "obstaculo3" or e.other.myName == "obstaculo7")) then
			obs = true
			print(obs)
			print(vida)
			print (obs)
			if (vida > 1) then
				vida = vida - 1
				obs = false
			else
				over = true
			end
		end
		return true
	end	

	local function gameover()
		if (over == true) then
			Runtime:removeEventListener("enterFrame", gameover)
			Runtime:removeEventListener("enterFrame", update)
			composer.removeScene("scene1")
			physics.stop()
			composer.gotoScene("gameover")
			
		end
	end

	function onCollisionKey( event ) 
	  
	    image_star_key:removeSelf( )
	    image_star_door:removeSelf( )
	    haveKey = true
	    local sound = audio.loadSound( "key_pickup.mp3" )
	    audio.play( sound )

	    local image_door = "door.png"

		
		--image_star.width = display.contentWidth
		--image_star.height = display.contentHeight

		--physics.addBody( image_star_door,"static", { outline=image_outline_door})
		print( haveKey )
	end

	function onBack(e)
  		if (e.phase == "ended") then
			composer.removeScene("scene1")
    		composer.gotoScene("menu")
    		audio.stop()
    		physics.stop( )
  		end
    	return true
	end

	local function stop( e )
		if (ok == true) then			
			Runtime:removeEventListener( "enterFrame", stop )
			composer.removeScene("scene1")
			audio.stop()		
			physics.stop( )
	    	composer.gotoScene("tela1")
	    	--timer.cancel(tempo)
		end
	end

	local function onPass( e )
		if (e.phase == "began" and e.other.myName == "door" and score == 10 and haveKey == true) then
			ok = true

  		end
    	return true
	end


		scene1Group:insert( background )
		scene1Group:insert(image_star)
		scene1Group:insert(image_star2)
		scene1Group:insert(image_star3)
		scene1Group:insert(image_star4)
		scene1Group:insert(image_star5)
		scene1Group:insert(image_star6)
		scene1Group:insert(image_star7)
		scene1Group:insert(image_star8)
		scene1Group:insert(image_star9)
		scene1Group:insert(image_star10)
		scene1Group:insert(image_star_walls)
		scene1Group:insert(image_star_door)
		scene1Group:insert(image_star_key)
		scene1Group:insert(passDoor)
	    scene1Group:insert(indiana)
	    scene1Group:insert( back )
	    scene1Group:insert(buttons[1])
	    scene1Group:insert(buttons[2])
	    scene1Group:insert(buttons[3])
	    scene1Group:insert(buttons[4])
	    scene1Group:insert(coin1)
	    scene1Group:insert(coin2)
	    scene1Group:insert(coin3)
	    scene1Group:insert(coin4)
	    scene1Group:insert(coin5)
	    scene1Group:insert(coin6)
	    scene1Group:insert(coin7)
	    scene1Group:insert(coin8)
	    scene1Group:insert(coin9)
	    scene1Group:insert(coin10)
	    --scene1Group:insert( timeLabel )
	    --scene1Group:insert(timer)
	    scene1Group:insert( scoreLabel )
	    scene1Group:insert( vidasLabel )
	    scene1Group:insert( moedas )
	    scene1Group:insert( vidas )
	    scene1Group:insert( control )
	    scene1Group:insert( coracao )
	    --scene1Group:insert( vida1 )
	    --scene1Group:insert( vida2 )
	    --scene1Group:insert( vida3 )
	    --scene1Group:insert( timer )


		--Runtime:addEventListener("enterFrame", tempo)	    	
	   	Runtime:addEventListener("enterFrame", gameover) -- Tela de gameover
	   	--Runtime:addEventListener("enterFrame", timeUpdate) -- Atualiza o timer
	   	Runtime:addEventListener("enterFrame", scoreUpdate) -- Atualiza o score
	   	Runtime:addEventListener("enterFrame", vidaUpdate) -- Atualiza as vidas
		Runtime:addEventListener("enterFrame", stop) --Função que caso a variável ok tenha valor true, é feita a troca de cenas
	    Runtime:addEventListener("enterFrame", update) --Função que atualiza a posição do personagem
		image_star_key:addEventListener('collision', onCollisionKey) --Colisão do personagem com a chave
		indiana:addEventListener( 'collision', onCollisionCoin ) --Função para pegar moedas
		indiana:addEventListener( 'collision', onCollisionHeart ) --Função para pegar vida
		back:addEventListener( 'touch', onBack ) --Função para voltar ao menu principal
		indiana:addEventListener( 'collision', onPass ) --Colisão que altera o valor da variável ok
		indiana:addEventListener( 'collision', onCollisionObs ) --Colisão com os obstáculos vermelhos
    	
	end	
	

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene 