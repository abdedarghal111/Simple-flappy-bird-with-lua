function love.load()
  assert(loadfile(love.filesystem.getSource().."smod/core.lua"))()
  add("game.lua")
end
function love.draw()
  update()
  love.graphics.setColor(1,1,1,1)
  love.graphics.print(love.timer.getFPS())
end
