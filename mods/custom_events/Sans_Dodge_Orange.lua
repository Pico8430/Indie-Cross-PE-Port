function onCreate()
    --variables
	DodgedOrange = false;
    canDodgeOrange = false;
    DodgeTime = 0;
	
    precacheImage('Sans_Shit_NM');
	precacheSound('dodge');
    precacheSound('countdown finish');
end

function onEvent(name, value1, value2)
    if name == "Sans_Dodge_Orange" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('Dodge Mechanics NM', 'Sans_Shit_NM', getProperty('boyfriend.x')-250, getProperty('boyfriend.y')-85);
    luaSpriteAddAnimationByPrefix('Dodge Mechanics NM', 'Warning Orange', 'AlarmOrange instance 1', 20, false);
	luaSpritePlayAnimation('Dodge Mechanics NM', 'Warning Orange');
    addLuaSprite('Dodge Mechanics NM', true); 
    runTimer('DisapearOrange', 0.35)
	
	--Set values so you can dodge
	canDodgeOrange = true;
	runTimer('DiedOrange', DodgeTime);
    playSound('notice', 1);
	
	end
end

function onUpdate()
   if canDodgeOrange == true and keyJustPressed('space') then
   
   DodgedOrange = true;
   playSound('dodge', 1);
   canDodgeOrange = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'DiedOrange' and DodgedOrange == false then
   setProperty('health', 0);
   
   elseif tag == 'DiedOrange' and DodgedOrange == true then
    setProperty('boyfriend.specialAnim', true);
   DodgedOrange = false
   setProperty('Dodge Mechanics NM.alpha', 1)
   playSound('dodge', 1);
   characterPlayAnim('boyfriend', 'dodge', true);
   luaSpriteAddAnimationByPrefix('Dodge Mechanics NM', 'Attack Orange', 'Bones Orange instance 1', 20, false);
   luaSpritePlayAnimation('Dodge Mechanics NM', 'Attack Orange');
   runTimer('BonesOrange', 1.1)
   elseif tag == 'BonesOrange' then
    removeLuaSprite('Dodge Mechanics NM', true)
   elseif tag == 'DisapearOrange' then
       setProperty('Dodge Mechanics NM.alpha', 0)
   end
end