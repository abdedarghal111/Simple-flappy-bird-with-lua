--instancia del cubo

local sound = {
  type = "sound",
  source = nil,
  sound = 1
}

function sound:new(source)
  local t = {}
  for i,v in pairs(sound) do
    t[i] = v
  end
  t.source = love.audio.newSource("res/sounds/"..source,"static")
  t.source:setVolume(1)
  return t
end

function sound:play()
  self.source:stop()
  self.source:play()
end

function sound:stop()
  self.source:stop()
end

return sound
