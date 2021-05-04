function love.load()
  assert(loadfile(love.filesystem.getSource().."core.lua"))()
  local t = function()for i = 1,100 do print(i)wait(1)end end
  add(t)
end
function love.draw()
  update()
end
