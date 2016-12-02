
Ecrire = function (pString)
  print (pString)
end
--

ListToVertices = function(pListe)
  liste = pListe
  local listeVertice = {}
  local n
  for n =1, #liste , 2 do
    local vertice = {}
    vertice[1] = liste[n]
    vertice[2] = liste[n+1]
    table.insert(listeVertice, vertice)    
  end
  --
  return listeVertice
end
--

VertToStdLine = function(pVert1, pVert2)
  local vert1, vert2
  vert1= pVert1
  vert2 = pVert2
  vert1.x = vert1[1]
  vert1.y = vert1[2]
  vert2.x = vert2[1]
  vert2.y = vert2[2]
  local A,B,C
  A = (vert2.y - vert1.y)
  B = (vert1.x - vert2.x)
  C= A * vert1.x + B * vert1.y
  
  return {A,B,C}
end
--
SegtIntersect = function (pVert1, pVert2, pVert3, pVert4)
  local line1, line2
  line1 = VertToStdLine(pVert1, pVert2)
  line2 = VertToStdLine(pVert3, pVert4)
  local A1, A2, B1, B2, C1, C2, denom
  A1 = line1[1]
  B1 = line1[2]
  C1 = line1[3]
  A2 = line2[1]
  B2 = line2[2]
  C2 = line2[3]
  denom = (A1 * B2) - (A2 * B1)
  yZero1 = C1 / B1
  yZero2 = C2 / B2
  local xInter, yInter
  xInter = ((B2 * C1) - (B1 * C2))/ denom
  yInter = ((A1 * C2) - (A2 * C1))/ denom
  local Inter = {xInter, yInter}
  if denom ==0 then 
    if yZero1 == yZero2 then
      print("collineaires")
      return 1
    elseif yZero1 ~= yZero2 then
      --print("parallèlles")
      return nil
    end
  end 
  --
  rX0 = (xInter - pVert1[1]) / (pVert2[1] - pVert1[1])
  rY0 = (yInter - pVert1[2]) / (pVert2[2] - pVert1[2])
  rX1 = (xInter - pVert3[1]) / (pVert4[1] - pVert3[1])
  rY1 = (yInter - pVert3[2]) / (pVert4[2] - pVert3[2])
  if ( ((rX0 > 0 and rX0 <1) or (rY0 >0 and rY0 <1)) and ((rX1 > 0 and rX1 <1) or (rY1 >0 and rY1 <1)) )then  
    return Inter
  else
    return nil
  end
--
end
--
CalcDistance = function( pVert1, pVert2)
  local vert1, vert2
  vert1 = pVert1
  vert2 = pVert2
  vert1.x = vert1[1]
  vert1.y = vert1[2]
  vert2.x = vert2[1]
  vert2.y = vert2[2]
  local distance 
  distance = math.sqrt(((vert2.x-vert1.x)*(vert2.x-vert1.x)) + ((vert2.y-vert1.y)*(vert2.y-vert1.y)))
  
  return distance  
end
--
function PolyVertCollision (pListeVert1, pListeVert2)
  local liste_vert1, liste_vert2
  liste_vert1 = pListeVert1
  liste_vert2 = pListeVert2
  local n, j
  for n = 1, #liste_vert1, 1 do
    vert1 = liste_vert1[n]
    vert2 = liste_vert1[n+1]
    if n == #liste_vert1 then vert2 = liste_vert1[1] end
    for j =1, #liste_vert2, 2 do 
      vert3 = liste_vert2[j]
      vert4 = liste_vert2[j+1]
      if j == #liste_vert2 then vert4 = liste_vert2[1] end
      if SegtIntersect(vert1, vert2, vert3, vert4) then return true  end      
    end  
  end
  return false
  --  
end
--