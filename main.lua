function love.load()
  assert(loadfile(love.filesystem.getSource().."core.lua"))()
  add("test.lua")
end
function love.draw()
  update()
end
