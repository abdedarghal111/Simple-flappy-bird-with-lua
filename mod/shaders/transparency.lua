return love.graphics.newShader [[
    extern number transparency;
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords)
    {
        return vec4(color.x,color.y,color.z, transparency);
    }
]]
