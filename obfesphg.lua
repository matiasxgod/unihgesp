local v0=Instance.new("ScreenGui");v0.Parent=game.CoreGui;local v3=Instance.new("Frame");v3.Size=UDim2.new(0 + 0 ,1537 -(13 + 1224) ,0,1041 -(368 + 423) );v3.Position=UDim2.new(0 -0 ,68 -(10 + 8) ,0 -0 ,50);v3.BackgroundColor3=Color3.fromRGB(45,487 -(416 + 26) ,143 -98 );v3.BorderSizePixel=2;v3.BorderColor3=Color3.fromRGB(35 + 45 ,80,80);v3.Active=true;v3.Draggable=true;v3.Parent=v0;local v12=Instance.new("TextButton");v12.Size=UDim2.new(0 -0 ,30,0,468 -(145 + 293) );v12.Position=UDim2.new(431 -(44 + 386) , -(1521 -(998 + 488)),0,2 + 3 );v12.Text="X";v12.TextColor3=Color3.fromRGB(209 + 46 ,255,1027 -(201 + 571) );v12.BackgroundColor3=Color3.fromRGB(1393 -(116 + 1022) ,0,0 -0 );v12.BorderSizePixel=0 + 0 ;v12.Parent=v3;local v20=Instance.new("TextLabel");v20.Size=UDim2.new(0.8 -0 ,0 -0 ,859 -(814 + 45) ,73 -43 );v20.Text="Universal Highlight ESP";v20.TextColor3=Color3.fromRGB(14 + 241 ,91 + 164 ,255);v20.BackgroundColor3=Color3.fromRGB(935 -(261 + 624) ,88 -38 ,1130 -(1020 + 60) );v20.TextScaled=true;v20.Parent=v3;local v27=Instance.new("TextButton");v27.Size=UDim2.new(0,1503 -(630 + 793) ,0 -0 ,142 -112 );v27.Position=UDim2.new(0 + 0 ,34 -24 ,1747 -(760 + 987) ,1953 -(1789 + 124) );v27.Text="ESP: OFF";v27.TextColor3=Color3.fromRGB(1021 -(745 + 21) ,88 + 167 ,701 -446 );v27.BackgroundColor3=Color3.fromRGB(274 -204 ,1 + 69 ,55 + 15 );v27.Parent=v3;local v34=Instance.new("TextButton");v34.Size=UDim2.new(1055 -(87 + 968) ,440 -340 ,0 + 0 ,67 -37 );v34.Position=UDim2.new(0,1423 -(447 + 966) ,0 -0 ,1897 -(1703 + 114) );v34.Text="Team Check: OFF";v34.TextColor3=Color3.fromRGB(956 -(376 + 325) ,417 -162 ,784 -529 );v34.BackgroundColor3=Color3.fromRGB(70,21 + 49 ,154 -84 );v34.Parent=v3;local v41=Instance.new("TextButton");v41.Size=UDim2.new(14 -(9 + 5) ,556 -(85 + 291) ,1265 -(243 + 1022) ,114 -84 );v41.Position=UDim2.new(0,9 + 1 ,0,1300 -(1123 + 57) );v41.Text="Change Color";v41.TextColor3=Color3.fromRGB(208 + 47 ,509 -(163 + 91) ,255);v41.BackgroundColor3=Color3.fromRGB(100,100,100);v41.Parent=v3;local v48=Instance.new("Frame");v48.Size=UDim2.new(1930 -(1869 + 61) ,180,0,3 + 7 );v48.Position=UDim2.new(0,35 -25 ,0 -0 ,22 + 138 );v48.BackgroundColor3=Color3.fromRGB(100,137 -37 ,94 + 6 );v48.Parent=v3;local v53=Instance.new("Frame");v53.Size=UDim2.new(0,1484 -(1329 + 145) ,971 -(140 + 831) ,10);v53.Position=UDim2.new(1850 -(1409 + 441) ,718 -(15 + 703) ,0 + 0 ,438 -(262 + 176) );v53.BackgroundColor3=Color3.fromRGB(1976 -(345 + 1376) ,688 -(198 + 490) ,0 -0 );v53.BorderSizePixel=0;v53.Parent=v48;local v59=2 -1 ;local v60={Color3.fromRGB(534 -279 ,1262 -(1091 + 171) ,0),Color3.fromRGB(0 + 0 ,802 -547 ,0 -0 ),Color3.fromRGB(0,374 -(123 + 251) ,1267 -1012 ),Color3.fromRGB(255,22 + 233 ,0 + 0 ),Color3.fromRGB(1091 -(660 + 176) ,0,255),Color3.fromRGB(0 + 0 ,457 -(14 + 188) ,255)};local v61=0.5;local v62=false;local function v63(v70,v71,v72) local v73=v70:FindFirstChildOfClass("Highlight");if v71 then local v89=675 -(534 + 141) ;while true do if (v89==(0 + 0)) then if  not v73 then local v118=0;while true do if (v118==0) then v73=Instance.new("Highlight");v73.Parent=v70;break;end end end v73.FillColor=v60[v59];v89=1 + 0 ;end if (v89==(2 + 0)) then v73.OutlineTransparency=v61;break;end if (v89==(1 -0)) then v73.OutlineColor=v60[v59];v73.FillTransparency=v61;v89=2 -0 ;end end elseif v73 then v73:Destroy();end end local v64=false;local function v65() local v74=0 -0 ;local v75;local v76;local v77;while true do if (v74==(0 + 0)) then v75=0;v76=nil;v74=1 + 0 ;end if (v74==(397 -(115 + 281))) then v77=nil;while true do if (v75==(4 -2)) then for v119,v120 in pairs(game.Players:GetPlayers()) do if (v120.Character and ( not v62 or (v120.Team~=v77))) then v63(v120.Character,v64,v120.Team);end end break;end if (v75==0) then v64= not v64;v27.Text=(v64 and "ESP: ON") or "ESP: OFF" ;v75=1 + 0 ;end if (1==v75) then v76=game.Players.LocalPlayer;v77=v76.Team;v75=2;end end break;end end end v27.MouseButton1Click:Connect(v65);local function v66() local v78=0;while true do if (v78==(0 -0)) then v59=(v59% #v60) + (3 -2) ;if v64 then local v110=867 -(550 + 317) ;local v111;local v112;while true do if (v110==(1 -0)) then for v132,v133 in pairs(game.Players:GetPlayers()) do if (v133.Character and ( not v62 or (v133.Team~=v112))) then v63(v133.Character,true,v133.Team);end end break;end if ((0 -0)==v110) then v111=game.Players.LocalPlayer;v112=v111.Team;v110=2 -1 ;end end end break;end end end v41.MouseButton1Click:Connect(v66);v34.MouseButton1Click:Connect(function() local v79=0;local v80;while true do if (v79==0) then v80=0;while true do if (v80==(285 -(134 + 151))) then v62= not v62;v34.Text=(v62 and "Team Check: ON") or "Team Check: OFF" ;v80=1666 -(970 + 695) ;end if (v80==(1 -0)) then if v64 then local v125=0;local v126;local v127;while true do if (v125==(1990 -(582 + 1408))) then local v135=0 -0 ;while true do if (1==v135) then v125=1;break;end if (v135==0) then v126=game.Players.LocalPlayer;v127=v126.Team;v135=1 -0 ;end end end if (v125==(3 -2)) then for v136,v137 in pairs(game.Players:GetPlayers()) do if (v137.Character and ( not v62 or (v137.Team~=v127))) then v63(v137.Character,true,v137.Team);else v63(v137.Character,false,v137.Team);end end break;end end end break;end end break;end end end);v12.MouseButton1Click:Connect(function() local v81=1824 -(1195 + 629) ;while true do if (v81==(1 -0)) then for v99,v100 in pairs(game.Players:GetPlayers()) do if v100.Character then v63(v100.Character,false,v100.Team);end end break;end if (v81==0) then v0:Destroy();v64=false;v81=242 -(187 + 54) ;end end end);local v67=false;v48.InputBegan:Connect(function(v82) if (v82.UserInputType==Enum.UserInputType.MouseButton1) then local v90=0;while true do if (v90==0) then v67=true;v3.Active=false;break;end end end end);v48.InputEnded:Connect(function(v83) if (v83.UserInputType==Enum.UserInputType.MouseButton1) then local v91=780 -(162 + 618) ;local v92;while true do if (v91==(0 + 0)) then v92=0 + 0 ;while true do if (v92==0) then v67=false;v3.Active=true;break;end end break;end end end end);v48.InputChanged:Connect(function(v84) if (v67 and (v84.UserInputType==Enum.UserInputType.MouseMovement)) then local v93=v84.Position.X;local v94=v48.AbsoluteSize.X;local v95=math.clamp((v93-v48.AbsolutePosition.X)/v94 ,0 -0 ,1 -0 );v53.Position=UDim2.new(v95,0 + 0 ,1636 -(1373 + 263) ,1000 -(451 + 549) );v61=v95;if v64 then local v101=0 + 0 ;local v102;local v103;while true do if (v101==(0 -0)) then v102=game.Players.LocalPlayer;v103=v102.Team;v101=1 -0 ;end if (v101==(1385 -(746 + 638))) then for v129,v130 in pairs(game.Players:GetPlayers()) do if (v130.Character and ( not v62 or (v130.Team~=v103))) then v63(v130.Character,true,v130.Team);end end break;end end end end end);local v68=game:GetService("UserInputService");local v69=true;v68.InputBegan:Connect(function(v85,v86) if v86 then return;end if ((v85.UserInputType==Enum.UserInputType.Keyboard) and (v85.KeyCode==Enum.KeyCode.RightControl)) then local v97=0 + 0 ;local v98;while true do if (v97==(0 -0)) then v98=341 -(218 + 123) ;while true do if (v98==0) then v69= not v69;v0.Enabled=v69;break;end end break;end end end end);game.Players.PlayerAdded:Connect(function(v87) v87.CharacterAdded:Connect(function(v88) if v64 then v63(v88,true,v87.Team);end end);end);
-- ⚠️ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--
