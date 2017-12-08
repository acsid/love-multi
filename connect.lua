connect = {}
latencies = {}
txt = 'Waiting for Ping'

pings = 0

function connect:init()
	pings = 0
	hub = noobhub.new({ server = "192.168.1.132"; port = 1337; });
	hub:subscribe({
	channel = "ping-channel";
	callback = function(message)
		print("message received  = "..json.encode(message));
		if(message.action == "ping")   then ----------------------------------
			print ("pong sent");
			hub:publish({
				message = {
					action  =  "pong",
					id = message.id,
					original_timestamp = message.timestamp,
					timestamp = love.timer.getTime(),
					mid 	=	mid
				}
			});
		end;----------------------------------------------------------------
			if (message.id == mid ) then
				if (message.mid == mid) then
				
			print('its me')
			pings = pings + 1
			
			if (message.action == "pong"  )   then ----------------------------------
				print ("pong id "..message.id.." received on "..love.timer.getTime().."; summary:   latency=" .. (love.timer.getTime() - message.original_timestamp)   );
				table.insert( latencies,  ( (love.timer.getTime() - message.original_timestamp)   )     );

				local sum = 0;
				local count = 0;
				for i,lat in ipairs(latencies) do
					sum = sum + lat;
					count =  count+1;
				end

				print("---------- "..count..') average =  '..(sum/count)  );
				txt = 'Ping time average =  '..((sum/count)*1000)..' ms';
			end;----------------------------------------------------------------
			end
		else
			print('not me')
		end
		
		
	end;
});
end
dtotal = 0 
mid = 0
function connect:update(dt)
  hub:enterFrame(); -- making sure to give some CPU time to Noobhub

   dtotal = dtotal + dt
   if dtotal >= 3 then -- send ping every 3 seconds
		mid = love.timer.getTime()  ..  math.random()
        dtotal = dtotal - 3
		hub:publish({
			message = {
				action  =  "ping",
				id =mid ,
				timestamp = love.timer.getTime()
			}
		});
		print("ping sent");
   end 
   if (pings > 3) then
   gamestate.switch(game)
   end

end
function connect:draw()
	love.graphics.print("Connecting to the server",20,20)
	 love.graphics.print(txt, 200, 300)
end