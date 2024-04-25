--Assume that a max number of 7 airport can be checked simultaneously.
--
DebugFlag=false
MaxBuff=7
local UsedBuff=0

function AirfieldChecker(AirportName,BuffIndex)
    local Airport=AIRBASE:FindByName(AirportName)
    if Airport==nil then
        MESSAGE:New("Airport Not Foud"):ToAll()
        return nil
    end
    --[[
    if BuffIndex>UsedBuff then
        MESSAGE:New("Buffer exceeded"):ToAll()
        return nil
    end
    ]]
    local AirportZone = Airport:GetZone()
    AirportZone.DrawZone(AirportZone,-1,{1,0,0},0.5,{1,0,0},0.15,1)
    --
    AirportZone:Scan({Object.Category.UNIT},{Unit.Category.GROUND_UNIT})
    --scan for blue coalition
    if AirportZone:CheckScannedCoalition(coalition.side.BLUE) then
        if DebugFlag then
            MESSAGE:New(BuffIndex..") Blue units founded in "..AirportName):ToAll()
        end
        return 1
    end
    if AirportZone:CheckScannedCoalition(coalition.side.RED) then
        if DebugFlag then
            MESSAGE:New(BuffIndex..") Red units founded in "..AirportName):ToAll()
        end
        return 0
    end
    if DebugFlag then
        MESSAGE:New(BuffIndex..") No units founded in "..AirportName):ToAll()
    end
    return -1
end

TimerAirfieldCkecker_Kutaisi=TIMER:New(AirfieldChecker,"Kutaisi",UsedBuff)
TimerAirfieldCkecker_Kutaisi:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
UsedBuff=UsedBuff+1


TimerAirfieldCkecker_Senaki=TIMER:New(AirfieldChecker,"Senaki-Kolkhi",UsedBuff)
TimerAirfieldCkecker_Senaki:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
UsedBuff=UsedBuff+1

TimerAirfieldCkecker_Kobuleti=TIMER:New(AirfieldChecker,"Kobuleti",UsedBuff)
TimerAirfieldCkecker_Kobuleti:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
UsedBuff=UsedBuff+1

TimerAirfieldCkecker_Batumi=TIMER:New(AirfieldChecker,"Batumi",UsedBuff)
TimerAirfieldCkecker_Batumi:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
UsedBuff=UsedBuff+1

TimerAirfieldCkecker_Gudauta=TIMER:New(AirfieldChecker,"Gudauta",UsedBuff)
TimerAirfieldCkecker_Gudauta:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
UsedBuff=UsedBuff+1

TimerAirfieldCkecker_Sukhumi=TIMER:New(AirfieldChecker,"Sukhumi-Babushara",UsedBuff)
TimerAirfieldCkecker_Sukhumi:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
UsedBuff=UsedBuff+1

TimerAirfieldCkecker_Tbilisi=TIMER:New(AirfieldChecker,"Tbilisi-Lochini",UsedBuff)
TimerAirfieldCkecker_Tbilisi:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
