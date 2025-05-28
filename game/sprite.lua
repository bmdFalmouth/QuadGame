Sprite={
    image=nil,
    rect={x=0,y=0,w=0,h=0},
    colour={1,1,1,1}
}

function Sprite:new(o, image,colour, x, y, w, h)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.image = image
    self.rect.x = x
    self.rect.y = y
    self.rect.w = w
    self.rect.h = h
    self.colour = colour or {1, 1, 1, 1} -- Default to white if no colour is provided
    if self.image == nil then
        --fill image with a default color
        self.image = love.graphics.newImage("default.png") -- Replace with a valid default image path
    end
    return o
end

function Sprite:draw()
    love.graphics.setColor(self.colour)
    love.graphics.draw(self.image, self.rect.x, self.rect.y, 0, self.rect.w , self.rect.h)
    love.graphics.setColor(1, 1, 1, 1) -- Reset color to white
end