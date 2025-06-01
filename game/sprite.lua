Sprite={
    image=nil,
    rect={x=0,y=0,w=0,h=0},
    colour={r=1,g=1,b=1,a=1}
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
    printtable(self.rect)
    self.colour.r=colour.r -- Default to white if no colour is provided
    self.colour.g=colour.g
    self.colour.b=colour.b
    self.colour.a=colour.a
    print("Check to see if image is null")
    if image == nil then
        --fill image with a default color
        self.image = love.graphics.newImage("default.png") -- Replace with a valid default image path
        print("Sprite image is nil, using default image")
        print(self.image)
    end
    return o
end

function Sprite:draw()
    --love.graphics.setColor(self.colour.r,self.colour.g,self.colour.b,self.colour.a)
    print(self.rect.h/self.image:getHeight())
    love.graphics.draw(self.image, self.rect.x, self.rect.y, 0, self.rect.w/self.image:getWidth(), self.rect.h/self.image:getHeight(), self.rect.w/2, self.rect.h/2)
end