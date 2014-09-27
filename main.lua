function love.load()
    text = "Hello World!"
    Tileset = love.graphics.newImage('res/countryside.png');
    
    tileW, tileH = 32,32
    local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
    
    Quads = {}
    Quads[1] = love.graphics.newQuad(0,   0, tileW, tileH, tilesetW, tilesetH) -- 1 = grass
	  Quads[2] = love.graphics.newQuad(32,  0, tileW, tileH, tilesetW, tilesetH) -- 2 = box
	  Quads[3] = love.graphics.newQuad(0,  32, tileW, tileH, tilesetW, tilesetH) -- 3 = flowers
	  Quads[4] = love.graphics.newQuad(32, 32, tileW, tileH, tilesetW, tilesetH) -- 4 = boxtop

	TileTable = {
  { 4,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4 },
  { 4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,4 },
  { 4,1,3,1,1,1,1,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,4 },
  { 4,1,1,1,1,1,1,1,2,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,4 },
  { 4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4 },
  { 4,1,1,4,1,1,1,1,1,2,2,1,1,4,1,1,1,4,1,4,2,2,1,1,4 },
  { 4,1,1,4,1,1,1,1,4,3,3,4,1,2,1,1,1,2,1,4,1,1,1,1,4 },
  { 4,1,1,4,1,1,1,1,4,3,3,4,1,1,4,1,4,1,1,4,2,2,1,1,4 },
  { 4,1,1,4,1,1,1,1,4,3,3,4,1,1,2,1,2,1,1,4,1,1,1,1,4 },           
  { 4,1,1,4,1,1,1,1,2,3,3,2,1,1,1,4,1,1,1,4,1,1,1,1,4 },
  { 4,1,1,2,2,2,2,1,1,2,2,1,1,1,1,2,1,3,1,2,2,2,1,1,4 },
  { 4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4 },
  { 4,1,1,1,1,1,1,1,1,2,1,1,1,1,2,2,4,1,1,1,1,1,1,1,4 },
  { 4,1,1,1,1,1,1,1,4,3,4,1,1,1,1,1,2,1,1,1,1,1,1,1,4 },
  { 4,1,1,3,1,1,1,1,2,3,2,1,1,1,1,2,1,1,1,1,1,1,1,1,4 },
  { 4,1,1,1,1,1,1,1,1,2,1,1,2,1,2,1,1,1,1,1,1,1,3,1,4 },
  { 4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4 },
  { 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 }
}

end

function love.update(dt)
end

function love.draw()
  for rowIndex = 1, #TileTable do
    local row = TileTable[rowIndex]
    for columnIndex = 1, #row do
      local number = row[columnIndex]
      love.graphics.draw(Tileset, Quads[number], (columnIndex - 1) * tileW, (rowIndex - 1) * tileH)
    end
  end
end

