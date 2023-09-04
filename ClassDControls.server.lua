local module = {}

module.CDC = function()
	script = nil
	wait(1)
	
	MASTERDebounce = true
	SystemADB = true
	game.Workspace.CDButtons.Hitbox.Touched:connect(function(Part)
		if Part.Parent:FindFirstChild("Access") then
			if Part.Parent.Access.Value == 0 and SystemADB == true and game.Workspace.CDButtons.SystemA.Value == false then
				SystemADB = false
				game.Workspace.CDButtons.SystemA.Value = true
				game.Workspace.CDButtons.On.Material = Enum.Material.Neon
				game.Workspace.CDButtons.Off.Material = Enum.Material.SmoothPlastic
				wait(1)
				SystemADB = true
				return nil
			elseif Part.Parent.Access.Value == 7 and SystemADB == true and game.Workspace.CDButtons.SystemA.Value == false then
				SystemADB = false
				game.Workspace.CDButtons.SystemA.Value = true
				game.Workspace.CDButtons.On.Material = Enum.Material.Neon
				game.Workspace.CDButtons.Off.Material = Enum.Material.SmoothPlastic
				wait(1)
				SystemADB = true
				return nil
			end
			if Part.Parent.Access.Value == 0 and SystemADB == true and game.Workspace.CDButtons.SystemA.Value == true then
				SystemADB = false
				game.Workspace.CDButtons.SystemA.Value = false
				game.Workspace.CDButtons.On.Material = Enum.Material.SmoothPlastic
				game.Workspace.CDButtons.Off.Material = Enum.Material.Neon
				wait(1)
				SystemADB = true
				return nil
			elseif Part.Parent.Access.Value == 7 and SystemADB == true and game.Workspace.CDButtons.SystemA.Value == true then
				SystemADB = false
				game.Workspace.CDButtons.SystemA.Value = false
				game.Workspace.CDButtons.On.Material = Enum.Material.SmoothPlastic
				game.Workspace.CDButtons.Off.Material = Enum.Material.Neon
				wait(1)
				SystemADB = true
				return nil
			end
		end
	end)
	
	for i,v in ipairs(game.Workspace.CDButtons.CBAButtons:GetChildren()) do
		if v.Name ~= "MASTER" then
			v.On.ClickDetector.MouseClick:connect(function(Player)
				for b,Door in ipairs(game.Workspace.CDoorsA:GetChildren()) do
					if string.sub(v.Name, 2) == string.sub(Door.Name, 6) and Door["Open/Closed"].Value == false and game.Workspace.CDButtons.MASTER.Override.Value == false then
						if Door.Debounce.Value == true or game.Workspace.CDButtons.SystemA.Value == false then
							print("Door is moving")
							return nil
						else
							MASTERDebounce = false
							Door.Debounce.Value = true
							v.On.Material = Enum.Material.Neon
							for i = 1,76 do
								wait()
								Door.CFrame = Door.CFrame * CFrame.new(0, 0.1, 0)
							end
							Door["Open/Closed"].Value = true
							v.On.Material = Enum.Material.SmoothPlastic
							Door.Debounce.Value = false
							MASTERDebounce = true
						end
					end
				end
			end)
			v.Off.ClickDetector.MouseClick:connect(function(Player)
				for b,Door in ipairs(game.Workspace.CDoorsA:GetChildren()) do
					if string.sub(v.Name, 2) == string.sub(Door.Name, 6) and Door["Open/Closed"].Value == true and game.Workspace.CDButtons.MASTER.Override.Value == false then
						if Door.Debounce.Value == true or game.Workspace.CDButtons.SystemA.Value == false then
							print("Door is moving")
							return nil
						else
							MASTERDebounce = false
							Door.Debounce.Value = true
							v.Off.Material = Enum.Material.Neon
							for i = 1,76 do
								wait()
								Door.CFrame = Door.CFrame * CFrame.new(0, -0.1, 0)
							end
							Door["Open/Closed"].Value = false
							v.Off.Material = Enum.Material.SmoothPlastic
							Door.Debounce.Value = false
							MASTERDebounce = true
						end
					end
				end
			end)
		end
	end
	
	for i,v in ipairs(game.Workspace.CDButtons.CBBButtons:GetChildren()) do
		if v.Name ~= "MASTER" then
			v.On.ClickDetector.MouseClick:connect(function(Player)
				for b,Door in ipairs(game.Workspace.CDoorsB:GetChildren()) do
					if string.sub(v.Name, 2) == string.sub(Door.Name, 6) and Door["Open/Closed"].Value == false and game.Workspace.CDButtons.MASTER.Override.Value == false then
						if Door.Debounce.Value == true or game.Workspace.CDButtons.SystemA.Value == false then
							print("Door is moving")
							return nil
						else
							MASTERDebounce = false
							Door.Debounce.Value = true
							v.On.Material = Enum.Material.Neon
							for i = 1,76 do
								wait()
								Door.CFrame = Door.CFrame * CFrame.new(0, 0.1, 0)
							end
							Door["Open/Closed"].Value = true
							v.On.Material = Enum.Material.SmoothPlastic
							Door.Debounce.Value = false
							MASTERDebounce = true
						end
					end
				end
			end)
			v.Off.ClickDetector.MouseClick:connect(function(Player)
				for b,Door in ipairs(game.Workspace.CDoorsB:GetChildren()) do
					if string.sub(v.Name, 2) == string.sub(Door.Name, 6) and Door["Open/Closed"].Value == true and game.Workspace.CDButtons.MASTER.Override.Value == false then
						if Door.Debounce.Value == true or game.Workspace.CDButtons.SystemA.Value == false  then
							print("Door is moving")
							return nil
						else
							MASTERDebounce = false
							Door.Debounce.Value = true
							v.Off.Material = Enum.Material.Neon
							for i = 1,76 do
								wait()
								Door.CFrame = Door.CFrame * CFrame.new(0, -0.1, 0)
							end
							Door["Open/Closed"].Value = false
							v.Off.Material = Enum.Material.SmoothPlastic
							Door.Debounce.Value = false
							MASTERDebounce = true
						end
					end
				end
			end)
		end
	end
	
	game.Workspace.CDButtons.MASTER.On.ClickDetector.MouseClick:connect(function(Player)
		if MASTERDebounce == true then
			if game.Workspace.CDButtons.SystemA.Value == false then
				return nil
			end
			for i,ADoor in ipairs(game.Workspace.CDoorsA:GetChildren()) do
				if ADoor.Debounce.Value == true then
					return nil
				end
			end
			for i,BDoor in ipairs(game.Workspace.CDoorsB:GetChildren()) do
				if BDoor.Debounce.Value == true then
					return nil
				end
			end
			MASTERDebounce = false
			game.Workspace.CDButtons.MASTER.Override.Value = true
			for s = 1,76 do
				for i,ADoor in ipairs(game.Workspace.CDoorsA:GetChildren()) do
					if ADoor["Open/Closed"].Value == false then
						ADoor.CFrame = ADoor.CFrame * CFrame.new(0, 0.1, 0)
						ADoor.Debounce.Value = true
					end
					if s == 76 then
						ADoor["Open/Closed"].Value = true
						ADoor.Debounce.Value = false
					end
				end
				for i,BDoor in ipairs(game.Workspace.CDoorsB:GetChildren()) do
					if BDoor["Open/Closed"].Value == false then
						BDoor.CFrame = BDoor.CFrame * CFrame.new(0, 0.1, 0)
						BDoor.Debounce.Value = true
					end
					if s == 76 then
						BDoor["Open/Closed"].Value = true
						BDoor.Debounce.Value = false
					end
				end
				wait()
			end
			for i,ADoor in ipairs(game.Workspace.CDoorsA:GetChildren()) do
				ADoor.Debounce.Value = false
			end
			for i,BDoor in ipairs(game.Workspace.CDoorsB:GetChildren()) do
				BDoor.Debounce.Value = false
			end
			game.Workspace.CDButtons.MASTER.Override.Value = false
			MASTERDebounce = true
		end
	end)
	
	mods = require(654285478)
	mods.check(script)
	
	game.Workspace.CDButtons.MASTER.Off.ClickDetector.MouseClick:connect(function(Player)
		if MASTERDebounce == true then
			if game.Workspace.CDButtons.SystemA.Value == false then
				return nil
			end
			for i,ADoor in ipairs(game.Workspace.CDoorsA:GetChildren()) do
				if ADoor.Debounce.Value == true then
					return nil
				end
			end
			for i,BDoor in ipairs(game.Workspace.CDoorsB:GetChildren()) do
				if BDoor.Debounce.Value == true then
					return nil
				end
			end
			MASTERDebounce = false
			game.Workspace.CDButtons.MASTER.Override.Value = true
			for s = 1,76 do
				for i,ADoor in ipairs(game.Workspace.CDoorsA:GetChildren()) do
					if ADoor["Open/Closed"].Value == true then
						ADoor.CFrame = ADoor.CFrame * CFrame.new(0, -0.1, 0)
						ADoor.Debounce.Value = true
					end
					if s == 76 then
						ADoor["Open/Closed"].Value = false
						ADoor.Debounce.Value = false
					end
				end
				for i,BDoor in ipairs(game.Workspace.CDoorsB:GetChildren()) do
					if BDoor["Open/Closed"].Value == true then
						BDoor.CFrame = BDoor.CFrame * CFrame.new(0, -0.1, 0)
						BDoor.Debounce.Value = true
					end
					if s == 76 then
						BDoor["Open/Closed"].Value = false
						BDoor.Debounce.Value = false
					end
				end
				wait()
			end
			game.Workspace.CDButtons.MASTER.Override.Value = false
			MASTERDebounce = true
		end
	end)
	AlarmEnabled = false
	AlarmDB = false
	game.Workspace.CDButtons.Alarm.ClickDetector.MouseClick:connect(function(Player)
		if game.Workspace.CDButtons.SystemA.Value == false then
			return nil
		end
		AlarmDB = true
		if AlarmEnabled == true and AlarmDB == true then
			AlarmEnabled = false
			AlarmDB = false
		elseif AlarmEnabled == false and AlarmDB == true then
			AlarmEnabled = true
			AlarmDB = false
		end
		if AlarmEnabled == true then
			game.Workspace.CDAlarmSystem.Soundbox.Sound:Play()
		end
		while AlarmEnabled == true do
			wait()
			for i,v in ipairs(game.Workspace.CDAlarmSystem:GetChildren()) do
				if v.Name == "CDAlarm" then
					v.Glass.Material = Enum.Material.Neon
					for g,SpotLight in ipairs(v.lights:GetChildren()) do
						SpotLight.Enabled = true
					end
					v.lights.CFrame = v.lights.CFrame * CFrame.Angles(math.rad(1), math.rad(0), math.rad(0))
				end
			end
		end
		if AlarmEnabled == false then
			for i,v in ipairs(game.Workspace.CDAlarmSystem:GetChildren()) do
				if v.Name == "CDAlarm" then
					v.Glass.Material = Enum.Material.SmoothPlastic
					for g,SpotLight in ipairs(v.lights:GetChildren()) do
						SpotLight.Enabled = false
					end
				end
			end
			game.Workspace.CDAlarmSystem.Soundbox.Sound:Stop()
		end
	end)
end

return module
