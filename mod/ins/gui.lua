--Instancia del gui

local gui = {
  font = nil,
  class = "gui",
  position = vector2.new(),
  size = vector2.new(),
  render = true,
  transpareny = 0,
  bordercolor = {0,0,0},
  textcolor = {0,0,0},
  backcolor = {0,0,0},
  objects = {}
}

gui.objects = {
  --fondo = cube:new(),
  --arriba = cube:new(),
  --abajo = cube:new(),
  --derecha = cube:new(),
  --izquierda = cube:new()
}

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
    fondo = cube:new(
    x-2*s,y-2*s,xx+s,yy+s,255,255,255
  ),
    arriba = cube:new(
    x,s,xx,yy,255,0,0
  ),
    abajo = cube:new(
    x,s,xx,yy+y-s,0,255,0
  ),
    derecha = cube:new(
    s,y-2*s,xx+x-s,yy+s,0,0,255
  ),
    izquierda = cube:new(
    s,y-2*s,xx,yy+s,100,100,100
  )
  }
  return t
end

--TODO: renderizado, mouse click

return gui
