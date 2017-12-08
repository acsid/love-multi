game = {}

player = require("entity.player")

function game:init()
	hub:subscribe({
	channel = "game-channel";
	callback = function(message)
		print("message received  = "..json.encode(message));
	end 
	
	});
	print("Game Channel Joined")
	
end

function game:update(dt)
 hub:enterFrame()


end

function game:draw()
	player:draw()
	love.graphics.print("GAME",0,0)
end