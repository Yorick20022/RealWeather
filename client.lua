CreateThread(function ()
    while true do
        Wait(Config.Interval) -- Fetches API once per minute
        TriggerServerEvent("yorick:sv_weathersync")
    end
end)

RegisterNetEvent("yorick:cl_weathersync")
AddEventHandler("yorick:cl_weathersync", function(weatherType)
    SetWeatherTypeNowPersist(weatherType)
end)