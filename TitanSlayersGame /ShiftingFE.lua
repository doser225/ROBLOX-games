-- HORSES
	
	
	local function generateTitan(Player)
		local Titan = script.AttackTitan:Clone()
		Titan.HumanoidRootPart.Stomping:Stop()
		--Titan.Parent = game.Workspace
		local TitanLoaded = Instance.new('NumberValue', Titan)
		TitanLoaded.Name = 'TitanLoaded'
		local Occupied = Instance.new('BoolValue', Titan)
		Occupied.Name = 'Occupied'
		
		local randomScale = math.random(13,15)
		--Titan.Humanoid.WalkSpeed = Titan.Humanoid.WalkSpeed * randomScale
		Titan.Humanoid.WalkSpeed = 20
	
		Titan.Humanoid.BodyWidthScale.Value = randomScale
		Titan.Humanoid.BodyHeightScale.Value = randomScale * 1.3
		Titan.Humanoid.BodyDepthScale.Value = randomScale
		Titan.Humanoid.HeadScale.Value = randomScale
		
		for num,Hair in ipairs(Player.Character:GetChildren()) do
			if Hair.ClassName == 'Hat' or Hair.ClassName == 'Accessory' then
				--local TitanHair = game.ServerStorage.AOTObjects.TitanHair:GetChildren()[math.random(1,#game.ServerStorage.AOTObjects.TitanHair:GetChildren())]:Clone()
				local TitanHair = Hair:Clone()
				--TitanHair.Handle.Color = Color3.fromRGB(math.random(1,255), math.random(1,255), math.random(1,255))
				Titan.Humanoid:AddAccessory(TitanHair)
			end
		end
		
		local randomFace = script.Eyes:GetChildren()[math.random(1,#script.Eyes:GetChildren())]
		randomFace:Clone().Parent = Titan.Head
		local randomMouth = script.Mouths:GetChildren()[math.random(1,#script.Mouths:GetChildren())]
		randomMouth:Clone().Parent = Titan.Head
		Titan.Head.TitanHealthUI.Frame.TextLabel.Text = Player.Name .. '[' .. randomScale .. 'm]'
		
		--[[local EyesHolder = Instance.new('Model', Titan)
		EyesHolder.Name = 'EyesHolder'
		local Eyes = Instance.new('Part', EyesHolder)
		Eyes.Transparency = 0.5
		Eyes.CanCollide = false
		Eyes.Size = Vector3.new(1 * randomScale, 0.5 * randomScale, 0.1 * randomScale)
		Eyes.Name = 'Eyes'
		
		local Weld = Instance.new('ManualWeld', Titan.Head)
		Weld.Part0 = Titan.Head
		Weld.Part1 = Eyes
		Weld.C0 = CFrame.new(0,Titan.Head.Size.Y * 0.25, (-Titan.Head.Size.Z/2) - (Eyes.Size.Z/2))
		Weld.C1 = CFrame.new(0,0,0)
		Weld.Name = 'EyesWeld']]
		
		--[[local _,TitanSize = Titan:GetBoundingBox()
		local NapeHolder = Instance.new('Model', Titan)
		local Nape = Instance.new('Part', NapeHolder)
		Nape.CanCollide = false
		Nape.Transparency = 0.5
		Nape.Size = Vector3.new(1 * randomScale, 1 * randomScale,0.3 * randomScale)
		Nape.Name = 'Nape'
		Nape.BrickColor = Titan.Head.BrickColor
		
		local Weld = Instance.new('ManualWeld', Titan.UpperTorso)
		Weld.Part0 = Titan.UpperTorso
		Weld.Part1 = Nape
		Weld.C0 = CFrame.new(0,Titan.UpperTorso.Size.Y/2, (Titan.UpperTorso.Size.Z/2) - (Nape.Size.Z/2))
		Weld.C1 = CFrame.new(0,0,0)
		Weld.Name = 'NapeWeld'
		
		local LWKHold = Instance.new('Model', Titan)
		LWKHold.Name = 'LWKHold'
		local LeftWeakKnee = Instance.new('Part', LWKHold)
		LeftWeakKnee.CanCollide = false
		LeftWeakKnee.Transparency = 0.5
		LeftWeakKnee.Size = Vector3.new(1 * randomScale, 1 * randomScale,0.3 * randomScale)
		LeftWeakKnee.BrickColor = Titan.Head.BrickColor
		LeftWeakKnee.Name = 'LeftWeakKnee'
		
		local Weld = Instance.new('ManualWeld', Titan.LeftUpperLeg)
		Weld.Part0 = Titan.LeftUpperLeg
		Weld.Part1 = LeftWeakKnee
		Weld.C0 = CFrame.new(0,-Titan.LeftUpperLeg.Size.Y/2, (Titan.LeftUpperLeg.Size.Z/2) - (LeftWeakKnee.Size.Z/2))
		Weld.C1 = CFrame.new(0,0,0)
		
		
		local RWKHold = Instance.new('Model', Titan)
		RWKHold.Name = 'RWKHold'
		local RightWeakKnee = Instance.new('Part', RWKHold)
		RightWeakKnee.CanCollide = false
		RightWeakKnee.Transparency = 0.5
		RightWeakKnee.Size = Vector3.new(1 * randomScale, 1 * randomScale,0.3 * randomScale)
		RightWeakKnee.BrickColor = Titan.Head.BrickColor
		RightWeakKnee.Name = 'RightWeakKnee'
		
		local Weld = Instance.new('ManualWeld', Titan.RightUpperLeg)
		Weld.Part0 = Titan.RightUpperLeg
		Weld.Part1 = RightWeakKnee
		Weld.C0 = CFrame.new(0,-Titan.RightUpperLeg.Size.Y/2, (Titan.RightUpperLeg.Size.Z/2) - (RightWeakKnee.Size.Z/2))
		Weld.C1 = CFrame.new(0,0,0)]]
		
		return Titan
	end
	
	
	
	
	
	
	local Folder = Instance.new("Folder", game.ReplicatedStorage)
	Folder.Name = "ShiftingFE"
	local Shift = Instance.new("RemoteEvent", Folder)
	Shift.Name = "Shift"
	local ShiftBack = Instance.new("RemoteEvent", Folder)
	ShiftBack.Name = "ShiftBack"
	
	local TweenService = game:GetService('TweenService')
	
	
	Shift.OnServerEvent:connect(function(Player)
		if _G[Player.Name]['Shifter'] == true then
			local Position = Player.Character.HumanoidRootPart.Position
			local Titan = generateTitan(Player)
			local Sound =  Instance.new("Sound", Player.Character.HumanoidRootPart)
			Sound.SoundId = "rbxassetid://3673187353"
			Sound.Volume = 3
			Sound:Play()
			local LightBall = Instance.new("Part")
			LightBall.Shape = "Ball"
			LightBall.Anchored = true
			LightBall.BrickColor = BrickColor.new("Neon orange")
			LightBall.Material = Enum.Material.Neon
			LightBall.Size = Vector3.new(10, 10, 10)
			LightBall.CanCollide = false
			LightBall.Parent = workspace
			LightBall.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1 , 0)
			local tInfoLB = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 4, true, 0)
			local BallTween = TweenService:Create(LightBall, tInfoLB, {["Size"] = Vector3.new(20, 20, 20)})
			game.Lighting.Ambient = Color3.fromRGB(251, 255, 0)
			game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 247, 0)
			BallTween:Play()
			LightBall.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1 , 0)
			for num,Part in ipairs(Player.Character:GetDescendants()) do
				if Part.ClassName == "Part" or Part.ClassName == "Union" or Part.ClassName == "MeshPart" then
					Part.Transparency = 1
				end
			end
			
			local Height = CFrame.new(0,0,0)
			local Bolts = {}
			for num = 1,5 do
				local Lightning = script.Lightning:Clone()
				Lightning.Parent = game.Workspace
				Lightning:SetPrimaryPartCFrame(Player.Character.HumanoidRootPart.CFrame * Height)
				Height = CFrame.new(0,Height.Y + (3.469 * 10),0)
				table.insert(Bolts,Lightning)
			end
			local Bolting = true
			spawn(function()
				while Bolting == true do
					for num,Bolt in ipairs(Bolts) do
						Bolt.Bolt1:SetPrimaryPartCFrame(Bolt.Bolt1.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(math.random(1,360)),0))
						Bolt.Bolt2:SetPrimaryPartCFrame(Bolt.Bolt2.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(math.random(1,360)),0))
						Bolt.Bolt3:SetPrimaryPartCFrame(Bolt.Bolt3.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(math.random(1,360)),0))
					end
					wait(0.2)
				end
			end)
			wait(2.5)
			Bolting = false
			for num,Bolt in ipairs(Bolts) do
				Bolt:Destroy()
			end
			--BallTween:Stop()
			LightBall:Destroy()
			game.Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
			game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
			Titan.Name = "Titan"..Player.UserId
			Sound.Parent = Titan.HumanoidRootPart
			Titan.Parent = game.Workspace
			Titan:SetPrimaryPartCFrame(Player.Character.PrimaryPart.CFrame * CFrame.new(0, 50, 0))
			Player.Character = Titan
			HumanoidCheck = Player.Character.Humanoid.Changed:connect(function()
				if Player.Character.Humanoid.Health == 0 then
					HumanoidCheck:Disconnect()
					Player:LoadCharacter()
				end
			end)
		end
	end)
	ShiftBack.OnServerEvent:connect(function(Player)
		local OriginalPos = Player.Character.Head.CFrame
		local Clone = Player.Character:Clone()
		
		game:GetService('Debris'):AddItem(Clone, 20)
		Clone.Parent = game.Workspace
		Clone:SetPrimaryPartCFrame(OriginalPos)
		Clone.Humanoid.PlatformStand = true
		Clone.HumanoidRootPart:Destroy()
		local Monster = Clone
		for num,Motor6D in ipairs(Monster:GetDescendants()) do
			if Motor6D:IsA('BasePart') and Motor6D.Name ~= 'Nape' and string.find(Motor6D.Name, 'WeakKnee') == nil then
				Motor6D.CanCollide = true
				Motor6D.Anchored = false
			end
			if Motor6D.ClassName == 'Motor6D' and Motor6D.Name ~= 'Neck' and string.find(Motor6D.Name, 'Wrist') == nil and string.find(Motor6D.Name, 'Ankle') == nil then
				local BallSocket = Instance.new('BallSocketConstraint', Motor6D.Parent)
				local motoName = Motor6D.Name
				local Attachment0 = Motor6D.Parent:FindFirstChild(motoName .. 'Attachment') or Motor6D.Parent:FindFirstChild(motoName .. 'RigAttachment')
				local Attachment1 = Motor6D.Part0:FindFirstChild(motoName .. 'Attachment') or Motor6D.Part0:FindFirstChild(motoName .. 'RigAttachment')
				if Attachment0 and Attachment1 then
					BallSocket.Attachment0 = Attachment0
					BallSocket.Attachment1 = Attachment1
					Motor6D:Destroy()
				end
				--Monster:SetPrimaryPartCFrame(Monster.PrimaryPart.CFrame * CFrame.Angles(math.rad(45),0,0))
			end
		end
		local count = 0
		local BodyParts = {"Foot", "Hand", "Torso", "Arm", "Head", "Leg", "HumanoidRootPart"}
		FullyLoadedChecker = Player.Character.ChildAdded:connect(function(Child)		
			print(Child.Name)	
			for num,Name in ipairs(BodyParts) do
				if string.match(Child.Name, Name) ~= nil then
					print("FOUND A PART")
					count += 1
				end	
			end
			print(count)
			FullyLoadedChecker:Disconnect()
		end)
		Player.Character = nil
		Player:LoadCharacter()
		
		--Player.SkipLoad.Value = true
		local ShiftedBack = Instance.new("CFrameValue", Player)
		ShiftedBack.Name = 'ShiftedBack'
		ShiftedBack.Value = OriginalPos * CFrame.new(0, 0, -5)
	
	
		local ShirtId = Player.CharData:WaitForChild('Shirt')
		local PantsId = Player.CharData:WaitForChild('Pants')
		local HatsId = Player.CharData:WaitForChild('Hair')
		local EyesId = Player.CharData:WaitForChild('Eyes')
		local MouthId = Player.CharData:WaitForChild('Mouth')
		local Items = {ShirtId.Value, PantsId.Value, HatsId.Value, EyesId.Value, MouthId.Value}
		local playerPackage = Player.Character.Humanoid:GetAppliedDescription()
		Player.Character.Humanoid.Health = 0
		playerPackage.Face = 0
		playerPackage.Head = 0
		playerPackage.LeftArm = 0
		playerPackage.LeftLeg = 0
		playerPackage.RightArm = 0
		playerPackage.RightLeg = 0
		playerPackage.Torso = 0
		local PlayerAdd = Player.CharacterAdded
		Player:LoadCharacterWithHumanoidDescription(playerPackage)
		Player:ClearCharacterAppearance()
	
		Player.Character:SetPrimaryPartCFrame(OriginalPos * CFrame.new(0, 0, 5))
		Player.Character:WaitForChild('Humanoid')
		if Player.Character:FindFirstChild('ShirtGraphic') then
			Player.Character.ShirtGraphic:Destroy()
		end
		for num,Article in ipairs(Items) do
			if Article.ClassName == 'Shirt' or Article.ClassName == 'Pants' then
				Article:Clone().Parent = Player.Character
			elseif Article.ClassName == 'Decal' then
				Article:Clone().Parent = Player.Character.Head
			elseif Article.ClassName == 'Accessory' or Article.ClassName == 'Hat' then
				local Clone = Article:Clone()
				Clone.Parent = Player.Character
				Player.Character.Humanoid:AddAccessory(Clone)
			end
		end
		local Clone = game.ServerStorage.UI.ButtonThing:Clone()
		Clone.Parent = Player.PlayerGui
		local Clone = game.ServerStorage.UI.CharInfo:Clone()
		Clone.Parent = Player.PlayerGui
		local Clone = game.ServerStorage.UI.Keybinding:Clone()
		Clone.Parent = Player.PlayerGui
		local Clone = game.ServerStorage.UI.TeamSelection:Clone()
		Clone.Parent = Player.PlayerGui
		local Clone = game.ServerStorage.UI.PlayerInventory:Clone()
		Clone.Parent = Player.PlayerGui
		local Clone = game.ServerStorage.UI.stats:Clone()
		Clone.Parent = Player.PlayerGui
	
		repeat
			wait()
		until count >= 16
	
		for num,Part in ipairs(Player.Character:GetChildren()) do
			spawn(function()
				if Part.ClassName == 'MeshPart' or Part.ClassName == 'Part' and Part.Name ~= 'Hood' then
					cChange = Part.Changed:connect(function(prop)
						if prop == "Color" then
							Part.Color = Color3.fromRGB(244, 179, 148)
							cChange:Disconnect()
						end
					end)
				end
			end)
		end
	end)
