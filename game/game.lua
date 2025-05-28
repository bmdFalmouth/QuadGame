    -- Prototypal Object Oriented Programming in Lua
    -- https://www.lua.org/pil/16.1.html

    require "sprite"

    GameScreen = {        
        name = "Top Left Game",
        canvas = nil,
        rect ={x=0,y=0,w=960,h=540},
        sprites = {}
    }

    function GameScreen:new(o, name, canvas, rect)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        self.name = name
        self.canvas = canvas
        self.rect = rect
        return o
    end

    function GameScreen:draw()
        love.graphics.setCanvas(self.canvas)
        love.graphics.clear()
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.rectangle("fill", self.rect.x, self.rect.y, self.rect.w, self.rect.h)
        for _, sprite in ipairs(self.sprites) do
            sprite:draw()
        end
        love.graphics.setCanvas()
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(self.canvas, self.rect.x, self.rect.y)
    end

    function GameScreen:update(dt)
        -- Update logic for the game screen can be added here
    end

    function GameScreen:isInside(spriteRect)
        return self.rect.x < spriteRect.x + spriteRect.w and
               self.rect.x + self.rect.w > spriteRect.x and
               self.rect.y < spriteRect.y + spriteRect.h and
               self.rect.y + self.rect.h > spriteRect.y
    end

    function GameScreen:addSprite(sprite)
        --check to see if the sprite exists, before adding
        table.insert(self.sprites, sprite)
    end