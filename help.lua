display.setStatusBar(display.HiddenStatusBar)

local composer = require("composer")
local scene = composer.newScene()

-------------------------------------------------------------------------------
function scene:create(event)
  local helpGroup = self.view

  local bkp = display.newImage( "helpTela.png" )
  bkp.x = display.contentWidth/2
  bkp.y = display.contentHeight/2

  bkp.width = 570
  bkp.height = 320

  local backH = display.newImage( "back.png" , 480, 20)

  helpGroup:insert(bkp)
  helpGroup:insert( backH )

  backH:addEventListener( 'touch', onBackH )

  

  -- Inicia a cena aqui
  -- Ex: adicionar objetos display para "sceneGroup", adicionar touch Listeners, etc
end

function onBackH(e)
	if e.phase == "ended" then
		composer.removeScene("help")
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
