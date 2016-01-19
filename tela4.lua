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

  local soundBack = audio.loadStream( "BadToThe Bone.ogg" )
  local ch1 = audio.play( soundBack )

  local bkp = display.newImage( "final.png" )
  bkp.x = display.contentWidth/2
  bkp.y = display.contentHeight/2

  bkp.width = 500
  bkp.height = 380

  local go = display.newImage( "handmade.png" , 250, 180)
  go.width = 40
  go.height = 40

  lv2Group:insert( bkp )
  lv2Group:insert( go )  

  go:addEventListener( 'touch', onGo ) 

  -- Inicia a cena aqui
  -- Ex: adicionar objetos display para "sceneGroup", adicionar touch Listeners, etc
end

function onGo(e)
	if (e.phase == "ended") then
		composer.removeScene("tela4")
    audio.stop()
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
