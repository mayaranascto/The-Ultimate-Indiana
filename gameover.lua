local composer = require("composer")
local scene = composer.newScene()

local physics = require("physics")
physics.start( )
physics.setGravity( 0, 0 )
--physics.setDrawMode( "hybrid" )


-------------------------------------------------------------------------------
function scene:create(event)
  local goGroup = self.view

  local bkp = display.newImage( "gameover.png" )
  bkp.x = display.contentWidth/2
  bkp.y = display.contentHeight/2

  bkp.width = 500
  bkp.height = 380

  local go = display.newImage( "back1.png" , 250, 250)
  go.width = 65
  go.height = 45

  goGroup:insert( bkp )
  goGroup:insert( go )  

  go:addEventListener( 'touch', onBackA )

  -- Inicia a cena aqui
  -- Ex: adicionar objetos display para "sceneGroup", adicionar touch Listeners, etc
end

function onBackA(e)
	if (e.phase == "ended") then
		composer.removeScene("gameover")
    composer.gotoScene("menu")
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
