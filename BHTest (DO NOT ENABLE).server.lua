-- i hate you Kyodo

--[[
INSTRUCTIONS:

Alright, so here's how to use this building generator.

NOTE: If you do not want a randomly generated value, just set both the min and max for math.random(x,y) to the same value
FOR EXAMPLE: math.random(5,5) or math.random(1,1)

-Set roof to true if you want roofs, set the roofHeight value to a minimum and max value of studs in order to choose the height of the roof

-Set houseBaseSize to how high you want the base of the house to be.

-Vertical house lines are the lines that go like ||| on a house, and horizontal is the same thing just facing a different direction. Edit 
these two values in order to set the AMOUNT of the lines you want generated on a house

-revHorizontalHouseLines are just the house lines but flipped, again edit to change amount of lines generated.

-baseHouseColor is the color of the building itself. The first color3 value is the minimum, the second one is the maximum, it will generate
a random number in between the r,g,b. This one is a bit iffy, so if you want a precise single color, just change the r,g,b to the same in the 
first and second one. Such as {Color3.fromRGB(139, 118, 101), Color3.fromRGB(139, 118, 101)}

-edgeLineColor is the same thing as above, but the wooden things on the sides of the house. 

VERY IMPORTANT: Finally, just select the basepart you want to generate the house on. Make sure the orientation, and general size of the part is
how you want it to be, and MAKE SURE YOU ONLY HAVE ONE PART SELECTED IN STUDIO!!!!!!!!

Once all these conditions have been met, copy and paste lines 36 to the end of this script into command bar and press enter

Call me on discord for more info or if you need a demonstration


]]

