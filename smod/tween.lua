local tween = {}
tween.tweentype = {
  lineal = function(st,en,time,total,inout)
    if inout == "in" then
      return st + (en - st) * (1 - time/total)
    elseif inout == "out" then
      return st + (en - st) * (1 - time/total)
    end
  end
}
function tween:create(object,tipe,mode,time,cuality,destiny)
  if type(object[cuality]) == "table" then
    local starterposition = object[cuality]
    local timer = love.timer.getTime()
    function t:play()
      add(function()
        while time - (love.timer.getTime() - timer) > 0 do
          local x = tween.tweentype[tipe](
          starterposition.x,destiny.x,
          time - (love.timer.getTime() - timer),time,
          mode)

          local y = tween.tweentype[tipe](
          starterposition.y,destiny.y,
          time - (love.timer.getTime() - timer),time,
          mode)
          object[cuality] = vector2.new(x,y)
          wait()
        end
        object[cuality] = destiny
      end)
    end
  else
    local starterposition = object[cuality]
    local timer = love.timer.getTime()
    function t:play()
      add(function()
        while time - (love.timer.getTime() - timer) > 0 do
          object[cuality] = tween.tweentype[tipe](
          starterposition,destiny,
          time - (love.timer.getTime() - timer),time,
          mode)
          wait()
        end
        object[cuality] = destiny
      end)
    end
  end
  return t
end

return tween
