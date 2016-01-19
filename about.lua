display.setStatusBar(display.HiddenStatusBar)

local composer = require("composer")
local scene = composer.newScene()

-------------------------------------------------------------------------------
function scene:create(event)
  local aboutGroup = self.view

  local bkp = display.newImage( "aboutTela.png" )
  bkp.x = display.contentWidth/2
  bkp.y = display.contentHeight/2

  bkp.width = 570
  bkp.height = 320

  local backA = display.newImage( "back.png" , 480, 20)

  aboutGroup:insert(bkp)
  aboutGroup:insert( backA )

  backA:addEventListener( 'touch', onBackA )

  

  -- Inicia a cena aqui
  -- Ex: adicionar objetos display para "sceneGroup", adicionar touch Listeners, etc
end

function onBackA(e)
	if e.phase == "ended" then
		composer.removeScene("about")
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
