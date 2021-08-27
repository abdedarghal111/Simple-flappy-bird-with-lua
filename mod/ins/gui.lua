--Instancia del gui

local gui = {
  --text = "nil",
  --font = nil,
  class = "text_gui",
  position = vector2.new(),
  size = vector2.new(),
  render = true,
  transpareny = 0,
  bordercolor = {0,0,0},
  textcolor = {0,0,0},
  backgroundcolor = {0,0,0},
  mouseclickactivate = false,
  mousehoveron_ = false,
  mousehoveronactivate = false,
  mousehoveroff_ = true,
  mousehoveroffactivate = false,
  objects = {}
}

gui.objects = {
  --texto = text:new(),
  --fondo = cube:new(),
  --arriba = cube:new(),
  --abajo = cube:new(),
  --derecha = cube:new(),
  --izquierda = cube:new()
}

function gui:aplycolors()
  self.objects.arriba:setcolor(unpack(self.bordercolor))
  self.objects.abajo:setcolor(unpack(self.bordercolor))
  self.objects.derecha:setcolor(unpack(self.bordercolor))
  self.objects.izquierda:setcolor(unpack(self.bordercolor))
  self.objects.fondo:setcolor(unpack(self.backgroundcolor))
  self.objects.texto:setcolor(unpack(self.textcolor))
end

function gui:newzindex(zindex)
  self.objects.arriba:newzindex(zindex)
  self.objects.abajo:newzindex(zindex)
  self.objects.derecha:newzindex(zindex)
  self.objects.izquierda:newzindex(zindex)
  self.objects.fondo:newzindex(zindex)
  self.objects.texto:newzindex(zindex + 1)
end

function gui:mouseclick(cosas)
  self.mouseclickactivate = true
  add(function()
    while wait() do
      if self.mouseclickactivate == false then
        break
      end
      local x,y = love.mouse.getX(),love.mouse.getY()
      if love.mouse.isDown(1) then
        if  x > self.position.x and x < (self.position.x + self.size.x)
        and y > self.position.y and y < (self.position.y + self.position.x) then
          cosas()
        end
      end
    end
  end)
end

function gui:mouseclickdisconnect()
  self.mouseclickactivate = false
end

function gui:mousehoveron(cosas)
  self.mousehoveronnactivate = true
  add(function()
    while wait() do
      if self.mousehoveronnactivate == false then
        break
      end
      if self.mousehoveroff_ then
        local x,y = love.mouse.getX(),love.mouse.getY()
        if  x > self.position.x and x < (self.position.x + self.size.x)
        and y > self.position.y and y < (self.position.y + self.size.y) then
          self.mousehoveroff_ = false
          self.mousehoveron_ = true
          cosas()
        end
      end
    end
  end)
end

function gui:mousehoverondisconnect()
  self.mouseclickactivate = false
end

function gui:mousehoveroff(cosas)
  self.mousehoveroffactivate = true
  add(function()
    while wait() do
      if self.mousehoveroffactivate == false then
        break
      end
      if self.mousehoveron_ then
        local x,y = love.mouse.getX(),love.mouse.getY()
        if  not (x > self.position.x and x < (self.position.x + self.size.x)
        and y > self.position.y and y < (self.position.y + self.size.y)) then
          self.mousehoveroff_ = true
          self.mousehoveron_ = false
          cosas()
        end
      end
    end
  end)
end

function gui:mousehoveroffdisconnect()
  self.mouseclickactivate = false
end

function gui:new(x,y,xx,yy)
  local x,y = x or 0,y or 0
  local xx,yy = xx or 0,yy or 0
  t = {}
  for i,v in pairs(gui) do
    t[i] = v
  end
  t.position = vector2.new(xx,yy)
  t.size = vector2.new(x,y)
  local s = x*0.1
  t.objects = {
    texto     = text:new(x-2*s,y-2*s,xx+s,yy+s,255,255,255),
    fondo     = cube:new(x-2*s,y-2*s,xx+s,yy+s,255,255,255),
    arriba    = cube:new(x,s,xx,yy,255,0,0),
    abajo     = cube:new(x,s,xx,yy+y-s,0,255,0),
    derecha   = cube:new(s,y-2*s,xx+x-s,yy+s,0,0,255),
    izquierda = cube:new(s,y-2*s,xx,yy+s,100,100,100)
  }
  t.objects.texto:newzindex(1)
  return t
end

return gui
