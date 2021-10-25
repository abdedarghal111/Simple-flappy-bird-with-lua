local tween = {}
tween.tweentype = {
  lineal = function(st,en,time,total)
    local progress,tamano = 1 - time/total,en - st
    return st + (tamano) * progress
  end,

  exponential = function(st,en,time,total)
    local progress,tamano = 1 - time/total,en - st
    if tamano >= 0 then
      return st + math.sqrt(tamano) ^ (2 * progress)
    else
      tamano = tamano * -1
      return st - math.sqrt(tamano) ^ (2 * progress)
    end
  end,

  softland = function(st,en,time,total)
    local progress,tamano = 1 - time/total,en - st
    return st + tamano * math.sin(progress * math.pi/2)
  end,

  softexponential = function(st,en,time,total)
    local progress,tamano = 1 - time/total,en - st
    if tamano >= 0 then
      return st + ((progress/tamano)^progress)^(-1)
    else
      tamano = tamano * -1
      return st - ((progress/tamano)^progress)^(-1)
    end
  end,

  softbounce = function(st,en,time,total)
    local progress,tamano = 1 - time/total,en - st
    return st + tamano * math.sin(progress * 2) * 1.1
  end
}
function tween:create(object,tipe,time,cuality,destiny,isagui,function_)
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
          if isagui then
            object[function_](object)
          end
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
          if isagui then
            object[function_](object)
          end
          wait()
        end
        object[cuality] = destiny
      end)
    end
  end
  return t
end

return tween
