--Assume that a max number of 7 airport can be checked simultaneously.
--
MaxBuff=7
UsedBuff=0

function AirfieldChecker(AirportName)
    local Airport=AIRBASE:FindByName(AirportName)
    MESSAGE:New("function"):ToAll()
    if Airport==nil then
        MESSAGE:New("Airport Not Foud"):ToAll()
        return nil
    end
    local AirportZone = Airport:GetZone()
    AirportZone.DrawZone(AirportZone,-1,{1,0,0},1,{1,0,0},0.15,1)
    --
    AirportZone:Scan({Object.Category.UNIT},{Unit.Category.GROUND_UNIT})
    --scan for blue coalition
    if AirportZone:CheckScannedCoalition(coalition.side.BLUE) then
        MESSAGE:New("Blue units founded in "..AirportName):ToAll()
        return 1
    end
    if AirportZone:CheckScannedCoalition(coalition.side.RED) then
        MESSAGE:New("Red units founded in "..AirportName):ToAll()
        return 0
    end
    MESSAGE:New("No units founded in "..AirportName):ToAll()
    return -1
end

TimerAirfieldCkecker=TIMER:New(AirfieldChecker,"Kutaisi")
TimerAirfieldCkecker:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
UsedBuff=UsedBuff+1


TimerAirfieldCkecker_Senaki=TIMER:New(AirfieldChecker,"Senaki-Kolkhi")
TimerAirfieldCkecker_Senaki:Start(UsedBuff,MaxBuff,MaxBuff*60*5)
UsedBuff=UsedBuff+1
