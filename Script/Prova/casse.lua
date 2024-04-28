--Versione (0.0.1a)
---@type SET_CARGO
--from now on every cargo abject which will be declared if the type match with "crate" it will be 
--added to CargoSet
local CargoSet = SET_CARGO:New()
CargoSet:Filter("crate")
CargoSet:FilterStart()

---@type CARGO_CRATE
local CargoCrate = CARGO_CRATE:New(STATIC:FindByName("Cargo 1-1"), "crate", "CargoCrate")
local CargoCrate1 = CARGO_CRATE:New(STATIC:FindByName("Cargo 1-2"), "crate", "CargoCrate1")
CargoSet:FilterStop()

---@type ZONE
local PickupZone=ZONE:FindByName("Pickup Zone")
if PickupZone == nil then MESSAGE:New("Pickup Zone not found"):ToAll() end

---@type ZONE
local DeployZone=ZONE:FindByName("Deploy Zone")
if DeployZone == nil then MESSAGE:New("Deploy Zone not found"):ToAll() end

---@type AI_CARGO_HELICOPTER
local CargoHeliGroup=AI_CARGO_HELICOPTER:New(GROUP:FindByName("Rotary-1"),CargoSet)
CargoHeliGroup:Pickup(PickupZone:GetRandomCoordinate(),80)
CargoHeliGroup:Deploy(DeployZone:GetRandomCoordinate(),190)


