local WeatherTypes = {
    -- Clear or Sunny
    ["Sunny"] = "EXTRASUNNY",
    ["Clear"] = "CLEAR",

    -- Cloudy Conditions
    ["Partly cloudy"] = "CLOUDS",
    ["Cloudy"] = "CLOUDS",
    ["Overcast"] = "OVERCAST",

    -- Fog and Mist
    ["Mist"] = "FOGGY",
    ["Fog"] = "FOGGY",
    ["Freezing fog"] = "FOGGY",

    -- Rain Conditions
    ["Patchy rain possible"] = "RAIN",
    ["Light drizzle"] = "RAIN",
    ["Patchy light drizzle"] = "RAIN",
    ["Drizzle"] = "RAIN",
    ["Heavy drizzle"] = "RAIN",
    ["Light rain"] = "RAIN",
    ["Moderate rain at times"] = "RAIN",
    ["Moderate rain"] = "RAIN",
    ["Heavy rain at times"] = "RAIN",
    ["Heavy rain"] = "RAIN",
    ["Light freezing rain"] = "RAIN",
    ["Moderate or heavy freezing rain"] = "RAIN",
    ["Light rain shower"] = "RAIN",
    ["Moderate or heavy rain shower"] = "RAIN",
    ["Torrential rain shower"] = "RAIN",

    -- Snow Conditions
    ["Patchy snow possible"] = "SNOW",
    ["Patchy light snow"] = "SNOW",
    ["Light snow"] = "SNOW",
    ["Patchy moderate snow"] = "SNOW",
    ["Moderate snow"] = "SNOW",
    ["Patchy heavy snow"] = "SNOW",
    ["Heavy snow"] = "SNOW",
    ["Ice pellets"] = "SNOW",
    ["Light snow showers"] = "SNOW",
    ["Moderate or heavy snow showers"] = "SNOW",
    ["Patchy light snow with thunder"] = "SNOW",
    ["Moderate or heavy snow with thunder"] = "SNOW",

    -- Sleet Conditions
    ["Patchy sleet possible"] = "SNOWLIGHT",
    ["Light sleet"] = "SNOWLIGHT",
    ["Moderate or heavy sleet"] = "SNOWLIGHT",
    ["Light sleet showers"] = "SNOWLIGHT",
    ["Moderate or heavy sleet showers"] = "SNOWLIGHT",
    ["Light showers of ice pellets"] = "SNOWLIGHT",
    ["Moderate or heavy showers of ice pellets"] = "SNOWLIGHT",

    -- Blizzard Conditions
    ["Blizzard"] = "BLIZZARD",
    ["Blowing snow"] = "BLIZZARD",

    -- Thunderstorm Conditions
    ["Thundery outbreaks possible"] = "THUNDER",
    ["Patchy light rain with thunder"] = "THUNDER",
    ["Moderate or heavy rain with thunder"] = "THUNDER",

    -- Additional Conditions
    ["Patchy freezing drizzle possible"] = "FOGGY",
    ["Freezing drizzle"] = "FOGGY",
    ["Heavy freezing drizzle"] = "FOGGY",
}

local function GetWeatherInfo(callback)
    PerformHttpRequest(Config.API_URL, function(errorCode, resultData, resultHeaders, errorData)
        if errorCode == 200 then

            local data = json.decode(resultData)
            local weatherConditionText = data.current.condition.text
            local weatherType = WeatherTypes[weatherConditionText]
            
            callback(weatherType)
        else
            print("Failed to fetch weather data. Error code:", errorCode)
            callback(nil)
        end
    end, 'GET', '', { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent("yorick:sv_weathersync")
AddEventHandler("yorick:sv_weathersync", function()
    local source = source

    GetWeatherInfo(function(weatherType)
        if weatherType then
            TriggerClientEvent("yorick:cl_weathersync", source, weatherType)
        else
            print("Failed to fetch weather data for player:", source)
        end
    end)
end)
