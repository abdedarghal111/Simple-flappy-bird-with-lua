--encargado del render, la data la dan los modelos

local render = {capas = {}}

function render:update()
  for i,v in pairs(self.capas) do
    for i,v in pairs(v) do
      print(i)
    end
  end
end

return render
