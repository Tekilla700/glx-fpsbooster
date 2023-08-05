

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('glx-glasses:client:applyfpsboos', function(args)
	local args = tonumber(args)
	if args == 1 then
        SetTimecycleModifier("cinema")

        RopeDrawShadowEnabled(true)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(3.0)
        CascadeShadowsSetCascadeBoundsScale(3.0)
  
        SetFlashLightFadeDistance(3.0)
        SetLightsCutoffDistanceTweak(3.0)
        DistantCopCarSirens(false)
        SetArtificialLightsState(false)
        QBCore.Functions.Notify('Fps boost applied')
    else
        SetTimecycleModifier("default")
        
        RopeDrawShadowEnabled(true)
        CascadeShadowsSetAircraftMode(true)
        CascadeShadowsEnableEntityTracker(false)
        CascadeShadowsSetDynamicDepthMode(true)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(5.0)
        CascadeShadowsSetCascadeBoundsScale(5.0)
        
        SetFlashLightFadeDistance(10.0)
        SetLightsCutoffDistanceTweak(10.0)
        DistantCopCarSirens(true)
        SetArtificialLightsState(false)
        
        QBCore.Functions.Notify('Fps boost removed')
    end
end)

RegisterNetEvent('glx-glasses:client:useGlasses', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("glasses", "Toggling glasses", 1000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
      animDict = "clothingspecs",
      anim = "take_off",
      flags = 16,
    }, {}, {}, function() -- Done
        exports['qb-menu']:openMenu({
            {
                header = "Fps Booster",
                text = "",
                isMenuHeader = true,
            },
            {
                header = "On", 
                txt = "",
                params = {
                    event = "glx-glasses:client:applyfpsboos",
                    args = 1
                }
            },
            {
                header = "Off", 
                txt = "",
                params = {
                    event = "glx-glasses:client:applyfpsboos",
                    args = 2
                }
            },
        })
        ClearPedTasks(ped)
    end, function()
        QBCore.Functions.Notify("Cancelled..", "error")
        ClearPedTasks(ped)
    end)
end)