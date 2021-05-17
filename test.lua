cube = require"mod/ins/cube"
uno = cube:new() uno.position = vector2.new(20,20)
dos = cube:new(); dos:setcolor(100,100,100)

while true do
  for i = 0,1,0.01 do
    wait()
    uno.transparency = i
  end
  for i = 1,0,-0.01 do
    wait()
    uno.transparency = i
  end
end
