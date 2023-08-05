-- load fonts and stuff
smallFont = love.graphics.newFont("small.ttf", 27)
normalFont = love.graphics.newFont("normal.ttf", 27)
normalFont:setLineHeight(1.2)

function drawDateTime()
  local infoHeight = 3
  love.graphics.setFont(smallFont)
  love.graphics.print(currentTime, 416, bottomLineY + infoHeight)
  love.graphics.print(currentMeridian, 548, bottomLineY + infoHeight)
  love.graphics.print(currentDate, 56, bottomLineY + infoHeight)
end

function drawBase()
  love.graphics.setColor(1,1,1)
  love.graphics.setLineWidth(2)
  love.graphics.line(0, bottomLineY, 640, bottomLineY)
end

function drawBottomText(text)
  love.graphics.setFont(normalFont)
  love.graphics.print(text, 56, 415) -- 72, 190
end

function drawTitle(text)
  love.graphics.setFont(smallFont)
  love.graphics.printf(text, 56, 40, 528, "center")
end

function drawBody(text)
  love.graphics.setFont(normalFont)
  love.graphics.printf(text, 56, 75, 528, "left")
end