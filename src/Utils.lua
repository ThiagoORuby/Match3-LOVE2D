--[[
    Util functions to game
]]

-- For each row in image, save two sets of 6 cols with different indices 
function GenerateTileQuads(atlas)
    local tiles = {} -- table

    local x, y = 0, 0

    local counter = 0

    for row =1, 9 do
        
        for i =1, 2 do

            tiles[counter] = {}

            for col = 1, 6 do
                table.insert(tiles[counter], love.graphics.newQuad(
                    x, y, 32, 32, atlas:getDimensions()))

                x = x + 32
            end

            counter = counter + 1
        end
        y = y + 32
        x = 0
    end

    return tiles
end