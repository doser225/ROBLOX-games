local CenterPiece = game.Workspace:WaitForChild('WallCenter')
local DestroyedGate = game.ServerStorage.WallKick:WaitForChild('DestroyedGate')
local NormalGate = game.Workspace:WaitForChild('NormalGate')
local ColossalTitan = game.ServerStorage.WallKick:WaitForChild('ColossalTitan')
local Explosion = game.ServerStorage.WallKick:WaitForChild('Explosion')
local GateEffects = game.ServerStorage.WallKick:WaitForChild('GateEffects')
local DebrisEffects = game.ServerStorage.WallKick:WaitForChild('DebrisEffects')
local CitySpawns = game.Workspace:WaitForChild('TitanSpawns'):WaitForChild('CitySpawns')
local TitanSpawns = game.Workspace.TitanSpawns
CitySpawns.Parent = game.ServerStorage.WallKick
Debris = game:GetService('Debris')
local TweenService = game:GetService('TweenService')


game.ReplicatedStorage:WaitForChild('WallKickBool').Changed:connect(function()
	-- Transformation Stage
	if game.ReplicatedStorage.WallKickBool.Value == true then
		local TransformSound = Instance.new('Sound', game.Workspace)
		TransformSound.SoundId = 'rbxassetid://3673187353'
		Debris:AddItem(TransformSound, TransformSound.TimeLength * 0.8)
		TransformSound:Play()
		
		local Ball = Instance.new('Part', workspace)
		Ball.Shape = 'Ball'
		Ball.Anchored = true
		Ball.CanCollide = false
		Ball.Color = Color3.fromRGB(239, 223, 0)
		Ball.Material = Enum.Material.Neon
		local PointLight = Instance.new('PointLight', Ball)
		PointLight.Color = Color3.fromRGB(239, 223, 0)
		PointLight.Range = 1000
		Ball.Size = Vector3.new(200,200,200)
		Ball.Position = Vector3.new(1673.613, 148.289, -516.23)
		
		game.Lighting.Ambient = Color3.fromRGB(251, 255, 0)
		game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 247, 0)
		--Explosion.Parent = game.Workspace
		local Tween = TweenService:Create(Ball, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {['Size'] = Vector3.new(300,300,300), ['Transparency'] = 1})
		Tween:Play()
		local Bolts = {}
		local BoltsFolder = Instance.new('Folder', game.Workspace)
		BoltsFolder.Name = 'BoltsFolder'
		spawn(function()
			for num = 1,100 do
				if num % 2 == 0 then
					BoltsFolder:ClearAllChildren()
				end
				local C = game.ServerStorage.WallKick.Lightning:Clone()
				Debris:AddItem(C, 0.1)
				C.Parent = BoltsFolder
				local _,CSize = C:GetBoundingBox()
				C:SetPrimaryPartCFrame(Ball.CFrame * CFrame.new(math.random(-100,100),-300,math.random(-100,100)) * CFrame.Angles(0,math.rad(math.random(-360,360)),0))
				table.insert(Bolts, C)
				wait(0.05)
			end
		end)
		
		--[[spawn(function()
			while #Bolts > 0 do
				pcall(function()
					wait()
					print('Bolting')
					for num,Bolt in ipairs(Bolts) do
						Bolt:SetPrimaryPartCFrame(Bolt.PrimaryPart.CFrame * CFrame.Angles(0,math.rad(math.random(1,360)),0))
					end
				end)
			end
		end)]]
		Tween.Completed:Wait()
		Ball:Destroy()
		ColossalTitan.Parent = game.Workspace
		game.Lighting.Ambient = Color3.fromRGB(79, 73, 62)
		game.Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
		
		--DESTRUCTION STAGE
		
		ColossalTitan.Humanoid:LoadAnimation(game.ServerStorage.WallKick:WaitForChild('KickAnimation')):Play()
		wait(186/30)
		--wait(40/30)
		GateEffects.Parent = game.Workspace
		NormalGate.Parent = game.ServerStorage.WallKick
		DestroyedGate.Parent = game.Workspace
		DestroyedGate:SetPrimaryPartCFrame(CenterPiece.CFrame)
		-- DEBRIS STAGE
		spawn(function()
			local function lerp(a, b, c)
				return a + (b - a) * c
			end
			local function quadBezier(t, p0, p1, p2)
				local l1 = lerp(p0, p1, t)
				local l2 = lerp(p1, p2, t)
				local quad = lerp(l1, l2, t)
				return quad
			end
			
			local C = DebrisEffects:Clone()
			Debris:AddItem(C, 150)
			C.Parent = game.Workspace
			for num,Deb in ipairs(C:GetChildren()) do
				if Deb.Name ~= 'StartKick' then
					local YForce = 0
					for num,Part in ipairs(Deb:GetDescendants()) do
						if Part:IsA('BasePart') then
							YForce = YForce + Part:GetMass()
						end
					end
					Deb.PrimaryPart.BodyAngularVelocity.AngularVelocity = Vector3.new(YForce/2 * math.random(-1,1), YForce/2 * math.random(-1,1), YForce/2 * math.random(-1,1))
					Deb.PrimaryPart.BodyAngularVelocity.AngularVelocity = Vector3.new(500 * math.random(-1, 1), 500 * math.random(-1, 1), 500 * math.random(-1, 1))
					Deb.PrimaryPart.BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					Deb.PrimaryPart.BodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				end
			end
			for num = 1,100 do
				local t = num/100
				wait(0.05)
				for num,Deb in ipairs(C:GetChildren()) do
					if Deb.Name ~= 'StartKick' then
						Deb.PrimaryPart.BodyPosition.Position = Vector3.new(
							quadBezier(t, C.StartKick.Position.X, Deb.Height.Position.X, Deb.EndKick.Position.X),
							quadBezier(t, C.StartKick.Position.Y, Deb.Height.Position.Y, Deb.EndKick.Position.Y),
							quadBezier(t, C.StartKick.Position.Z, Deb.Height.Position.Z, Deb.EndKick.Position.Z)
						)
					end
				end
			end
			wait(1)
			for num,Deb in ipairs(C:GetChildren()) do
				for num,Part in ipairs(Deb:GetDescendants()) do
					if Part:IsA('BasePart') then
						Part.Anchored = true
					end
				end
			end
		end)
		wait(4)
		for num,Part in ipairs(GateEffects.Explosion1:GetChildren()) do
			if Part.Name == 'dp' then
				GateEffects.Explosion1.dp.Enabled = false
			end
		end
		GateEffects.Smoke.ParticleEmitter.Enabled = true
		wait(10)
		ColossalTitan.Parent = game.ServerStorage.WallKick
		for num,Part in ipairs(GateEffects.Explosion1:GetChildren()) do
			if Part.Name == 'dp' then
				GateEffects.Explosion1.dp.Enabled = true
			end
		end
		GateEffects.Smoke.ParticleEmitter.Enabled = false
		GateEffects.Parent = game.ServerStorage.WallKick
		
		CitySpawns.Parent = TitanSpawns
	else
		NormalGate.Parent = game.Workspace
		DestroyedGate.Parent = game.ServerStorage.WallKick
		GateEffects.Parent = game.ServerStorage.WallKick
		CitySpawns.Parent = game.ServerStorage.WallKick
	end
end)

--!! temp
wait(40)
game.ReplicatedStorage.WallKickBool.Value = not game.ReplicatedStorage.WallKickBool.Value

while wait(300) do
	game.ReplicatedStorage.WallKickBool.Value = not game.ReplicatedStorage.WallKickBool.Value
	wait(500)
end
