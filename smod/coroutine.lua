--Seran la instancia coroutina

local coreinst = {
  status = function(self) return coroutine.status(self.coroutine) end,
  destroy = function(self) self = nil end,
  loop = true,
  type = "coroutine",
  args = ... ,
  coroutine = null
}
function coreinst:update()
  if self:status() == "dead" then self:destroy() return true
  else coroutine.resume(self.coroutine,self.args) return false end
end
function coreinst:new(content,...)
  local t = {}; for i,v in pairs(coreinst) do t[i] = v end
  if type(content) == "function" then t.args = ...
    t.coroutine = coroutine.create(content,args)
  elseif type(content) == "string" then
    local sucess,err = loadfile(love.filesystem.getSource()..content)
    if not sucess then error("\n\n\n something get wrong:\n\n >>>>"..err) end
    t.coroutine = coroutine.create(sucess)
  end
  return t
end
return coreinst
