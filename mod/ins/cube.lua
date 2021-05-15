--instancia del cubo
--TODO: hacer mover al render y mas cosas esenciales

local render = require"smod/render"

local cube = {
  position = vector2.new(),
  type = "cube",
  size = vector2.new(),
  rotation = 0,
  render = true,
  LocInRen = null,
  color = {r = 255,g = 255,b = 255},
  mode = "fill"
}
function cube:setcolor(r,g,b)
  self.color = {r or self.color.r,g or self.color.g,b or self.color.b}

function cube:new(a,e,x,z)
  local t = {}
  for i,v in pairs(cube) do
    t[i] = v
  end
  t.position,t.size = vector2.new(a,e),vector2.new(x or 100,z or 100)
  render.add(t)
  return t
end

--TODO: function cube:zindex()

function cube:draw()
  if self.render then
      love.graphics.translate(self.position.x + self.size.x/2,self.position.y + self.size.y/2)
      love.graphics.rotate(self.rotation/360*math.pi)
      love.graphics.translate(-self.size.x/2,-self.size.y/2)
      love.graphics.setColor(self.color.r/255,self.color.g/255,self.color.b/255)
      love.graphics.rectangle("fill",0,0,self.size.x,self.size.y)
      love.graphics.origin()
    end
end

return cube
