Config = {}

Config.API_KEY = "" -- API KEY HERE
Config.Location = "Amsterdam"
Config.API_URL = string.format("http://api.weatherapi.com/v1/current.json?key=%s&q=%s&aqi=no", Config.API_KEY, Config.Location)
Config.Interval = 60000 -- 1 minute

-- Weather API: https://www.weatherapi.com/