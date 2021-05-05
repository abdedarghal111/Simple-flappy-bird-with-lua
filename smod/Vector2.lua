--[[
Este sera un modulo del vector2, Su estructura de datos sera su clase, su
posición x, su posición.la funcion "new" sera para crear un nuevo vector2 aparte
de asignarle su propia metatable que tambien estara en el mismo vector2.
--]]
local vector2 = {
  class = "vector2",
  x = 0,
  y = 0
}

--La funcion new tendra que ir separada para evitar confusiones de generaciones.
function vector2.new(x,y)
  local vec = {}
  for i,v in pairs(vector2) do
    vec[i] = v
  end
  if x ~= nil then vec.x = x end
  if y ~= nil then vec.y = y end
  setmetatable(vec,vec.mt)
  return vec
end

--su correspondiente metatable
vector2.mt = {
  --en caso de valor vacio devolvera un error
  __index = function()
    return error("\n -->(programmer):This vector2 value doesn't exist")
  end,
  --en caso de querer da un valor al vector2 te devolvera un error
  __newindex = function(args)
    error("\n -->(programmer):You can't add things to a vector2")
  end,
  --en caso de sumar vectores
  __add = function(v1,v2)
    local a = vector2.new()
    a.x = v1.x + v2.x
    a.y = v1.y + v2.y
    return a
  end,
  --en caso de restar vectores
  __sub = function(v1,v2)
    local a = vector2.new()
    a.x = v1.x - v2.x
    a.y = v1.y - v2.y
    return a
  end,
  --en caso de multiplicar vectores por un numero
  __mul = function(v1,v2)
    local a = vector2.new()
    a.x = v1.x * v2.x
    a.y = v1.y * v2
    return a
  end,
  --en caso de dividir vectores por un numero
  __div = function(v1,v2)
    local a = vector2.new()
    a.x = v1.x / v2
    a.y = v1.y / v2
    return a
  end,
  --en caso de sacar el resto de vectores con un numero
  __mod = function(v1,v2)
    local a = vector2.new()
    a.x = v1.x % v2
    a.y = v1.y % v2
    return a
  end,
  --en caso de elevar vectores a un numero
  __pow = function(v1,v2)
    local a = vector2.new()
    a.x = v1.x ^ v2
    a.y = v1.y ^ v2
    return a
  end,
  --en caso de printearla
  __tostring = function (self)
    return "("..self.x..","..self.y..")"
  end
}
setmetatable(vector2,vector2.mt)
--devolvera el vector2 en forma de modulo
_G.vector2 = vector2
