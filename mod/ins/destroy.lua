local render = require"smod/render"

local getanddestroy

function getanddestroy(t)
  for i,v in pairs(t) do
    if type(v) == "table" and #v > 0 then
      getanddestroy(t[i])
    else
      t[i] = nil
    end
  end
  t = nil
end

return function(instance)
  render.quitzindex(instance)
  getanddestroy(instance)
  instance = nil
end
