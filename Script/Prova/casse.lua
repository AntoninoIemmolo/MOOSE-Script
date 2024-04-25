--Versione (0.0.1)


---@type GROUP
local heliGroup=GROUP:FindByName("Rotary-1")
if heliGroup==nil then MESSAGE:New("heli group not found"):ToAll() end

---@type SET_CARGO
local CargoSet=SET_CARGO:New()
SET_UNIT:Flush
if CargoSet==nil then MESSAGE:New("cargo set not found"):ToAll() end

---@type CARGO 
local Cargo1=CARGO:New("Container","Cargo 1-2",1000)


---@type AI_CARGO_HELICOPTER
local heli=AI_CARGO_HELICOPTER:New(heliGroup,Cargo1)

MESSAGE:New("OK"):ToAll()
heli:Pickup(AIRBASE:FindByName("Kobuleti"):GetZone(),80)

AI_CARGO_HELICOPTER
