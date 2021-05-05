function love.load()
  assert(loadfile(love.filesystem.getSource().."core.lua"))()
  cube = require"mod/ins/cube"
  e = cube:new()
end
function love.draw()
  e:draw()
  update()
end
