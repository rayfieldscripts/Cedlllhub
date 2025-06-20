local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/ataturk123/GardenSpawner/refs/heads/main/Spawner.lua"))()

pcall(function()
	game.CoreGui:FindFirstChild("g3zmarSpawner"):Destroy()
end)

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "Cedlllspawner"
gui.ResetOnSpawn = false

-- Toggle Key
local UserInputService = game:GetService("UserInputService")
local toggleKey = Enum.KeyCode.K

-- Floating Reopen Button
local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0, 120, 0, 35)
reopenBtn.Position = UDim2.new(0, 20, 0.5, -20)
reopenBtn.BackgroundColor3 = Color3.fromRGB(30, 180, 140)
reopenBtn.Text = "Open Spawner"
reopenBtn.TextColor3 = Color3.new(1, 1, 1)
reopenBtn.Font = Enum.Font.GothamBold
reopenBtn.TextSize = 14
reopenBtn.Visible = false
Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(0, 8)

-- Main Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 460, 0, 330)
frame.Position = UDim2.new(0.5, -230, 0.5, -165)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 60)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Close Button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextSize = 16
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)

-- Close button functionality
closeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
	reopenBtn.Visible = true
end)

-- Reopen button functionality
reopenBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	reopenBtn.Visible = false
end)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "g3zmar OP Script Spawner"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(140, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Tabs
local currentTab = "Pet"
local tabNames = {"Pet", "Seed", "Egg"}
local tabs = {}
local function createTab(name, index)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0, 120, 0, 30)
	btn.Position = UDim2.new(0, 20 + ((index - 1) * 140), 0, 45)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
	btn.Text = name
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamSemibold
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

	btn.MouseButton1Click:Connect(function()
		currentTab = name
		updateTabs()
	end)
	tabs[name] = btn
end

for i, name in ipairs(tabNames) do
	createTab(name, i)
end

-- Sections (per tab)
local petSection = Instance.new("Frame", frame)
petSection.Position = UDim2.new(0, 20, 0, 90)
petSection.Size = UDim2.new(1, -40, 0, 120)
petSection.BackgroundTransparency = 1

local seedSection = petSection:Clone()
seedSection.Parent = frame
seedSection.Name = "SeedSection"
seedSection.Visible = false

local eggSection = petSection:Clone()
eggSection.Parent = frame
eggSection.Name = "EggSection"
eggSection.Visible = false

-- Function to make input
local function makeInput(parent, labelText, placeholder, yPos)
	local label = Instance.new("TextLabel", parent)
	label.Position = UDim2.new(0, 0, 0, yPos)
	label.Size = UDim2.new(0, 120, 0, 25)
	label.Text = labelText
	label.TextColor3 = Color3.fromRGB(200, 200, 255)
	label.Font = Enum.Font.Gotham
	label.TextSize = 16
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.BackgroundTransparency = 1

	local box = Instance.new("TextBox", parent)
	box.Position = UDim2.new(0, 130, 0, yPos)
	box.Size = UDim2.new(0, 250, 0, 25)
	box.PlaceholderText = placeholder
	box.Text = ""
	box.TextColor3 = Color3.new(1, 1, 1)
	box.Font = Enum.Font.Gotham
	box.TextSize = 16
	box.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

	return box
end

-- Pet Inputs
local petName = makeInput(petSection, "Pet Name", "e.g. Raccoon", 0)
local petWeight = makeInput(petSection, "Weight", "e.g. 3.5", 35)
local petAge = makeInput(petSection, "Age", "e.g. 2", 70)

-- Seed Input
local seedName = makeInput(seedSection, "Seed Name", "e.g. Candy Blossom", 0)

-- Egg Input
local eggName = makeInput(eggSection, "Egg Name", "e.g. Night Egg", 0)

-- Update tab view
function updateTabs()
	petSection.Visible = currentTab == "Pet"
	seedSection.Visible = currentTab == "Seed"
	eggSection.Visible = currentTab == "Egg"
end

-- Spawn Button
local spawnBtn = Instance.new("TextButton", frame)
spawnBtn.Size = UDim2.new(0, 160, 0, 35)
spawnBtn.Position = UDim2.new(0.5, -80, 1, -50)
spawnBtn.BackgroundColor3 = Color3.fromRGB(0, 190, 160)
spawnBtn.Text = "Spawn"
spawnBtn.TextColor3 = Color3.new(1, 1, 1)
spawnBtn.Font = Enum.Font.GothamBold
spawnBtn.TextSize = 18
Instance.new("UICorner", spawnBtn).CornerRadius = UDim.new(0, 8)

spawnBtn.MouseButton1Click:Connect(function()
	if currentTab == "Pet" then
		local n, w, a = petName.Text, tonumber(petWeight.Text), tonumber(petAge.Text)
		if n ~= "" and w and a then
			Spawner.SpawnPet(n, w, a)
		end
	elseif currentTab == "Seed" then
		local s = seedName.Text
		if s ~= "" then
			Spawner.SpawnSeed(s)
		end
	elseif currentTab == "Egg" then
		local e = eggName.Text
		if e ~= "" then
			Spawner.SpawnEgg(e)
		end
	end
end)

-- Toggle with "K"
UserInputService.InputBegan:Connect(function(input, gp)
	if input.KeyCode == toggleKey and not gp then
		if frame.Visible then
			frame.Visible = false
			reopenBtn.Visible = true
		else
			frame.Visible = true
			reopenBtn.Visible = false
		end
	end
end)
