local HorseFE = Instance.new("Folder", game.ReplicatedStorage)
HorseFE.Name = "HorseFE"
local HorseAnimL = Instance.new("RemoteEvent", HorseFE)
HorseAnimL.Name = "HorseAnimL"
local HorseStart = Instance.new("RemoteEvent", HorseFE)
HorseStart.Name = "HorseStart"
local HorseRun = Instance.new("RemoteEvent", HorseFE)
HorseRun.Name = "HorseRun"
local HorseAnimS = Instance.new("RemoteEvent", HorseFE)
HorseAnimS.Name = "HorseAnimS"
local HorseMount = Instance.new("RemoteEvent", HorseFE)
HorseMount.Name = "HorseMount"
local HorseCall = Instance.new("RemoteFunction", HorseFE)
HorseCall.Name = "HorseCall"
local HorseNoise =  Instance.new("RemoteFunction", HorseFE)
HorseNoise.Name = "HorseNoise"
local Debris = game:GetService('Debris')
local Pathfinding = game:GetService('PathfindingService')

--[[
HORSETYPES:
--Brown
	-Sprint Speed: 37
--Black
	-Sprint Speed: 42
--Grey
	-Sprint Speed: 38 
--Beige
	-Sprint Speed: 40
--Oreo
	-Sprint Speed: 35
--Trusty
	-Sprint Speed: 40
]]

function HorseCall.OnServerInvoke(Player)
	if Player:FindFirstChild('PlayerHorse') then
		if Player.PlayerHorse:FindFirstChild(Player.Name..'MASTER_HORSE') and Player.PlayerHorse:FindFirstChild('Cooldown').Value == 0 then
			Player.Character.Humanoid:LoadAnimation(script.Whistle):Play()
			Player.Character.Humanoid.WalkSpeed = 0
			local Sound = script.WhistleSound:Clone()
			Debris:AddItem(Sound, 1)
			Sound.Parent = Player.Character.Head
			Sound:Play()
			wait(1)
			Player.Character.Humanoid.WalkSpeed = 16
			Player:FindFirstChild('PlayerHorse').Cooldown.Value = 100
			if game.Workspace.Horses:FindFirstChild(Player.Name .. 'MASTER_HORSE') then
				game.Workspace.Horses:FindFirstChild(Player.Name .. 'MASTER_HORSE'):Destroy()
			end
			local PlayerHorse = Player.PlayerHorse[Player.Name .. 'MASTER_HORSE']:Clone()
			PlayerHorse.Parent = game.Workspace.Horses
			-- !!switch to predefined points later!!
			--PlayerHorse:SetPrimaryPartCFrame(game.Workspace.HorseSpawns:GetChildren()[math.random(1,#game.Workspace.HorseSpawns:GetChildren())].CFrame) 
			PlayerHorse:SetPrimaryPartCFrame(Player.Character.PrimaryPart.CFrame * CFrame.new(0,7,-5)) 
			wait(5)
			--local HorsePath = Pathfinding:CreatePath()
			--!! implement different horse speeds
			--[[HorsePath:ComputeAsync(PlayerHorse.PrimaryPart.Position, Player.Character.PrimaryPart.Position)
			PlayerHorse.Humanoid.WalkSpeed = 40
			for num,Points in ipairs(HorsePath:GetWaypoints()) do
				PlayerHorse.Humanoid:MoveTo(Points.Position)
				PlayerHorse.Humanoid.MoveToFinished:Wait()
			end
			PlayerHorse.Humanoid.WalkSpeed = 16]]
			spawn(function()
				for num = 1,100 do
					wait(1)
					Player.PlayerHorse:FindFirstChild('Cooldown').Value = Player.PlayerHorse:FindFirstChild('Cooldown').Value - 1
				end
			end)
		end
	end
end


HorseRun.OnServerEvent:connect(function(Player, HorseHumanoid)
	if HorseHumanoid.Parent.Name == "Horse" or HorseHumanoid.Parent.Name == Player.Name .. "MASTER_HORSE" then
		Player.Character.Humanoid.WalkSpeed = 40
		HorseHumanoid.WalkSpeed = 40
	end
end)

function HorseNoise.OnServerInvoke(Player, Noise)
	local DB = true
	if Noise:FindFirstAncestor('Horse') or Noise:FindFirstAncestor(Player.Name .. 'MASTER_HORSE') and DB == true then
		DB = false
		Noise:Play()
		wait(5)
		DB = true
	end
	return nil
end

-- Possible glitch is primary nils and seat.disabled = true does not execute, use another thread later
HorseMount.OnServerEvent:connect(function(Player, Horse)
	if Horse.Name == Player.Name..'MASTER_HORSE' or Horse.Name == 'Horse' then
		local Distance = (Player.Character.HumanoidRootPart.Position - Horse.HumanoidRootPart.Position).magnitude
		if Distance < 15 and Horse.Seat.Occupant == nil then
			Horse.Seat:Sit(Player.Character.Humanoid)
			for num,Part in ipairs(Horse:GetDescendants()) do
				if Part:IsA('BasePart') then
					Part:SetNetworkOwner(Player)
				end
			end
		end
	end
	if Horse.Name == "Cannon" then
		local Distance = (Player.Character.HumanoidRootPart.Position - Horse.Seat.Position).magnitude
		if Distance < 15 and Horse.Seat.Occupant == nil then
			Horse.Seat:Sit(Player.Character.Humanoid)
		end
	end
end)

HorseAnimL.OnServerEvent:connect(function(Player, Horse, Animation)
	if Horse.Parent.Name == "Horse" then
		Horse.Parent.Humanoid:LoadAnimation(Animation):Play()
	end
end)

HorseStart.OnServerEvent:connect(function(Player, Horse, Animation)
	Horse.Humanoid:LoadAnimation(script.HorseIdle1):Play()
	Horse.Humanoid:LoadAnimation(Animation):Stop()
	for num,Part in ipairs(Horse.Parent:GetChildren()) do
		if Part.ClassName == 'UnionOperation' or Part.ClassName == 'Part' or Part.ClassName == 'MeshPart' then	
			Part:SetNetworkOwner(Player)
		end
	end
end)

HorseAnimS.OnServerEvent:connect(function(Player,Horse,Animation)
	--Horse.Humanoid:LoadAnimation(Animation):Stop()
	if Horse.Parent.Name == 'Horse' then
		Player.Character.Humanoid.WalkSpeed = 16
		Horse.WalkSpeed = 16
	end
	--[[for num,Anim in ipairs(Horse.Humanoid:GetPlayingAnimationTracks()) do
		if Anim.Name == "Running" then
			Anim:Stop()
		end
	end]]
end)