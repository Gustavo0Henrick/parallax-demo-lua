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

    LayerA = Layer:new(love.graphics.newImage("assets/images/1.png"), love.graphics.newImage("assets/images/1.png"),  0, 0, 30, self.windowWidth)
    LayerB = Layer:new(love.graphics.newImage("assets/images/2.png"), love.graphics.newImage("assets/images/2.png"),  0, 0, 50, self.windowWidth)
    LayerC = Layer:new(love.graphics.newImage("assets/images/3.png"), love.graphics.newImage("assets/images/3.png"),  0, 0, 70, self.windowWidth)
    LayerD = Layer:new(love.graphics.newImage("assets/images/4.png"), love.graphics.newImage("assets/images/4.png"),  0, 0, 90, self.windowWidth)
    LayerE = Layer:new(love.graphics.newImage("assets/images/5.png"), love.graphics.newImage("assets/images/5.png"),  0, 0, 110, self.windowWidth)
    LayerF = Layer:new(love.graphics.newImage("assets/images/6.png"), love.graphics.newImage("assets/images/6.png"),  0, 0, 130, self.windowWidth)
end


function Parallax:update(dt)
    LayerA:layerUpdate(dt, self.windowWidth)
    LayerB:layerUpdate(dt, self.windowWidth)
    LayerC:layerUpdate(dt, self.windowWidth)
    LayerD:layerUpdate(dt, self.windowWidth)
    LayerE:layerUpdate(dt, self.windowWidth)
    LayerF:layerUpdate(dt, self.windowWidth)
end


function Parallax:draw()
    Layer:drawLayer(LayerA.img, LayerA.img2, LayerA.x, LayerA.x2, LayerA.y, LayerA.imgW, LayerA.img2W, LayerA.imgH, LayerA.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(LayerB.img, LayerB.img2, LayerB.x, LayerB.x2, LayerB.y, LayerB.imgW, LayerB.img2W, LayerB.imgH, LayerB.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(LayerC.img, LayerC.img2, LayerC.x, LayerC.x2, LayerC.y, LayerC.imgW, LayerC.img2W, LayerC.imgH, LayerC.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(LayerD.img, LayerD.img2, LayerD.x, LayerD.x2, LayerD.y, LayerD.imgW, LayerD.img2W, LayerD.imgH, LayerD.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(LayerE.img, LayerE.img2, LayerE.x, LayerE.x2, LayerE.y, LayerE.imgW, LayerE.img2W, LayerE.imgH, LayerE.img2H, self.windowWidth, self.windowHeight)
    Layer:drawLayer(LayerF.img, LayerF.img2, LayerF.x, LayerF.x2, LayerF.y, LayerF.imgW, LayerF.img2W, LayerF.imgH, LayerF.img2H, self.windowWidth, self.windowHeight)  
end

