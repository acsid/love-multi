player = {
	update = function (self,dt)
				print("player update here")
			end,
	getid = function (self)
			print("getid")
			return self.id
		end,
	init = function (self)
		
		end,
	draw = function (self)
		love.graphics.print("@",self.x,self.y)
		end,
		id = math.random(),
		x = 0,
		y = 0
}

return player