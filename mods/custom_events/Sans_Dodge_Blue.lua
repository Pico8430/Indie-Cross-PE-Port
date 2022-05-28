function onCreate()
    --variables
    canDodgeBlue = false;
    DodgeTime = 0;
	
    precacheImage('Sans_Shit_NM');
	precacheSound('dodge');
    precacheSound('countdown finish');
end

function onEvent(name, value1, value2)
    if name == "Sans_Dodge_Blue" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('Dodge Mechanics NM', 'Sans_Shit_NM', getProperty('boyfriend.x')-250, getProperty('boyfriend.y')-85);
    luaSpriteAddAnimationByPrefix('Dodge Mechanics NM', 'Warning Blue', 'AlarmBlue instance 1', 20, false);
	luaSpritePlayAnimation('Dodge Mechanics NM', 'Warning Blue');
    addLuaSprite('Dodge Mechanics NM', true); 
    runTimer('DisapearBlue', 0.35)
	
	--Set values so you can dodge
	canDodgeBlue = true;
	runTimer('DiedBlue', DodgeTime);
    playSound('notice', 1);
	
	end
end

function onUpdate()
   if canDodgeBlue == true and keyJustPressed('space') then
   
   playSound('dodge', 1);
   setProperty('health', 0);
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'DiedBlue' then
        canDodgeBlue = false
        setProperty('Dodge Mechanics NM.alpha', 1)
        playSound('dodge', 1);
        luaSpriteAddAnimationByPrefix('Dodge Mechanics NM', 'Attack Blue', 'Bones boi instance 1', 20, false);
        luaSpritePlayAnimation('Dodge Mechanics NM', 'Attack Blue');
        runTimer('BonesBlue', 1.1)
    elseif tag == 'BonesBlue' then
        removeLuaSprite('Dodge Mechanics NM', true)
    elseif tag == 'DisapearBlue' then
        setProperty('Dodge Mechanics NM.alpha', 0)
    end
end