function generateHouse(base)
	-- EDIT ONLY THESE VARIABLES BELOW
	local roof = true
	-- DO NOT USE WINDOWS FOR NOW
	local windows = false
	local houseBaseSize = math.random(10,15)
	local roofHeight = math.random(6,9)
	local verticalHouseLines = math.random(3,5)
	local horizontalHouseLines = math.random(2,3)
	local revHorizontalHouseLines = math.random(2,3)
	local baseHouseColor = {
	Color3.fromRGB(139, 118, 101), 
	Color3.fromRGB(121, 115, 105), 
	Color3.fromRGB(231, 202, 182), 
	Color3.fromRGB(185, 180, 168)
	}
	local edgeLineColor = {
	Color3.fromRGB(90, 76, 66), 
	Color3.fromRGB(121, 94, 39), 
	Color3.fromRGB(145, 111, 53), 
	Color3.fromRGB(63, 58, 40), 
	Color3.fromRGB(105, 102, 92)
	}
	-- EDIT ONLY THESE VARIABLES ABOVE
	
	
	local spawnHousePart = base
	--[[
	baseHouseColor = Color3.fromRGB(
		math.random(baseHouseColor[1].r * 255, baseHouseColor[2].r * 255),
		math.random(baseHouseColor[1].g * 255, baseHouseColor[2].g * 255),
		math.random(baseHouseColor[1].b * 255, baseHouseColor[2].b * 255)
	)
	edgeLineColor = Color3.fromRGB(
		math.random(edgeLineColor[1].r * 255, edgeLineColor[2].r * 255),
		math.random(edgeLineColor[1].g * 255, edgeLineColor[2].g * 255),
		math.random(edgeLineColor[1].b * 255, edgeLineColor[2].b * 255)
	)
	]]
	
	baseHouseColor = baseHouseColor[math.random(1, #baseHouseColor)]
	edgeLineColor = edgeLineColor[math.random(1, #edgeLineColor)]
	
	local HouseModel = Instance.new('Model', game.Workspace)
	HouseModel.Name = 'House'
	local HouseBase = Instance.new('Part', HouseModel)
	HouseBase.Name = 'HouseBase'
	HouseBase.Size = Vector3.new(spawnHousePart.Size.X - 0.2, houseBaseSize, spawnHousePart.Size.Z - 0.2)
	HouseBase.Material = Enum.Material.Brick
	HouseBase.CFrame = spawnHousePart.CFrame * CFrame.new(0,(HouseBase.Size.Y / 2) + (spawnHousePart.Size.Y/2),0)
	HouseBase.Anchored = true
	HouseBase.Color = baseHouseColor
	
	
	local FR = Instance.new('Part', HouseModel)
	FR.Size = Vector3.new(0.2,HouseBase.Size.Y,0.2)
	FR.CFrame = HouseBase.CFrame * CFrame.new(HouseBase.Size.X / 2 - 0.05,0,HouseBase.Size.Z / 2 - 0.05)
	FR.Anchored = true
	FR.Name = 'Edgeline'
	FR.Color = edgeLineColor
	local FL = FR:Clone()
	FL.Parent = HouseModel
	FL.CFrame = HouseBase.CFrame * CFrame.new(-HouseBase.Size.X / 2 + 0.05,0,HouseBase.Size.Z / 2 - 0.05)
	local BL = FR:Clone()
	BL.Parent = HouseModel
	BL.CFrame = HouseBase.CFrame * CFrame.new(-HouseBase.Size.X / 2 + 0.05,0,-HouseBase.Size.Z / 2 + 0.05)
	local BR = FR:Clone()
	BR.Parent = HouseModel
	BR.CFrame = HouseBase.CFrame * CFrame.new(HouseBase.Size.X / 2 - 0.05,0,-HouseBase.Size.Z / 2 + 0.05)
	
	FR.Material = Enum.Material.Wood
	FL.Material = Enum.Material.Wood
	BL.Material = Enum.Material.Wood
	BR.Material = Enum.Material.Wood
	
	local vHL = {}
	local hHL = {}
	local rvHL = {}
	
	for num = 1,verticalHouseLines do
		if num ~= verticalHouseLines then
			local VerticalLine = FR:Clone()
			VerticalLine.Parent = HouseModel
			VerticalLine.Size = Vector3.new(HouseBase.Size.X + 0.2, FR.Size.Y, FR.Size.X)
			VerticalLine.CFrame = HouseBase.CFrame * CFrame.new(0,0,(-HouseBase.Size.Z/2) + (HouseBase.Size.Z * num/verticalHouseLines))
			table.insert(vHL, VerticalLine)
		end
	end
	
	for num = 1,horizontalHouseLines do
		if num ~= horizontalHouseLines then
			local HorizontalLine = FR:Clone()
			HorizontalLine.Parent = HouseModel
			HorizontalLine.Size = Vector3.new(FR.Size.X, FR.Size.Y, HouseBase.Size.Z + 0.2)
			HorizontalLine.CFrame =  HouseBase.CFrame * CFrame.new((-HouseBase.Size.X/2) + (HouseBase.Size.X * num/horizontalHouseLines),0,0)
			table.insert(hHL, HorizontalLine)
		end
	end
	
	for num = 0,revHorizontalHouseLines do
		local RevHorizontalLine = FR:Clone()
		RevHorizontalLine.Parent = HouseModel
		RevHorizontalLine.Size = Vector3.new(HouseBase.Size.X + 0.2, FR.Size.X, HouseBase.Size.Z + 0.2)
		RevHorizontalLine.CFrame =  HouseBase.CFrame * CFrame.new(0,(-HouseBase.Size.Y/2) + (HouseBase.Size.Y * num/revHorizontalHouseLines),0)
		table.insert(rvHL, RevHorizontalLine)
	end
	
	if roof == true then
		local houseWedge1 = Instance.new('WedgePart', HouseModel)
		houseWedge1.Material = HouseBase.Material
		houseWedge1.Color = HouseBase.Color
		houseWedge1.Size = Vector3.new(HouseBase.Size.Z, roofHeight, HouseBase.Size.X / 2)
		houseWedge1.CFrame = HouseBase.CFrame * CFrame.new(-houseWedge1.Size.Z/2,(houseWedge1.Size.Y/2) + (HouseBase.Size.Y/2),0) * CFrame.Angles(0,math.rad(90),0)
		houseWedge1.Anchored = true
		houseWedge1.Name = 'RoofWedge'
		
		local houseWedge2 = Instance.new('WedgePart', HouseModel)
		houseWedge2.Material = HouseBase.Material
		houseWedge2.Color = HouseBase.Color
		houseWedge2.Size = Vector3.new(HouseBase.Size.Z, roofHeight, HouseBase.Size.X / 2)
		houseWedge2.CFrame = HouseBase.CFrame * CFrame.new(houseWedge2.Size.Z/2,(houseWedge2.Size.Y/2) + (HouseBase.Size.Y/2),0) * CFrame.Angles(0,-math.rad(90),0)
		houseWedge2.Anchored = true
		houseWedge2.Name = 'RoofWedge'
		
		local roofLayer1 = Instance.new('Part', HouseModel)
		roofLayer1.CFrame = houseWedge1.CFrame
		roofLayer1.Material = Enum.Material.Brick
		roofLayer1.Color = Color3.fromRGB(104, 57, 43)
		roofLayer1.Size = Vector3.new(houseWedge1.Size.X+0.3,0.4,math.sqrt(houseWedge1.Size.Z^2+houseWedge1.Size.Y^2))
		roofLayer1.CFrame = CFrame.new(roofLayer1.CFrame.p, (houseWedge1.CFrame * CFrame.new(0,-houseWedge1.Size.Y/2,-houseWedge1.Size.Z/2).p))
		roofLayer1.Anchored = true
		roofLayer1.Name = 'RoofLayer'
		
		local roofLayer2 = Instance.new('Part', HouseModel)
		roofLayer2.CFrame = houseWedge2.CFrame
		roofLayer2.Material = Enum.Material.Brick
		roofLayer2.Color = Color3.fromRGB(104, 57, 43)
		roofLayer2.Size = Vector3.new(houseWedge2.Size.X+0.3,0.4,math.sqrt(houseWedge2.Size.Z^2+houseWedge2.Size.Y^2))
		roofLayer2.CFrame = CFrame.new(roofLayer2.CFrame.p, (houseWedge2.CFrame * CFrame.new(0,houseWedge2.Size.Y/2,houseWedge2.Size.Z/2).p))
		roofLayer2.Anchored = true
		roofLayer2.Name = 'RoofLayer'
	end
	
	if windows == true then
		for num = 1,verticalHouseLines+revHorizontalHouseLines do
			local Window = game.ServerStorage.HouseGenWindow.Window:Clone()
			Window:SetPrimaryPartCFrame(HouseBase.CFrame * CFrame.new())
		end
	end
	
	return HouseModel
end
for num = 1,#game:GetService('Selection'):Get() do
	generateHouse(game:GetService('Selection'):Get()[num])
end


function clotheNPC(NPC)
	local Clone = NPC
	local Shirt = game.ReplicatedStorage.Clothing.Shirt:GetChildren()[math.random(1, #game.ReplicatedStorage.Clothing.Shirt:GetChildren())]:Clone()
	Shirt.Parent = Clone
	local Pants = game.ReplicatedStorage.Clothing.Pants:GetChildren()[math.random(1, #game.ReplicatedStorage.Clothing.Pants:GetChildren())]:Clone()
	Pants.Parent = Clone
	local randomFace = game.ReplicatedStorage.Clothing.Eyes:GetChildren()[math.random(1, #game.ReplicatedStorage.Clothing.Eyes:GetChildren())]:Clone()
	randomFace:Clone().Parent = Clone.Head
	local randomFace = game.ReplicatedStorage.Clothing.Mouth:GetChildren()[math.random(1, #game.ReplicatedStorage.Clothing.Mouth:GetChildren())]:Clone()
	randomFace:Clone().Parent = Clone.Head
	local Hair = game.ReplicatedStorage.Clothing.Hair:GetChildren()[math.random(1, #game.ReplicatedStorage.Clothing.Hair:GetChildren())]:Clone()
	Clone.Humanoid:AddAccessory(Hair)
	Hair.Handle.Color = Color3.fromRGB(math.random(1,255), math.random(1,255), math.random(1,255))
end

for num = 1,#game:GetService('Selection'):Get() do
	clotheNPC(game:GetService('Selection'):Get()[num])
end