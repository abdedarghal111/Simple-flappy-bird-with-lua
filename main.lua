function love.load()
  assert(loadfile(love.filesystem.getSource().."smod/core.lua"))()
  add("game.lua")
end
function love.draw()
  update()
  love.graphics.setFont(love.graphics.newFont(20))
  love.graphics.setColor(1,1,1,1)
  love.graphics.print(love.timer.getFPS())
  love.graphics.print((math.floor(collectgarbage('count')/100)/10).."MB",0,20)
end
