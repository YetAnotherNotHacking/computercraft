local monitor = peripheral.find("monitor")
if not monitor then
    error("Monitor not found!")
end
monitor.setTextScale(1)
-- Function to load and convert images
local function loadImage(filename)
    return paintutils.loadImage(filename)
end

-- Function to draw an image on the monitor
local function drawImage(image)
    local width, height = monitor.getSize()
    local imgWidth, imgHeight = image.getSize()
    
    local scaleX = math.floor(width / imgWidth)
    local scaleY = math.floor(height / imgHeight)
    
    local scale = math.min(scaleX, scaleY)
    local offsetX = math.floor((width - imgWidth * scale) / 2)
    local offsetY = math.floor((height - imgHeight * scale) / 2)
    
    -- Clear the monitor and fill with black
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    
    paintutils.drawImage(image, offsetX, offsetY)
end

-- Main loop to display 1.png forever
local image = loadImage("1.png")
while true do
    drawImage(image)
    sleep(1) -- goofy
end
