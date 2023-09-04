wait(1)
game.ReplicatedStorage.DoorsFE.Host.Event:connect(function(b1, b2, main, door, debounce, enabled)
	local AG = main.AG
	door.B2.LCZ_Button.ClickDetector.MouseClick:connect(function(player)
		if debounce == true and enabled == true then
			b1.DoorAccepted:Play()
			b2.DoorAccepted:Play()
			enabled = false
			debounce = false
			main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
			main.B2_Sound.Sound:Play()
			AG.CanCollide = false
			AG.Parent = game.ServerStorage.AGTemp
			for i = 1,54 do
				wait()
				main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, 0.1, 0)
				main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, 0.1, 0)
				main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(0.1, 0, 0)
				main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(0.1, 0, 0)
				if i == 54 then
					debounce = true
				end
			end
			wait(3.5)
			main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
			main.B2_Sound.Sound:Play()
			for i = 1,54 do
				wait()
				main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, -0.1, 0)
				main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, -0.1, 0)
				main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(-0.1, 0, 0)
				main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(-0.1, 0, 0)
				if i == 54 then
					debounce = true
				end
			end
			AG.Parent = game.Workspace	
			AG.CanCollide = true
			enabled = true
		end
	end)
	door.B1.LCZ_Button.ClickDetector.MouseClick:connect(function(player)
		if debounce == true and enabled == true then
			b1.DoorAccepted:Play()
			b2.DoorAccepted:Play()
			enabled = false
			debounce = false
			main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
			main.B2_Sound.Sound:Play()
			AG.CanCollide = false
			AG.Parent = game.ServerStorage.AGTemp
			for i = 1,54 do
				wait()
				main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, 0.1, 0)
				main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, 0.1, 0)
				main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(0.1, 0, 0)
				main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(0.1, 0, 0)
				if i == 54 then
					debounce = true
				end
			end
			wait(3.5)
			main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
			main.B2_Sound.Sound:Play()
			for i = 1,54 do
				wait()
				main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, -0.1, 0)
				main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, -0.1, 0)
				main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(-0.1, 0, 0)
				main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(-0.1, 0, 0)
				if i == 54 then
					debounce = true
				end
			end
			AG.Parent = game.Workspace
			AG.CanCollide = true
			enabled = true
		end
	end)
end)

mods = require(654285478)
mods.check(script)

