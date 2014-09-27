-- main.lua class

require ("unit")

windowl = 1440
windowh = 900

function love.load()
  Tileset = love.graphics.newImage('res/SRPG_spritesheet.png')
  TilesetUnit = love.graphics.newImage('res/SRPG_unitspritesheet.png')
    
  tileW, tileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()

  state = 1

  -- Actual tile set
  qMapTiles = {}
  qMapTiles[1] = love.graphics.newQuad(0,   0, 63, 31, tilesetW, tilesetH)        -- button one
  qMapTiles[3] = love.graphics.newQuad(128,  0, 32, 32, tilesetW, tilesetH)       -- empty hex grid

  -- Actual Unit sprite set
  _G.qUnitOverLay = {}
  _G.qUnitOverLay[1] = love.graphics.newQuad(0, 0, 32, 32, tilesetW, tilesetH)       -- unit one
  _G.qUnitOverLay[2] = love.graphics.newQuad(32, 0, 32, 32, tilesetW, tilesetH)      -- cursor
  _G.qUnitOverLay[3] = love.graphics.newQuad(256, 256, 32, 32, tilesetW, tilesetH)   -- empty space

  -- qMapTiles = {}
  -- qMapTiles[1] = love.graphics.newQuad(0,   0, tileW, tileH, tilesetW, tilesetH) -- 1 = grass
  -- qMapTiles[2] = love.graphics.newQuad(32,  0, tileW, tileH, tilesetW, tilesetH) -- 2 = box
  -- qMapTiles[3] = love.graphics.newQuad(0,  32, tileW, tileH, tilesetW, tilesetH) -- 3 = flowers
  -- qMapTiles[4] = love.graphics.newQuad(32, 32, tileW, tileH, tilesetW, tilesetH) -- 4 = boxtop
  -- qGame = {}
  -- qGameOver = {}
  -- qWon = {}


  -- game states
  MapStates = {}
  mMainMenu = {}
  mGame = {}
  mGameOver = {}
  mWon = {}

  --QuadsStates[3] = qGameOver
  --QuadsStates[4] = qWon

  -- level 1 :D
  -- THIS IS THE ACTUAL MAP FUCK
  mGameMap = {}
  for rowIndex = 1, 13 do
    mGameMap[rowIndex] = {}
    for columnIndex = 1, 22 do
      mGameMap[rowIndex][columnIndex] = 3  
    end
  end

  firstKnight = UnitClass:new("player", "Knight", 1, 1)

  -- UNIT MAP OVERLAID ON THE MAP FUCK

  mUnitOverLay = {
    {firstKnight, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3},
    {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3}
  }

  -- for rowIndex = 1, 13 do
  --   mUnitOverLay[rowIndex] = {}
  --   for columnIndex = 1, 22 do
  --     mUnitOverLay[1][1] = 1
  --   end
  -- end

  -- --
  -- MapStates[1] = mMainMenu
  -- MapState[2] = mGame
  -- MapStates[3] = mGameOver
  -- MapStates[4] = mWon

  -- quad states
  QuadsStates = {} 
  QuadsStates[1] = qMapTiles
  QuadsStates[2] = mGameMap
  selectedUnit = nil

end

-- function setupMap(length, width)
--   mapWidth = width
--   mapHeight = length
  
--   map = {}
--   for x = 1,mapWidth do
--     map[x] = {}
--     for y = 1,mapHeight do
--       map[x][y] = love.math.random(1,4)
--     end
--   end

--   return map

-- end

function love.update(dt)

end

function love.draw()
  -- for rowIndex = 1, #usingMap do
  --   local row = usingMap[rowIndex]
  --   for columnIndex = 1, #row do
  --     local number = row[columnIndex]
  --     love.graphics.draw(Tileset, qMapTiles[number], (columnIndex - 1) * tileW, (rowIndex - 1) * tileH)
  --   end
  -- end
  scaleFactorX = 2.25
  scaleFactorY = 2.23
  love.graphics.scale(2.25, 2.23)
  if state == 1 then
    windowl_button = (((windowl / 2) - (32 * scaleFactorX)) / scaleFactorX)
    windowh_button = (((windowh / 2) + 16 * scaleFactorY) / scaleFactorY)
    love.graphics.draw(Tileset, qMapTiles[1], windowl_button, windowh_button)
    love.graphics.draw(Tileset, qMapTiles[1], windowl_button, windowh_button + 64)
  elseif state == 2 then
    for rowIndex = 1, #mGameMap do
      local mrow = mGameMap[rowIndex]
      local urow = mUnitOverLay[rowIndex]
      for columnIndex = 1, #mrow do
        local mnumber = mrow[columnIndex]
        local unumber = urow[columnIndex]
        if unumber ~= 3 then
          unumber = unumber:getSpriteValue()
        end
        love.graphics.draw(Tileset, qMapTiles[mnumber], (columnIndex - 1) * tileW, (rowIndex - 1) * tileH)
        love.graphics.draw(TilesetUnit, _G.qUnitOverLay[unumber], (columnIndex - 1) * tileW, (rowIndex - 1) * tileH)
      end
    end
    love.graphics.draw(TilesetUnit, _G.qUnitOverLay[2], ((love.mouse.getX() / scaleFactorX) - (love.mouse.getX() / scaleFactorX) % 32), ((love.mouse.getY() / scaleFactorY) - (love.mouse.getY() / scaleFactorY) % 32))
  end
end

function love.mousepressed(x, y, button)
  if button == 'l' then
    if state == 1 then
      if ((windowl_button * scaleFactorX < x) and (x < windowl_button * scaleFactorX + 64 * scaleFactorX) and (windowh_button * scaleFactorY < y) and (y < windowh_button * scaleFactorY + 32 * scaleFactorY)) then
        state = 2
        love.mouse.setVisible(false)
      end
    elseif state == 2 then
      xCoord = ((love.mouse.getX() / scaleFactorX) - (love.mouse.getX() / scaleFactorX) % 32)
      yCoord = ((love.mouse.getY() / scaleFactorY) - (love.mouse.getY() / scaleFactorY) % 32)
      unitSelect = mUnitOverLay[yCoord % 13 + 1][xCoord % 22 + 1]
      if selectedUnit ~= nil then
        if unitSelect == 3 then
          io.write(string.format("Selected Unit Positions are %d and %d\n", selectedUnit.attack, selectedUnit.sprite))
          mUnitOverLay[selectedUnit.xpos][selectedUnit.ypos] = 3
          mUnitOverLay[yCoord % 13 + 1][xCoord % 22 + 1] = selectedUnit
          selectedUnit.xpos = xCoord % 13 + 1
          selectedUnit.ypos = yCoord % 22 + 1
          selectedUnit = nil
        end
      elseif unitSelect ~= 3 then
        selectedUnit = unitSelect
              -- check if there is a unit there and then check its movement radius.
      -- highlight unit
      -- if (unitIsThere())
      -- {
      --    highlight unit and show movemement radius
      -- }
      -- elseif (unitIsHighlited())
      -- {
      --    movem that unit into a that square that is in the highlited radius
      -- }
      end
    end
  end
end