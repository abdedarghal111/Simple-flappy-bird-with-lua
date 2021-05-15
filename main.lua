function love.load()
  assert(loadfile(love.filesystem.getSource().."core.lua"))()
  cube = require"mod/ins/cube"
  uno = cube:new()
  --dos = cube:new(); dos:setcolor(100,100,100)
end
function love.draw()
  update()
end
