--960
--540
TopLeftCanvas=nil
BottomLeftCanvas=nil
TopRightCanvas=nil
BottomRrightCanvas=nil


Player=nil

GamePosition={top_left=1,top_right=2,bottom_left=3,bottom_right=4}
CurrentGamePosition=GamePosition.top_left

TopLeftRect={x=0,y=0,w=960,h=540}
BottomLeftRect={x=0,y=540,w=960,h=540}
TopRightRect={x=960,y=0,w=960,h=540}
BottomRightRect={x=960,y=540,w=960,h=540}

GameText="Top Left Game"


function love.load()
    love.window.setMode(1920, 1080, {fullscreen = false, vsync = true})
    love.window.setPosition(40, 40)
    TopRightCanvas = love.graphics.newCanvas(TopRightRect.w, TopRightRect.h)
    BottomRrightCanvas = love.graphics.newCanvas(BottomRightRect.w, BottomRightRect.h)
    TopLeftCanvas = love.graphics.newCanvas(TopLeftRect.w, TopLeftRect.h)
    BottomLeftCanvas = love.graphics.newCanvas(BottomRightRect.w, BottomRightRect.h)

    Player = {x=100,y=300,width=50,height=50}
end

function love.update(dt)
    -- Update logic here
    if love.keyboard.isDown("up") then
        Player.y = Player.y - 100 * dt
    end
    if love.keyboard.isDown("down") then
        Player.y = Player.y + 100 * dt
    end
    if love.keyboard.isDown("left") then
        Player.x = Player.x - 100 * dt
    end
    if love.keyboard.isDown("right") then
        Player.x = Player.x + 100 * dt
    end

    --check where the player is
    if Player.x < 960 and Player.y < 540 then
        CurrentGamePosition = GamePosition.top_left
        GameText="Top Left Game"
    elseif Player.x < 960 and Player.y > 540 then
        CurrentGamePosition = GamePosition.bottom_left
        GameText="Bottom Left Game"
    elseif Player.x > 960 and Player.y < 540 then
        CurrentGamePosition = GamePosition.top_right
        GameText="Top Right Game"
    elseif Player.x > 960 and Player.y > 540 then
        CurrentGamePosition = GamePosition.bottom_right
        GameText="Bottom Right Game"
    end
end

function love.draw()
    love.graphics.setCanvas(TopRightCanvas)
    love.graphics.clear(1, 0, 0, 1)

    love.graphics.setCanvas(BottomRrightCanvas)
    love.graphics.clear(0, 1, 0, 1)
    love.graphics.setColor( 0, 0, 0 )

    love.graphics.setCanvas(TopLeftCanvas)
    love.graphics.clear(0, 0, 1, 1)
    love.graphics.setColor( 0, 0, 0 )
    
    love.graphics.setCanvas(BottomLeftCanvas)
    love.graphics.clear(1, 1, 0, 1)
    love.graphics.setColor( 0, 0, 0 )

    love.graphics.setCanvas()
    love.graphics.clear(0, 0, 0, 1)
    love.graphics.setColor( 1, 1, 1 )
    love.graphics.draw(TopRightCanvas, TopRightRect.x, TopRightRect.y)
    love.graphics.draw(BottomRrightCanvas, BottomRightRect.x, BottomRightRect.y)
    love.graphics.draw(TopLeftCanvas, TopLeftRect.x, TopLeftRect.y)
    love.graphics.draw(BottomLeftCanvas, BottomLeftRect.x, BottomLeftRect.y)
    love.graphics.setColor( 0, 0, 0 )
    love.graphics.rectangle("fill", Player.x, Player.y, Player.width, Player.height)
    love.graphics.print(GameText, 30, 30)

end