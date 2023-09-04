local url = "https://discordapp.com/api/webhooks/715934258400854058/igJwJ6A7nAw3hrBFB6nQclqkkF4AIk-XmIkNAqPVXIbX5epFqPF1pRvnUeBBcA3cVLSW" -- Put the Webhook URL you copied in this!
local http = game:GetService("HttpService")

if game:GetService('RunService'):IsStudio() == false then
	game.Players.PlayerAdded:connect(function(Player)
		local HookData = {
			['username'] = "SERVER",
			['content'] = "**" .. Player.Name .. " has joined " .. game.PlaceId .. ". Players online: **" .. #game.Players:GetPlayers()
		}
		HookData = http:JSONEncode(HookData)
		http:PostAsync(url, HookData)
		Player.Chatted:connect(function(Message)
			local HookData = {
				['username'] = "SERVER",
				['content'] = "***" .. Player.Name .. ": " .. "***" .. Message
			}
			HookData = http:JSONEncode(HookData)
			http:PostAsync(url, HookData)
		end)
	end)
	
	game.Players.PlayerRemoving:connect(function(Player)
		local HookData = {
			['username'] = "SERVER",
			['content'] = "**" .. Player.Name .. " has left " .. game.PlaceId .. ". Players online: **" .. #game.Players:GetPlayers()
		}
		HookData = http:JSONEncode(HookData)
		http:PostAsync(url, HookData)
	end)
end
