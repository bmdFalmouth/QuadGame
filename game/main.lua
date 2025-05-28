require "game"

--960
--540
TopLeftCanvas=nil
BottomLeftCanvas=nil
TopRightCanvas=nil
BottomRrightCanvas=nil


Player=nil
CurretGame=nil
Games={}

GamePosition={top_left=1,top_right=2,bottom_left=3,bottom_right=4}
CurrentGamePosition=GamePosition.top_left

TopLeftRect={x=0,y=0,w=960,h=540}
BottomLeftRect={x=0,y=540,w=960,h=540}
TopRightRect={x=960,y=0,w=960,h=540}
BottomRightRect={x=960,y=540,w=960,h=540}

function love.load()
    love.window.setMode(1920, 1080, {fullscreen = false, vsync = true})
    love.window.setPosition(40, 40)
    TopRightCanvas = love.graphics.newCanvas(TopRightRect.w, TopRightRect.h)
    BottomRrightCanvas = love.graphics.newCanvas(BottomRightRect.w, BottomRightRect.h)
    TopLeftCanvas = love.graphics.newCanvas(TopLeftRect.w, TopLeftRect.h)
    BottomLeftCanvas = love.graphics.newCanvas(BottomRightRect.w, BottomRightRect.h)

    Player = {x=100,y=300,width=50,height=50,moveSpeed=100,
    
    move=function (self, dx, dy,dt)
        self.x = self.x + (dx*self.moveSpeed * dt)
        self.y = self.y + (dy*self.moveSpeed * dt)
        
    end
    }
    topLeftGame = GameScreen:new(nil, "Top Left Game", TopLeftCanvas, TopLeftRect)
    bottomLeftGame = GameScreen:new(nil, "Bottom Left Game", BottomLeftCanvas, BottomLeftRect)
    topRightGame = GameScreen:new(nil, "Top Right Game", TopRightCanvas, TopRightRect)
    bottomRightGame = GameScreen:new(nil, "Bottom Right Game", BottomRrightCanvas, BottomRightRect)
    Games={topLeftGame, bottomLeftGame, topRightGame, bottomRightGame}
    CurrentGame=Games[CurrentGamePosition]
end

function love.update(dt)
    -- Update logic here
    if love.keyboard.isDown("up") then
        --Player.y = Player.y - Player.moveSpeed * dt
        Player:move(0, -1, dt)
    end
    if love.keyboard.isDown("down") then
        Player:move(0, 1, dt)
    end
    if love.keyboard.isDown("left") then
        Player:move(-1, 0, dt)
    end
    if love.keyboard.isDown("right") then
        Player:move(1, 0, dt)
    end

    CurrentGame:update(dt)
end

function love.draw()

    love.graphics.setCanvas()
    love.graphics.clear(0, 0, 0, 1)
    love.graphics.setColor( 0, 0, 0 )
    CurrentGame:draw()
    love.graphics.rectangle("fill", Player.x, Player.y, Player.width, Player.height)
    love.graphics.print(CurrentGame.name, 30, 30)

end