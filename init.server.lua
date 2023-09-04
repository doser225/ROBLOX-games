Bans = game:GetService("DataStoreService"):GetDataStore("NewBansFromDoser")
	BanReason = game:GetService("DataStoreService"):GetDataStore("BanReason")
	if Admins == nil then
		Admins = {"doser225"}
	end
	local Ranks = {'Head Developer'}
	game.Players.PlayerAdded:connect(function(Player)
		if Bans:GetAsync(Player.Name) == "Banned!" or Bans:GetAsync(Player.UserId) == "Banned!" then
			local Bannable = true
			for b,Admin in ipairs(Admins) do
				if Player.Name == Admin then
					Bannable = false
				end
			end
			for g,Rank in ipairs(Ranks) do
				if Player:GetRoleInGroup(5403474) == Rank then
					Bannable = false
				end
			end
			if Bannable == true then
				Player:Kick("You've been permabanned!")
			end
		end
		Player.Chatted:connect(function(Message)
			local Enabled = false
			for b,Admin in ipairs(Admins) do
				if Player.Name == Admin then
					Enabled = true
				end
			end
			for g,Rank in ipairs(Ranks) do
				if Player:GetRoleInGroup(5403474) == Rank then
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
								if v:GetRoleInGroup(5403474) == Rank then
									Bannable = false
								end
							end
							if v ~= Player and Bannable == true then
								Bans:SetAsync(v.UserId, "Banned!")
								local BanReason = script.BanReason:Clone()
								BanReason.Center.TextLabel.Text = "Reason for banning " .. v.Name .. "?"
								BanReason.Center.NameValue.Value = v.UserId
								BanReason.Center.BannedId.Value = v.UserId
								BanReason.Parent = Player.PlayerGui
								v:Kick("You've been permabanned!")
							end
						end
					end
				end
				if string.sub(Message, 1, 12) == "$offlineban " then
					Bans:SetAsync(string.sub(Message, 13, #Message), "Banned!")
					local BanReason = script.BanReason:Clone()
					BanReason.Center.TextLabel.Text = "Reason for banning " .. string.sub(Message, 13, #Message) .. "?"
					BanReason.Center.NameValue.Value = string.sub(Message, 13, #Message)
					BanReason.Parent = Player.PlayerGui
				end
				if string.sub(Message, 1, 7) == "$idban " then
					Bans:SetAsync(tostring(string.sub(Message, 8, #Message)), "Banned!")
					local BanReason = script.BanReason:Clone()
					BanReason.Center.TextLabel.Text = "Reason for banning " .. string.sub(Message, 8, #Message) .. "?"
					BanReason.Center.NameValue.Value = string.sub(Message, 8, #Message)
					BanReason.Center.BannedId.Value = string.sub(Message, 8, #Message)
					BanReason.Parent = Player.PlayerGui
				end
				if string.sub(Message, 1, 9) == "$unidban " then
					if Bans:GetAsync(tostring(string.sub(Message, 10, #Message))) == "Banned!" then
						Bans:SetAsync(tostring(string.sub(Message, 10, #Message)), "Unbanned!")
					end
				end
				if string.sub(Message, 1, 7) == "$unban " then
					if Bans:GetAsync(tostring(string.sub(Message, 8, #Message))) == "Banned!" then
						Bans:SetAsync(tostring(string.sub(Message, 8, #Message)), "Unbanned!")
					end
				end
				if string.sub(Message, 1, 10) == "$checkban " then
					local CheckBan = script.CheckBan:Clone()
					CheckBan.Center.PlayerName.Text = "USER: " .. string.sub(Message, 11, #Message) .. " STATUS: " .. Bans:GetAsync(tostring(string.sub(Message, 11, #Message)))
					CheckBan.Center.PlayerName.BanReason.Text = BanReason:GetAsync(tostring(string.sub(Message, 11, #Message)))
					CheckBan.Center.LocalScript.Disabled = false
					CheckBan.Parent = Player.PlayerGui
				end
			end
		end)
	end)
	local BanFolder = Instance.new("Folder", game.ReplicatedStorage)
	BanFolder.Name = "PlayerBansFE"
	local RemoteEvent = Instance.new("RemoteEvent", BanFolder)
	RemoteEvent.Name = "SubmitReason"
	RemoteEvent.OnServerEvent:connect(function(Player, Reason, Banned)
		BanReason:SetAsync(Banned, Player.Name .. " banned " .. Banned .. " for reason: " .. Reason)
	end)
	print("PlayerBans created by doser225 have loaded fully")