local isLooping = false

local function startBlackoutLoop()
    if isLooping then return end

    CreateThread(function()
        isLooping = true

        while isLooping do
            Citizen.InvokeNative(0xE2B187C0939B3D32, 0)
            SetArtificialLightsState(true)
            SetArtificialLightsStateAffectsVehicles(false)
            Wait(0)
        end

        Citizen.InvokeNative(0xE2B187C0939B3D32, 1)
        SetArtificialLightsState(false)
        SetArtificialLightsStateAffectsVehicles(false)
    end)
end

CreateThread(function()
    startBlackoutLoop()

    for k, v in ipairs(Config.NoBlackoutZones) do
        local point = lib.points.new({
            id = tostring(k),
            coords = v.coords,
            distance = v.radius,
            distances = v.distances
        })

        function point:onEnter()
            isLooping = false
        end

        function point:onExit()
            if not isLooping then
                startBlackoutLoop()
            end
        end
    end
end)
