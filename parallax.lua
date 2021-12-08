Parallax = {}


Layer = {}

function Layer:new(img, img2, x, y, vel, windowWidth)

    return setmetatable(
        { 
            img = img,
            img2 = img2,
            imgW = img:getWidth(),
            img2W = img2:getWidth(),
            imgH = img:getHeight(),
            img2H = img2:getHeight(),
            x = x,
            x2 = x - windowWidth,
            y = y,
            vel = vel,
        }, 
        { 
            __index = self
        }
    )

end

function Layer:drawLayer(img, img2, x, x2, y, imgW, img2W, imgH, img2H, ww, wh)
    love.graphics.draw(img, x, y, 0, ww/imgW, wh/imgH)
    love.graphics.draw(img2, x2, y, 0, ww/img2W, wh/img2H)
end

function Layer:layerUpdate(dt, ww)
    self.x = self.x - self.vel * dt
    self.x2 = self.x2 - self.vel * dt

    if self.x < 0 then
        self.x2 = (self.img:getWidth() * ww/self.imgW) + self.x
    end
    if self.x2 < 0 then
        self.x = (self.img2:getWidth() * ww/self.img2W) + self.x2
    end       
end



function Parallax:load()
    self.windowWidth = love.graphics.getWidth()
    self.windowHeight = love.graphics.getHeight()

    layerA = Layer:new(love.graphics.newImage("assets/images/1.png"), love.graphics.newImage("assets/images/1.png"),  0, 0, 30, self.windowWidth)
    layerB = Layer:new(love.graphics.newImage("assets/images/2.png"), love.graphics.newImage("assets/images/2.png"),  0, 0, 50, self.windowWidth)
    layerC = Layer:new(love.graphics.newImage("assets/images/3.png"), love.graphics.newImage("assets/images/3.png"),  0, 0, 70, self.windowWidth)
    layerD = Layer:new(love.graphics.newImage("assets/images/4.png"), love.graphics.newImage("assets/images/4.png"),  0, 0, 90, self.windowWidth)
    layerE = Layer:new(love.graphics.newImage("assets/images/5.png"), love.graphics.newImage("assets/images/5.png"),  0, 0, 110, self.windowWidth)
    layerF = Layer:new(love.graphics.newImage("assets/images/6.png"), love.graphics.newImage("assets/images/6.png"),  0, 0, 130, self.windowWidth)
end


function Parallax:update(dt)
    layerA:layerUpdate(dt, self.windowWidth)
    layerB:layerUpdate(dt, self.windowWidth)
    layerC:layerUpdate(dt, self.windowWidth)
    layerD:layerUpdate(dt, self.windowWidth)
    layerE:layerUpdate(dt, self.windowWidth)
    layerF:layerUpdate(dt, self.windowWidth)
end


function Parallax:draw()
    Layer:drawLayer(layerA.img, layerA.img2, layerA.x, layerA.x2, layerA.y, layerA.imgW, layerA.img2W, layerA.imgH, layerA.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(layerB.img, layerB.img2, layerB.x, layerB.x2, layerB.y, layerB.imgW, layerB.img2W, layerB.imgH, layerB.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(layerC.img, layerC.img2, layerC.x, layerC.x2, layerC.y, layerC.imgW, layerC.img2W, layerC.imgH, layerC.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(layerD.img, layerD.img2, layerD.x, layerD.x2, layerD.y, layerD.imgW, layerD.img2W, layerD.imgH, layerD.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(layerE.img, layerE.img2, layerE.x, layerE.x2, layerE.y, layerE.imgW, layerE.img2W, layerE.imgH, layerE.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(layerF.img, layerF.img2, layerF.x, layerF.x2, layerF.y, layerF.imgW, layerF.img2W, layerF.imgH, layerF.img2H, self.windowWidth, self.windowHeight)  
end

