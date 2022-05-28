function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('DodgeMechs');
	precacheSound('dodge');
    precacheSound('countdown finish');
end

function onEvent(name, value1, value2)
    if name == "Sans_Dodge" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('Dodge Mechanics NM', 'DodgeMechs', getProperty('boyfriend.x')-250, getProperty('boyfriend.y')-85);
    luaSpriteAddAnimationByPrefix('Dodge Mechanics NM', 'Warning', 'Alarm', 20, false);
	luaSpritePlayAnimation('Dodge Mechanics NM', 'Warning');
    addLuaSprite('Dodge Mechanics NM', true); 
    runTimer('Dissapear', 0.35)
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
    playSound('notice', 1);
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   
   Dodged = true;
   playSound('dodge', 1);
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
    setProperty('boyfriend.specialAnim', true);
   Dodged = false
   setProperty('Dodge Mechanics NM.alpha', 1)
   characterPlayAnim('boyfriend', 'dodge', true);
   luaSpriteAddAnimationByPrefix('Dodge Mechanics NM', 'Attack', 'Bones boi', 20, false);
   luaSpritePlayAnimation('Dodge Mechanics NM', 'Attack');
   runTimer('Bones', 1.1)
   elseif tag == 'Bones' then
    removeLuaSprite('Dodge Mechanics NM', true)
   elseif tag == 'Dissapear' then
       setProperty('Dodge Mechanics NM.alpha', 0)
   end
end