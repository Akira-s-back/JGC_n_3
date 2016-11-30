local txtIntro = {}
txtTimer = 8
timerEcart = 1
yIntro = 720
scaleIntro = 2.5
txtIntro[1] = {"...Il y a bien longtemps ...", txtTimer, yIntro, scaleIntro}
txtIntro[2] = {"...dans une galaxie très éloignée...", txtTimer, yIntro, scaleIntro}
txtIntro[3] = {"...bon en fait il y a 3 semaines...", txtTimer, yIntro, scaleIntro}
txtIntro[4] = {"...et pas très loin d'ici...", txtTimer, yIntro, scaleIntro}
txtIntro[5] = {"...pour la Jam Gamecodeur N° 3...", txtTimer, yIntro, scaleIntro}
txtIntro[6] = {"... le sujet : LES LISTES ...", txtTimer, yIntro, scaleIntro}
txtIntro[7] = {"...   -_-   sèrieux   -_-   ...", txtTimer, yIntro, scaleIntro}
--"  _____       _____  "
--" -   -     -   - "
--"                 "
--"      !          "
--"                 "
--"   _____________   "
--" --           -- "
--"                 "


vIntro = 200

introBool = true
timerTot = txtTimer + (timerEcart* #txtIntro)
timerTotIni = txtTimer + (timerEcart* #txtIntro)
n = 1
local nIntro = 1
scaleIntro = 2

IntroUpdate = function(dt)
  introTimer = introTimer - (dt)
  if introTimer <= 0 then 
    introTimer = 0     
    introBool = false
  end
  if introBool == false then
    timerTot = timerTot - (dt)
    nIntro = math.floor((math.floor(timerTotIni - timerTot))/timerEcart) +1
    local i
    for i =1, nIntro, 1 do
    txtIntro[i][2] = txtIntro[i][2] - dt
    if txtIntro[i][2] <= 0 then txtIntro[i][2] = 0 end
    txtIntro[i][3] = (txtIntro[i][2]/txtTimer) * 0.8 * htEcran
    txtIntro[i][4] = (txtIntro[i][2]/txtTimer) * 2.5
    end
    
  end
   --
end  
--

IntroDraw = function()
  love.graphics.draw(imgVierge, 0,0)
  love.graphics.setColor(colorRed)
  --love.graphics.printf(txtIntro[n][1], 0, 200, lgEcran/scaleIntro, "center", 0, scaleIntro, scaleIntro)
  local i
  for i = 1, nIntro do
    love.graphics.printf(txtIntro[i][1], 0, txtIntro[i][3], lgEcran/txtIntro[i][4], "center", 0, txtIntro[i][4], txtIntro[i][4])
  end
  --  
  love.graphics.setColor(colorWhite)
  love.graphics.print("timer "..math.floor(100*introTimer).."  tot : "..math.floor(100*timerTot).." n : ".. n,500,500)
end
--