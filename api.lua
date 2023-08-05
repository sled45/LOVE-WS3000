http = require('ssl.https')
config = nil
local forecastJSON = nil
local json = require("dkjson")

function loadConfig()
  local open = io.open
  local file = love.filesystem.read("conf.json")
  if file then
    config = json.decode(file)
    return true
  else
    return false
  end
end

function initAPI(latitude, longitude)
  local coordURL = "https://api.weather.gov/points/"..tostring(latitude)..","..tostring(longitude)
  local coordAPI, returnCode = http.request(coordURL)
  if json.decode(coordAPI).status == 404 then
    error("Conditions not available for your area. Raw JSON Code: \n"..coordAPI)
  end
  local forecastURL = json.decode(coordAPI).properties.forecast
  local forecastAPI, returnCode = http.request(forecastURL)
  forecastJSON = json.decode(forecastAPI)
end

function getStatement(index)
  local forecastList = forecastJSON.properties.periods
  local requestedForecast = forecastList[index]
  return (requestedForecast.name).."..."..(requestedForecast.detailedForecast)
end
