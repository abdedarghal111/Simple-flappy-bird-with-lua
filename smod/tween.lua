local tween = {}
tween.tweentype = {
  lineal = function(st,en,time,total)
    local progress = 1 - time/total
    return st + (en - st) * progress
  end,

  exponential = function(st,en,time,total)
    local progress = 1 - time/total
    return st + math.sqrt(en - st) ^ (2 * progress)
  end,

  softland = function(st,en,time,total)
    local progress,tamano = 1 - time/total,en - st
    return st + tamano * math.sin(progress * 1.5)
  end,

  softexponential = function(st,en,time,total)
    local progress,tamano = 1 - time/total,en - st
    return st + ((progress/tamano)^progress)^(-1)
  end,

  softbounce = function(st,en,time,total)
    local progress,tamano = 1 - time/total,en - st
    return st + tamano * math.sin(progress * 2) * 1.1
  end
}
function tween:create(object,tipe,time,cuality,destiny)
  local t = {}
  if type(object[cuality]) == "table" then
    function t:play()
      local starterposition = object[cuality]
      local timer = love.timer.getTime()
      add(function()
        while time - (love.timer.getTime() - timer) > 0 do
          local x = tween.tweentype[tipe](
          starterposition.x,destiny.x,
          time - (love.timer.getTime() - timer),time)

          local y = tween.tweentype[tipe](
          starterposition.y,destiny.y,
          time - (love.timer.getTime() - timer),time)
          object[cuality] = vector2.new(x,y)
          wait()
        end
        object[cuality] = destiny
      end)
    end
  else
    function t:play()
      local starterposition = object[cuality]
      local timer = love.timer.getTime()
      add(function()
        while time - (love.timer.getTime() - timer) > 0 do
          object[cuality] = tween.tweentype[tipe](
          starterposition,destiny,
          time - (love.timer.getTime() - timer),time)
          wait()
        end
        object[cuality] = destiny
      end)
    end
  end
  return t
end

return tween
