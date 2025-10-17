local inArea = {}

local function startBlackout(point)
    if point then
        inArea[point.id] = nil
        if next(inArea) then return end
    end
    
    SetArtificialLightsState(true)
    SetArtificialLightsStateAffectsVehicles(false)
end

local function stopBlackout(point) 
    inArea[point.id] = true
    SetArtificialLightsState(false)
    SetArtificialLightsStateAffectsVehicles(false)
end

CreateThread(function()
    startBlackout()

    for k, v in ipairs(Config.NoBlackoutZones) do
        local point = lib.points.new({
            id = "blackout_" .. tostring(k),
            coords = v.coords,
            distance = v.radius
        })

        function point:onEnter()
            stopBlackout(self)
        end

        function point:onExit()
            startBlackout(self)
        end
    end
end)
