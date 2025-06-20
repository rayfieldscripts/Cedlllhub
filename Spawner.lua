-- Cedlllhub Loader by rayfieldscripts
-- Auto garden spawner script
print("Cedlllhub loaded successfully!")

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/ataturk123/GardenSpawner/refs/heads/main/Spawner.lua"))()

-- Load the default UI
Spawner.Load()

-- Spawn pets
Spawner.SpawnPet("Raccoon", 1, 2)

-- Spawn seeds
Spawner.SpawnSeed("Candy Blossom")

-- Spawn an egg
Spawner.SpawnEgg("Night Egg")

-- Spin a flower
Spawner.Spin("Sunflower")

-- Print supported pets
print("🧸 Cedlllhub Pets:")
for i, pet in ipairs(Spawner.GetPets