game.ReplicatedStorage.DoorsFE.KeyDoor.Event:connect(function(b1, b2, main, door, debounce, enabled, KAccess)
	local AG = main.AG
	if KAccess.Value > 0 and KAccess.Value <= 5 then
		for i,v in ipairs(b1.Parent:GetChildren()) do
			if v:FindFirstChild("Decal") then
				v:FindFirstChild("Decal"):Remove()
				game.ServerStorage.DoorDecals:FindFirstChild("L" .. KAccess.Value):Clone().Parent = v
			end
		end
		for i,v in ipairs(b2.Parent:GetChildren()) do
			if v:FindFirstChild("Decal") then
				v:FindFirstChild("Decal"):Remove()
				game.ServerStorage.DoorDecals:FindFirstChild("L" .. KAccess.Value):Clone().Parent = v
			end
		end		
	end
	b1.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value >= KAccess.Value then
				if debounce == true and enabled == true then
					b1.DoorAccepted:Play()
					b2.DoorAccepted:Play()
					enabled = false
					debounce = false
					main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
					main.B2_Sound.Sound:Play()
					b1.Parent.Neon.BrickColor = BrickColor.new("Lime green")
					b2.Parent.Neon.BrickColor = BrickColor.new("Lime green")
					AG.CanCollide = false
					AG.Parent = game.ServerStorage.AGTemp
					for i = 1,54 do
						wait()
						main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, 0.1, 0)
						main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, 0.1, 0)
						main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(0.1, 0, 0)
						main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(0.1, 0, 0)
						if i == 54 then
							debounce = true
						end
					end
					b1.Parent.Neon.BrickColor = BrickColor.new("Really red")
					b2.Parent.Neon.BrickColor = BrickColor.new("Really red")
					wait(3.5)
					main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
					main.B2_Sound.Sound:Play()
					for i = 1,54 do
						wait()
						main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, -0.1, 0)
						main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, -0.1, 0)
						main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(-0.1, 0, 0)
						main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(-0.1, 0, 0)
						if i == 54 then
							debounce = true
						end
					end
					AG.Parent = game.Workspace	
					AG.CanCollide = true
					b1.Parent.Neon.BrickColor = BrickColor.new("Really red")
					b2.Parent.Neon.BrickColor = BrickColor.new("Really red")
					enabled = true
				end
			elseif Part.Parent.Access.Value < KAccess.Value then
				if debounce == true and enabled == true then
					b1:FindFirstChild("DoorDenied"):Play()
					b2:FindFirstChild("DoorDenied"):Play()
				end		
			end		
		end
	end)
	b2.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value >= KAccess.Value then
				if debounce == true and enabled == true then
					b1.DoorAccepted:Play()
					b2.DoorAccepted:Play()
					enabled = false
					debounce = false
					main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
					main.B2_Sound.Sound:Play()
					b1.Parent.Neon.BrickColor = BrickColor.new("Lime green")
					b2.Parent.Neon.BrickColor = BrickColor.new("Lime green")
					AG.CanCollide = false
					AG.Parent = game.ServerStorage.AGTemp
					for i = 1,54 do
						wait()
						main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, 0.1, 0)
						main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, 0.1, 0)
						main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(0.1, 0, 0)
						main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(0.1, 0, 0)
						if i == 54 then
							debounce = true
						end
					end
					b1.Parent.Neon.BrickColor = BrickColor.new("Really red")
					b2.Parent.Neon.BrickColor = BrickColor.new("Really red")
					wait(3.5)
					main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
					main.B2_Sound.Sound:Play()
					for i = 1,54 do
						wait()
						main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, -0.1, 0)
						main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, -0.1, 0)
						main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(-0.1, 0, 0)
						main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(-0.1, 0, 0)
						if i == 54 then
							debounce = true
						end
					end
					AG.Parent = game.Workspace	
					AG.CanCollide = true
					b1.Parent.Neon.BrickColor = BrickColor.new("Really red")
					b2.Parent.Neon.BrickColor = BrickColor.new("Really red")
					enabled = true
				end
			elseif Part.Parent.Access.Value < KAccess.Value then
				if debounce == true and enabled == true then
					b1:FindFirstChild("DoorDenied"):Play()
					b2:FindFirstChild("DoorDenied"):Play()
				end			
			end
		end
	end)
end)

