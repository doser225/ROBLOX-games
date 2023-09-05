local module = {}

module.GunKit = function()
	game.ReplicatedStorage.GunFE.WeldArm.OnServerEvent:connect(function(Player, RArm, Tool)
		if Tool ~= nil and Tool:FindFirstChild("GunScript") then
			local Weld = Instance.new("ManualWeld", Player.Character["Right Arm"])
			RArm.CFrame = Player.Character["Right Arm"].CFrame
			RArm.Transparency = 1
			--[[ToolRemove = Tool.Unequipped:connect(function()
				Weld:Destroy()
				ToolRemove:Disconnect()
			end)]]
			Weld.Part0 = RArm
			Weld.Part1 = Player.Character["Right Arm"]
			Weld.C0 = RArm.CFrame
			Weld.C1 = Player.Character["Right Arm"].CFrame
		end
	end)
	
	game.ReplicatedStorage.GunFE.Flashlight.OnServerEvent:connect(function(Player, Light, Switch)
		if Switch == true then
			if Light.Parent.Name == "BPoint" then
				Light.Enabled = true
			end
		elseif Switch == false then
			if Light.Parent.Name == "BPoint" then
				Light.Enabled = true
			end
		end
	end)
	
	game.ReplicatedStorage.GunFE.FlashlightCustom.OnServerEvent:connect(function(Player, FlashlightColor, FlashlightBrightness, FlashlightRange, Tool)
		Tool.LightPoint.SurfaceLight.Color = FlashlightColor
		Tool.LightPoint.SurfaceLight.Brightness = FlashlightBrightness
		Tool.LightPoint.SurfaceLight.Range = FlashlightRange
	end)
	
	--[[game.ReplicatedStorage.GunFE.AnimationLoad.OnServerEvent:connect(function(Player, Remote, Animation)
		Remote:FireAllClients(Player, Animation)
	end)]]
	
	game.ReplicatedStorage.GunFE.Shoot.OnServerEvent:connect(function(Player, Raycast, Part, Position, Distance, BPointPos, Damage, ShellEject, MuzzleF, Tool, ServerBullet, Spread)
		if Tool ~= nil then
			local Bullet = game.ServerStorage.Bullet:Clone()
			game:GetService('Debris'):AddItem(Bullet, 0.05)
			Bullet.Size = Vector3.new(0.1, 0.1, Distance)
			Bullet.Parent = game.Workspace
			Bullet.CFrame = CFrame.new(BPointPos, Vector3.new(Position.X + Spread[1], Position.Y + Spread[2], Position.Z + Spread[3])) * CFrame.new(0, 0, -Distance / 2)
			local Shell = ShellEject.Shell:Clone()
			game:GetService('Debris'):AddItem(Shell, 2)
			Shell.Weld:Remove()
			Shell.CFrame = ShellEject.CFrame
			Shell.Transparency = 0
			Shell.Anchored = false
			Shell.Parent = game.Workspace
			if Part ~= nil and Part ~= "HumanoidRootPart" then
				if Part.Parent ~= nil and Part.Parent:FindFirstChild("Humanoid") then
					if Part.Name == "Head" then
						Part.Parent:FindFirstChild("Humanoid").Health = Part.Parent:FindFirstChild("Humanoid").Health - Damage * 2
					elseif Part.Name == "Torso" then
						Part.Parent:FindFirstChild("Humanoid").Health = Part.Parent:FindFirstChild("Humanoid").Health - Damage * 0.7
					else
						Part.Parent:FindFirstChild("Humanoid").Health = Part.Parent:FindFirstChild("Humanoid").Health - Damage
					end
					if Part.Parent:FindFirstChild("DamageEvent") then
						Part.Parent:FindFirstChild("DamageEvent"):Fire(Damage)
					end
				elseif Part.Parent.Parent ~= nil and Part.Parent.Parent:FindFirstChild("Humanoid") then
					if Part.Name == "Head" then
						Part.Parent.Parent:FindFirstChild("Humanoid").Health = Part.Parent.Parent:FindFirstChild("Humanoid").Health - Damage * 2
					elseif Part.Name == "Torso" then
						Part.Parent.Parent:FindFirstChild("Humanoid").Health = Part.Parent.Parent:FindFirstChild("Humanoid").Health - Damage * 0.7
					else
						Part.Parent.Parent:FindFirstChild("Humanoid").Health = Part.Parent.Parent:FindFirstChild("Humanoid").Health - Damage - Damage
					end
					if Part.Parent.Parent:FindFirstChild("DamageEvent") then
						Part.Parent.Parent:FindFirstChild("DamageEvent"):Fire(Damage)
					end
				elseif Part.Parent.Parent.Parent ~= nil  and Part.Parent.Parent.Parent:FindFirstChild("Humanoid") then
					if Part.Name == "Head" then
						Part.Parent.Parent.Parent:FindFirstChild("Humanoid").Health = Part.Parent.Parent.Parent:FindFirstChild("Humanoid").Health - Damage * 2
					elseif Part.Name == "Torso" then
						Part.Parent.Parent.Parent:FindFirstChild("Humanoid").Health = Part.Parent.Parent.Parent:FindFirstChild("Humanoid").Health - Damage * 0.7
					else
						Part.Parent.Parent.Parent:FindFirstChild("Humanoid").Health = Part.Parent.Parent.Parent:FindFirstChild("Humanoid").Health - Damage
					end
					if Part.Parent.Parent.Parent:FindFirstChild("DamageEvent") then
						Part.Parent.Parent.Parent:FindFirstChild("DamageEvent"):Fire(Damage)
					end
				end
			end
			MuzzleF.Enabled = true
			MuzzleF.Parent.MuzzleLight.Enabled = true
			ServerBullet:FireClient(Player, Bullet, MuzzleF, Shell)
			wait(0.1)
			MuzzleF.Parent.MuzzleLight.Enabled = false
			MuzzleF.Enabled = false
		end
	end)
	
	
	game.ReplicatedStorage.GunFE.SoundPlay.OnServerEvent:connect(function(Player, Sound)
		if Sound.Parent.Name == "RArm" then
			Sound:Play()
		end
	end)
	
	print("ServerSide GunFE loaded created by doser225")
end

return module
