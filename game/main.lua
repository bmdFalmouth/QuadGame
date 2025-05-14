--960
--540
topRightCanvas=nil
bottomRrightCanvas=nil
topLeftCanvas=nil
bottomLeftCanvas=nil

function love.load()
    love.window.setMode(1920, 1080, {fullscreen = false, vsync = true})
    love.window.setPosition(40, 40)
    topRightCanvas = love.graphics.newCanvas(960, 540)
    bottomRrightCanvas = love.graphics.newCanvas(960, 540)
    topLeftCanvas = love.graphics.newCanvas(960, 540)
    bottomLeftCanvas = love.graphics.newCanvas(960, 540)
end

function love.draw()
    love.graphics.setCanvas(topRightCanvas)
    love.graphics.clear(1, 0, 0, 1)
    love.graphics.setColor( 0, 0, 0 )
    love.graphics.print("Top Right", 480, 270)

    love.graphics.setCanvas(bottomRrightCanvas)
    love.graphics.clear(0, 1, 0, 1)
    love.graphics.setColor( 0, 0, 0 )
    love.graphics.print("Bottom Right", 480, 270)

    love.graphics.setCanvas(topLeftCanvas)
    love.graphics.clear(0, 0, 1, 1)
    love.graphics.setColor( 0, 0, 0 )
    love.graphics.print("Top Left", 480, 270)
    
    love.graphics.setCanvas(bottomLeftCanvas)
    love.graphics.clear(1, 1, 0, 1)
    love.graphics.setColor( 0, 0, 0 )
    love.graphics.print("Bottom Left", 480, 270)

    love.graphics.setCanvas()
    love.graphics.clear(0, 0, 0, 1)
    love.graphics.setColor( 1, 1, 1 )
    love.graphics.draw(topRightCanvas, 0, 0)
    love.graphics.draw(bottomRrightCanvas, 0, 540)
    love.graphics.draw(topLeftCanvas, 960, 0)
    love.graphics.draw(bottomLeftCanvas, 960, 540)

end