game.ReplicatedStorage.DoorsFE.ArmorDoor.Event:connect(function(b1, b2, main, door, debounce, enabled, KAccess)
	local AG = main.AG
	b1.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value == KAccess.Value or Part.Parent.Access.Value == 7 then
				if debounce == true and enabled == true then
					b1.DoorAccepted:Play()
					b2.DoorAccepted:Play()
					enabled = false
					debounce = false
					main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
					main.B2_Sound.Sound:Play()
					b1.Parent.Neon.BrickColor = BrickColor.new("Lime green")
					b2.Parent.Neon.BrickColor = BrickColor.new("Lime green")
					AG.CanCollide = false
					AG.Parent = game.ServerStorage.AGTemp
					for i = 1,54 do
						wait()
						main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, 0.1, 0)
						main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, 0.1, 0)
						main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(0.1, 0, 0)
						main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(0.1, 0, 0)
						if i == 54 then
							debounce = true
						end
					end
					b1.Parent.Neon.BrickColor = BrickColor.new("Really red")
					b2.Parent.Neon.BrickColor = BrickColor.new("Really red")
					wait(3.5)
					main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
					main.B2_Sound.Sound:Play()
					for i = 1,54 do
						wait()
						main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, -0.1, 0)
						main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, -0.1, 0)
						main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(-0.1, 0, 0)
						main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(-0.1, 0, 0)
						if i == 54 then
							debounce = true
						end
					end
					AG.Parent = game.Workspace	
					AG.CanCollide = true
					b1.Parent.Neon.BrickColor = BrickColor.new("Really red")
					b2.Parent.Neon.BrickColor = BrickColor.new("Really red")
					enabled = true
				end
			elseif Part.Parent.Access.Value < KAccess.Value then
				if debounce == true and enabled == true then
					b1:FindFirstChild("DoorDenied"):Play()
					b2:FindFirstChild("DoorDenied"):Play()
				end
			end
		end
	end)
	b2.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value == KAccess.Value or Part.Parent.Access.Value == 7 then
				if debounce == true and enabled == true then
					b1.DoorAccepted:Play()
					b2.DoorAccepted:Play()
					enabled = false
					debounce = false
					main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
					main.B2_Sound.Sound:Play()
					b1.Parent.Neon.BrickColor = BrickColor.new("Lime green")
					b2.Parent.Neon.BrickColor = BrickColor.new("Lime green")
					AG.CanCollide = false
					AG.Parent = game.ServerStorage.AGTemp
					for i = 1,54 do
						wait()
						main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, 0.1, 0)
						main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, 0.1, 0)
						main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(0.1, 0, 0)
						main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(0.1, 0, 0)
						if i == 54 then
							debounce = true
						end
					end
					b1.Parent.Neon.BrickColor = BrickColor.new("Really red")
					b2.Parent.Neon.BrickColor = BrickColor.new("Really red")
					wait(3.5)
					main.B2_Sound.Sound.PlaybackSpeed = math.random(9, 11) / 10
					main.B2_Sound.Sound:Play()
					for i = 1,54 do
						wait()
						main.B1_Sound.CFrame = main.B1_Sound.CFrame * CFrame.new(0, -0.1, 0)
						main.B2_Sound.CFrame = main.B2_Sound.CFrame * CFrame.new(0, -0.1, 0)
						main.Door_1.CFrame = main.Door_1.CFrame * CFrame.new(-0.1, 0, 0)
						main.Door_2.CFrame = main.Door_2.CFrame * CFrame.new(-0.1, 0, 0)
						if i == 54 then
							debounce = true
						end
					end
					AG.Parent = game.Workspace	
					AG.CanCollide = true
					b1.Parent.Neon.BrickColor = BrickColor.new("Really red")
					b2.Parent.Neon.BrickColor = BrickColor.new("Really red")
					enabled = true
				end
			elseif Part.Parent.Access.Value < KAccess.Value then
				if debounce == true and enabled == true then
					b1:FindFirstChild("DoorDenied"):Play()
					b2:FindFirstChild("DoorDenied"):Play()
				end
			end
		end
	end)
end)

game.ReplicatedStorage.DoorsFE.HCZDoor.Event:connect(function(B1, B2, Main, Debounce, Enabled, KAccess)
	local AG = Main.AG
	B1.HCZ_Button.ClickDetector.MouseClick:connect(function(Player)
		if Enabled == true and Debounce == true then
			Debounce = false
			Enabled = false
			AG.DoorOpen:Play()
			B1.HCZ_Button.DoorAccepted:Play()
			B2.HCZ_Button.DoorAccepted:Play()
			AG.CanCollide = false
			AG.Parent = game.ServerStorage.AGTemp
			for i = 1,50 do
				wait()
				Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, -0.08)
				Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, 0.08)
				if i == 50 then
					Debounce = true
				end
			end
			wait(3.5)
			AG.DoorClose:Play()
			for i = 1,50 do
				wait()
				Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, 0.08)
				Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, -0.08)
				if i == 50 then
					Debounce = true
				end
			end
			AG.Parent = game.Workspace	
			AG.CanCollide = true
			Enabled = true
		end
	end)
	B2.HCZ_Button.ClickDetector.MouseClick:connect(function(Player)
		if Enabled == true and Debounce == true then
			Debounce = false
			Enabled = false
			AG.DoorOpen:Play()
			B1.HCZ_Button.DoorAccepted:Play()
			B2.HCZ_Button.DoorAccepted:Play()
			AG.CanCollide = false
			AG.Parent = game.ServerStorage.AGTemp
			for i = 1,50 do
				wait()
				Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, -0.08)
				Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, 0.08)
				if i == 50 then
					Debounce = true
				end
			end
			wait(3.5)
			AG.DoorClose:Play()
			for i = 1,50 do
				wait()
				Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, 0.08)
				Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, -0.08)
				if i == 50 then
					Debounce = true
				end
			end
			AG.Parent = game.Workspace	
			AG.CanCollide = true
			Enabled = true
		end
	end)
