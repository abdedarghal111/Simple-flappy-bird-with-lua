cube = require"mod/ins/cube"
uno = cube:new() uno.position = vector2.new(20,20)
dos = cube:new(); dos:setcolor(100,100,100)

while true do
  wait(0.5)
  print("changed")
  uno:newzindex(2)
  dos:newzindex(1)
  wait(0.5)
  print("changed2")
  uno:newzindex(1)
  dos:newzindex(2)
end
