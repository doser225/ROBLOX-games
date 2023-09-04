local url = "https://discordapp.com/api/webhooks/334008815445868572/cap686ZrIkBh1SLdH5DQJ4qJ5NZDc8pmUH0BXWe7_fLa4QSy4BfySpxBSdjkaGpX2KAf" -- Put the Webhook URL you copied in this!
local http = game:GetService("HttpService")

game.Players.PlayerAdded:connect(function(Player)
	local HookData = {
		['username'] = "SERVER",
		['content'] = "**" .. Player.Name .. " has joined Site-61:RM. Players online: **" .. #game.Players:GetPlayers()
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
		['content'] = "**" .. Player.Name .. " has left Site-61:RM. Players online: **" .. #game.Players:GetPlayers()
	}
	HookData = http:JSONEncode(HookData)
	http:PostAsync(url, HookData)
end)