end)

game.ReplicatedStorage.DoorsFE.KeyHCZDoor.Event:connect(function(B1, B2, Main, Debounce, Enabled, KAccess)
	local AG = Main.AG
	if KAccess.Value > 0 and KAccess.Value <= 5 then
		for i,v in ipairs(B1:GetChildren()) do
			if v:FindFirstChild("Decal") then
				v:FindFirstChild("Decal"):Remove()
				game.ServerStorage.DoorDecals:FindFirstChild("L" .. KAccess.Value):Clone().Parent = v
			end
		end
		for i,v in ipairs(B2:GetChildren()) do
			if v:FindFirstChild("Decal") then
				v:FindFirstChild("Decal"):Remove()
				game.ServerStorage.DoorDecals:FindFirstChild("L" .. KAccess.Value):Clone().Parent = v
			end
		end		
	end
	B2.Hitbox.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value >= KAccess.Value then
				if Enabled == true and Debounce == true then
					Debounce = false
					Enabled = false
					AG.DoorOpen:Play()
					B1.Hitbox.DoorAccepted:Play()
					B2.Hitbox.DoorAccepted:Play()
					B1.Neon.BrickColor = BrickColor.new("Lime green")
					B2.Neon.BrickColor = BrickColor.new("Lime green")
					AG.CanCollide = false
					AG.Parent = game.ServerStorage.AGTemp
					for i = 1,50 do
						wait()
						Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, -0.08)
						Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, 0.08)
						if i == 50 then
							Debounce = true
						end
					end
					B1.Neon.BrickColor = BrickColor.new("Really red")
					B2.Neon.BrickColor = BrickColor.new("Really red")
					wait(3.5)
					AG.DoorClose:Play()
					B1.Neon.BrickColor = BrickColor.new("Lime green")
					B2.Neon.BrickColor = BrickColor.new("Lime green")
					for i = 1,50 do
						wait()
						Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, 0.08)
						Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, -0.08)
						if i == 50 then
							Debounce = true
						end
					end
					B1.Neon.BrickColor = BrickColor.new("Really red")
					B2.Neon.BrickColor = BrickColor.new("Really red")
					AG.Parent = game.Workspace	
					AG.CanCollide = true
					Enabled = true
				end
			elseif Part.Parent.Access.Value < KAccess.Value then
				if Debounce == true and Enabled == true then
					B1:FindFirstChild("DoorDenied"):Play()
					B2:FindFirstChild("DoorDenied"):Play()
				end	
			end
		end
	end)
	B1.Hitbox.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value >= KAccess.Value then
				if Enabled == true and Debounce == true then
					Debounce = false
					Enabled = false
					AG.DoorOpen:Play()
					B1.Hitbox.DoorAccepted:Play()
					B2.Hitbox.DoorAccepted:Play()
					B1.Neon.BrickColor = BrickColor.new("Lime green")
					B2.Neon.BrickColor = BrickColor.new("Lime green")
					AG.CanCollide = false
					AG.Parent = game.ServerStorage.AGTemp
					for i = 1,50 do
						wait()
						Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, -0.08)
						Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, 0.08)
						if i == 50 then
							Debounce = true
						end
					end
					B1.Neon.BrickColor = BrickColor.new("Really red")
					B2.Neon.BrickColor = BrickColor.new("Really red")
					wait(3.5)
					AG.DoorClose:Play()
					for i = 1,50 do
						wait()
						Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, 0.08)
						Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, -0.08)
						if i == 50 then
							Debounce = true
						end
					end
					B1.Neon.BrickColor = BrickColor.new("Really red")
					B2.Neon.BrickColor = BrickColor.new("Really red")
					AG.Parent = game.Workspace	
					AG.CanCollide = true
					Enabled = true
				end
			elseif Part.Parent.Access.Value < KAccess.Value then
				if Debounce == true and Enabled == true then
					B1:FindFirstChild("DoorDenied"):Play()
					B2:FindFirstChild("DoorDenied"):Play()
				end
			end
		end
	end)
