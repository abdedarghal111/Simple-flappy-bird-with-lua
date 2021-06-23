--instancia del texto

local render = require"smod/render"
local transparency = require"mod/shaders/transparency"
local fonts = require"res/fonts/font"

local text = {
  position = vector2.new(),
  type = "text",
  text = "nil",
  font = love.graphics.newFont(20),
  align = "center",
  size = vector2.new(),
  rotation = 0,
  render = true,
  LocInRen = null,
  color = {r = 255,g = 255,b = 255},
  zindex = 0,
  zindexid = "",
  transparency = 0
}

function text:setfont(fontname,size)
  if fonts[fontname] then
    self.font = love.graphics.newFont(fonts[fontname],size)
  else
    self.font = love.graphics.newFont(size)
  end
end


function text:setcolor(r,g,b)
  self.color.r = r or self.color.r
  self.color.g = g or self.color.g
  self.color.b = b or self.color.b
end

function text:new(x,z,a,e,r,g,b)
  local t = {}
  for i,v in pairs(text) do
    t[i] = v
  end
  t.font = love.graphics.newFont(20)
  t.color = {r = r or 255,g = g or 255,b = b or 255}
  t.position,t.size = vector2.new(a,e),vector2.new(x or 100,z or 100)
  render.add(t,0)
  return t
end

function text:newzindex(newzindex)
  render.changezindex(self,newzindex)
end

function text:draw()
  if self.render then
    love.graphics.setFont(self.font)
    love.graphics.setColor(self.color.r/255,self.color.g/255,self.color.b/255)
    love.graphics.printf(
      self.text,
      self.position.x,
      self.position.y + (self.size.y/2 - self.size.y*0.11),
      self.size.x,
      self.align,
      self.rotation/180*math.pi
    )
  end
end

return text
