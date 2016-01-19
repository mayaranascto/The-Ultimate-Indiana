--display.setStatusBar(display.HiddenStatusBar)

local composer = require("composer")
local scene = composer.newScene()

local physics = require("physics")
physics.start( )
physics.setGravity( 0, 0 )
--physics.setDrawMode( "hybrid" )


-------------------------------------------------------------------------------
function scene:create(event)
  local lv2Group = self.view

  local soundBack = audio.loadStream( "chipquest.wav" )
  local ch1 = audio.play( soundBack )

  local bkp = display.newImage( "nextLevel.png" )
  bkp.x = display.contentWidth/2
  bkp.y = display.contentHeight/2

  bkp.width = 500
  bkp.height = 380

  local go = display.newImage( "handmade.png" , 250, 250)
  go.width = 50
  go.height = 50

  lv2Group:insert( bkp )
  lv2Group:insert( go )  

  go:addEventListener( 'touch', onGo )

  -- Inicia a cena aqui
  -- Ex: adicionar objetos display para "sceneGroup", adicionar touch Listeners, etc
end

function onGo(e)
	if (e.phase == "ended") then
		composer.removeScene("tela1")
    audio.stop()
    composer.gotoScene("scene2")
	end
		return true
end


--------------------------------------------------------------------------------

-- Listener Setup

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

--------------------------------------------------------------------------------

return scene