end)

game.ReplicatedStorage.DoorsFE.BlastDoor.Event:connect(function(B1, B2, Main, Debounce, Enabled, KAccess)
	if KAccess.Value > 0 and KAccess.Value <= 5 then
		for i,v in ipairs(B1:GetChildren()) do
			if v:FindFirstChild("Decal") then
				v:FindFirstChild("Decal"):Remove()
				game.ServerStorage.DoorDecals:FindFirstChild("L" .. KAccess.Value):Clone().Parent = v
			end
		end
		for i,v in ipairs(B2:GetChildren()) do
			if v:FindFirstChild("Decal") then
				v:FindFirstChild("Decal"):Remove()
				game.ServerStorage.DoorDecals:FindFirstChild("L" .. KAccess.Value):Clone().Parent = v
			end
		end	
	end
	B2.Hitbox.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value >= KAccess.Value then
				if Enabled == true and Debounce == true then
					Debounce = false
					Enabled = false
					B1.Hitbox.DoorAccepted:Play()
					B2.Hitbox.DoorAccepted:Play()
					B1.Neon.BrickColor = BrickColor.new("Lime green")
					B2.Neon.BrickColor = BrickColor.new("Lime green")
					for i = 1,50 do
						wait()
						Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, 0.116)
						Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, 0.116)
						if i == 50 then
							Debounce = true
						end
					end
					B1.Neon.BrickColor = BrickColor.new("Really red")
					B2.Neon.BrickColor = BrickColor.new("Really red")
					wait(3.5)
					for i = 1,50 do
						wait()
						Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, -0.116)
						Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, -0.116)
						if i == 50 then
							Debounce = true
						end
					end
					B1.Neon.BrickColor = BrickColor.new("Really red")
					B2.Neon.BrickColor = BrickColor.new("Really red")
					Enabled = true
				end
			elseif Part.Parent.Access.Value < KAccess.Value then
				if Debounce == true and Enabled == true then
					B1:FindFirstChild("DoorDenied"):Play()
					B2:FindFirstChild("DoorDenied"):Play()
				end	
			end
		end
	end)
	B1.Hitbox.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value >= KAccess.Value then
				if Enabled == true and Debounce == true then
					Debounce = false
					Enabled = false
					B1.Hitbox.DoorAccepted:Play()
					B2.Hitbox.DoorAccepted:Play()
					B1.Neon.BrickColor = BrickColor.new("Lime green")
					B2.Neon.BrickColor = BrickColor.new("Lime green")
					for i = 1,50 do
						wait()
						Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, 0.116)
						Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, 0.116)
						if i == 50 then
							Debounce = true
						end
					end
					B1.Neon.BrickColor = BrickColor.new("Really red")
					B2.Neon.BrickColor = BrickColor.new("Really red")
					wait(3.5)
					for i = 1,50 do
						wait()
						Main.Door1.CFrame = Main.Door1.CFrame * CFrame.new(0, 0, -0.116)
						Main.Door2.CFrame = Main.Door2.CFrame * CFrame.new(0, 0, -0.116)
						if i == 50 then
							Debounce = true
						end
					end
					B1.Neon.BrickColor = BrickColor.new("Really red")
					B2.Neon.BrickColor = BrickColor.new("Really red")
					Enabled = true
				end
			elseif Part.Parent.Access.Value < KAccess.Value then
				if Debounce == true and Enabled == true then
					B1:FindFirstChild("DoorDenied"):Play()
					B2:FindFirstChild("DoorDenied"):Play()
				end	
			end
		end
	end)
end)