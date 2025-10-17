local isBlackout = false

local function startBlackout()
    if isBlackout then return end

     SetArtificialLightsState(true)
     SetArtificialLightsStateAffectsVehicles(false)
end

local function stopBlack() 
    if not isBlackout then return end
    
    SetArtificialLightsState(false)
    SetArtificialLightsStateAffectsVehicles(false)
end

CreateThread(function()
    startBlackout()

    for k, v in ipairs(Config.NoBlackoutZones) do
        local point = lib.points.new({
            id = tostring(k),
            coords = v.coords,
            distance = v.radius
        })

        function point:onEnter()
            stopBlackout()
        end

        function point:onExit()
             startBlackout()
        end
    end
end)
