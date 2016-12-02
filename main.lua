-- cette ligne permet d afficher des traces ds la console pdt l'execution du code
io.stdout:setvbuf('no')

-- Empeche love2d d antialiaser
love.graphics.setDefaultFilter("nearest")

-- Permet de DEBOGUER pas a pas ds ZeroBrane
if arg[#arg] == "-debug" then require("mobdebug").start() end

require("utils")
local vertMaStar = {0,0,0,0}
function love.load()
  love.window.setMode(1024, 768)
  love.mouse.setPosition(0,0)
  monCarre = {100,100,500,100,500,500,100,500}
  monKhorne = {100,100, 300,100, 350,200, 400,100, 600,100, 600,250, 450,250, 600,500, 600,600, 450,600, 350,350, 250,600, 100,600, 250,250, 100,250}
  vertMonKhorne = ListToVertices(monKhorne)
  vertMonCarre = ListToVertices(monCarre)
  maStar = {0,-30, -20,-40, -30,-60, -40,-40, -60,-30, -40,-20, -30,0, -20,-20}--{0,0, 10,0, 10,10, 0,10}--{600, 600, 610, 600, 610,610, 600, 610}
  vertMaStar = ListToVertices(maStar)
  vertMaStar2 = vertMaStar
 print(""..#vertMaStar)
  collide = false
  love.mouse.setPosition(360,160)
end
--


function MaStarUpdate(pListe)
  local n
  local mesVertFin = {}
  mesVert = pListe
  for n = 1, #mesVert, 1 do
    local monVert = mesVert[n]
    local monMS = {}
    xMS = monVert[1] + mX
    yMS = monVert[2] + mY
    monMS = {xMS, yMS}
    table.insert(mesVertFin, monMS)
  end
  --
  return mesVertFin
end
--


function love.update(dt)
  mX, mY = love.mouse.getPosition()
  mouseVert = {mX,mY}
  vertMaStar = MaStarUpdate(vertMaStar2)
  collide = PolyVertCollision(vertMonKhorne, vertMaStar)
  
end

function love.draw()
  local n
  for n =1, #vertMonKhorne, 1 do
    nn =n+1
    if n == #vertMonKhorne then nn = 1 end
    vert1 = vertMonKhorne[n]
    vert2 = vertMonKhorne[nn]
    love.graphics.line(vert1[1], vert1[2], vert2[1], vert2[2])
    
  end
  --
  if collide == true then 
    love.graphics.setColor(255,0,0) 
  else
    love.graphics.setColor(255,255,255)
  end
  
  for n =1, #vertMaStar, 1 do
    nn =n+1
    if n == #vertMaStar then nn = 1 end
    vert1 = vertMaStar[n]
    vert2 = vertMaStar[nn]
    love.graphics.line(vert1[1], vert1[2], vert2[1], vert2[2])
    
  end
  --
  love.graphics.setColor(255,255,255)
  love.graphics.print("x : "..mX.." y : "..mY, 200,200)
  love.graphics.print(" "..vertMaStar[1][1], 200,250)
end 

function love.keypressed(key)
  


end