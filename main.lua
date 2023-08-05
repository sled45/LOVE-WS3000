function love.load(arg)
  scrW, scrH = 640, 480
  love.window.setMode(scrW, scrH)
  love.window.setTitle("LOVE-WS3000")
  bottomLineY = 390
  simStarted = false
  noSettings = false
  showTime = true
  require("draw")
  require("api")
  --require("flavors")
  settingsLoaded = loadConfig()
  if settingsLoaded then
    initAPI(config.latitude, config.longitude)
  end
end

function love.update(dt)
  currentTime = os.date("%I:%M:%S") -- we don't remove any leading zeroes because i feel lazy as hell rn
  currentDate = os.date("%a %b %d")
  currentMeridian = os.date("%p")
  if simStarted then
    return
  else
    if love.keyboard.isDown("return") then
      simStarted = true
      
    end
  end
end

function love.draw()
  love.graphics.setBackgroundColor(0,0,1)
  drawBase()
  if not settingsLoaded then
    drawBottomText("CONF.JSON NOT FOUND")
  else
    if showTime then
      drawDateTime()
    end
    if simStarted then
      drawTitle("YOUR NWS FORECAST")
      drawBody(getStatement(1))
    else
      drawBottomText("PRESS ENTER TO START SIMULATION...")
    end
  end
end
