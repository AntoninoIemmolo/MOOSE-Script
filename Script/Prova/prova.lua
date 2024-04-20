local versione=MESSAGE:New("VERSIONE 0.0.2"):ToAll()

function FunzKutInvasion(zone,group)
    MESSAGE:New("Dentro la funznione"):ToAll()
    if zone == nil then
        MESSAGE:New("ERRORE nella zona"):ToAll()
    else if group == nil then
        MESSAGE:New("ERRORE nel grupp"):ToAll()
        end
    end

    local RetValue=group:IsCompletelyInZone(zone)
    if(RetValue) then
        MESSAGE:New("gruppo nella zona"):ToAll()
    end
    return RetValue
end

local function MyMisson()
    MESSAGE:New("Script Start"):ToAll()
    --local ciao=STORAGE.Liquid
    --[[local KutaisiStorage=STORAGE:FindByName("kutaisi")
    S=string.format("the amount of jet fuel in kutaisi is: "
        .." "..KutaisiStorage:GetAmount(STORAGE.Liquid.JETFUEL).."indentazione avvenuta correttamente")
    local Messaggio= MESSAGE:New(S,10)
    Messaggio:ToAll()
    --messaggio first parameter is the string of the message 
    --the second parameter is the message dutarion
    ]]


    local KutaisiAirbase = AIRBASE:FindByName("Kutaisi")
    --function done to check if kutaisi airbase object is been found
    if KutaisiAirbase ~= nil then
        MESSAGE:New("dentro l'if"):ToLog()
        MESSAGE:New("numero posti a kutaisi kutaisi "..
            KutaisiAirbase:GetParkingSpotsNumber()):ToAll()
    else
        MESSAGE:New("fuori l'if"):ToAll()
    end
    ------------------------------------------------------------------
    -- a way to periodicly check if there is a specif group in a specif zone
    --
    MESSAGE:New("prendo la zona"):ToAll()
    local KutaisiZone=KutaisiAirbase:GetZone();
    InvasionGroupKutaisi=GROUP:FindByName("Invasion Blue")
    if InvasionGroupKutaisi ~= nil then
        MESSAGE:New("group founded"):ToAll()
    end
    if KutaisiZone ~= nil and InvasionGroupKutaisi~= nil then
        KutaisiZone.DrawZone(KutaisiZone,-1,{1,0,0},1,{1,0,0},0.15,1)
        KutaisiZone:SetCheckTime(1)
        local timer = TIMER:New(FunzKutInvasion,KutaisiZone,InvasionGroupKutaisi)
        timer:Start(nil,6,5*60)
    else
        MESSAGE:New("no units in Kutaisi zone"):ToAll()
    end

end

MyMisson()
-----------------------------------------------------------------

--[[
reactnative 
flatter
deno
typescript
kaisecsly
docker
]]
