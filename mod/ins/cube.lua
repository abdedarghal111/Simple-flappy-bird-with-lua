--instancia del cubo
--TODO: hacer mover al render y mas cosas esenciales

local render = require"smod/render"
local transparency = require"mod/shaders/transparency"

local cube = {
  position = vector2.new(),
  type = "cube",
  size = vector2.new(),
  rotation = 0,
  render = true,
  LocInRen = null,
  color = {r = 255,g = 255,b = 255},
  mode = "fill",
  zindex = 0,
  zindexid = "",
  transparency = 0
}
function cube:setcolor(r,g,b)
  self.color.r = r or self.color.r
  self.color.g = g or self.color.g
  self.color.b = b or self.color.b
end

function cube:new(a,e,x,z,r,g,b)
  local t = {}
  for i,v in pairs(cube) do
    t[i] = v
  end
  t.color = {r = r or 255,g = g or 255,b = b or 255}
  t.position,t.size = vector2.new(a,e),vector2.new(x or 100,z or 100)
  render.add(t,0)
  return t
end

function cube:newzindex(newzindex)
  render.changezindex(self,newzindex)
end

function cube:draw()
  if self.render then
    love.graphics.setShader(transparency)
    transparency:send("transparency",1-self.transparency)
    love.graphics.translate(self.position.x + self.size.x/2,self.position.y + self.size.y/2)
    love.graphics.rotate(self.rotation/360*math.pi)
    love.graphics.translate(-self.size.x/2,-self.size.y/2)
    love.graphics.setColor(self.color.r/255,self.color.g/255,self.color.b/255)
    love.graphics.rectangle("fill",0,0,self.size.x,self.size.y)
    love.graphics.origin()
    love.graphics.setShader()
  end
end

return cube
