gamestate 	=	require "libs.hump.gamestate"
require("noobhub")
require "game"
require "menu"
require "connect"
require("md5")

g_screenres = {
	w=math.floor(love.graphics.getWidth()),
	h=math.floor(love.graphics.getHeight())
}

function love.load()
	love.window.setTitle("multiplayer test")
	gamestate.registerEvents()
	gamestate.switch(menu)

end
