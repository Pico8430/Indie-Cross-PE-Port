local isShooting = false
local isShootingGREEN = false
local active = false

function onCreate()
    dadposX = getProperty('dad.x')
    dadposY = getProperty('dad.y')
    for i=1,9 do
        precacheSound('pea'..i) 
        precacheSound('chaser'..i)
    end

    makeLuaSprite('hurtOverlay', nil, 0, 0)
    makeGraphic('hurtOverlay', 1920, 1080, '96bfff')
    setObjectCamera('hurtOverlay', 'other')
    addLuaSprite('hurtOverlay', true)
    
    makeLuaSprite('hurtOverlay2', nil, 0, 0)
    makeGraphic('hurtOverlay2', 1920, 1080, '63ff63')
    setObjectCamera('hurtOverlay2', 'other')
    addLuaSprite('hurtOverlay2', true)

    makeAnimatedLuaSprite('card', 'Cardcrap', 1185, 500)
    setObjectCamera('card', 'other')
    addAnimationByPrefix('card', 'noCard', 'Card but flipped instance 1', 24, false)
    addAnimationByPrefix('card', 'popCard', 'PARRY Card Pop out  instance 1', 24, false)
    addLuaSprite('card')
    objectPlayAnimation('card', 'noCard')

    makeAnimatedLuaSprite('shoot', 'bull/Cupheadshoot', dadposX, dadposY+30)
    addAnimationByPrefix('shoot', 'bullet', 'BulletFX_H-Tween_02', 30, true)
    addAnimationByPrefix('shoot', 'bullet2', 'BulletFX_H-Tween_03', 30, true)
    addAnimationByPrefix('shoot', 'bullet3', 'BulletFlashFX', 30, true)
    addLuaSprite('shoot')
    setProperty('shoot.visible', false)

    makeAnimatedLuaSprite('green', 'bull/GreenShit', dadposX, dadposY)
    addAnimationByPrefix('green', 'green', 'GreenShit01', 30, true)
    addAnimationByPrefix('green', 'green2', 'GreenShit02', 30, true)
    addAnimationByPrefix('green', 'green3', 'Greenshit03', 30, true)
    addLuaSprite('green')
    setProperty('green.visible', false)

    setProperty('hurtOverlay.alpha', 0)
    setProperty('hurtOverlay2.alpha', 0)
end

function onEvent(name, v1, v2)
    if name == 'IC_shoot_blue' then
        if v1 == 'green' then
            isShootingGREEN = true
        elseif v1 == 'blue' then
            isShooting = true
        end

        if v1 == 'stop' then
            isShootingGREEN = false
        end
    end
end

function onStepHit()
    if curStep % 1 == 0 and isShooting then
        playSound('pea'..getRandomInt(0,5), 1.9)
        setProperty('hurtOverlay.alpha', 0.2)
        setProperty('health', getProperty('health') - 0.050)
        doTweenAlpha('fade', 'hurtOverlay', 0, 0.2, 'linear')
        setProperty('shoot.visible', true)
        objectPlayAnimation('shoot', 'bullet')
    end

    if curStep % 2 == 0 and isShooting and botPlay and active then
        
        setProperty('boyfriend.specialAnim', true);
        characterPlayAnim('boyfriend', 'attack', true);
        playSound('hurt', 1.9) 
        objectPlayAnimation('card', 'noCard')
        setProperty('health', getProperty('health') + 0.50)
        cameraShake('camOther', 0.015, 0.3)
        cameraShake('camHud', 0.015, 0.3)
        setProperty('shoot.visible', false)
        setProperty('green.visible', false)
        isShooting = false
        isShootingGREEN = false
        active = false
    end
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and active == true then
        setProperty('boyfriend.specialAnim', true);
        characterPlayAnim('boyfriend', 'attack', true);
        playSound('hurt', 1.9) 
        objectPlayAnimation('card', 'noCard')
        setProperty('health', getProperty('health') + 0.50)
        cameraShake('camOther', 0.015, 0.3)
        cameraShake('camHud', 0.015, 0.3)
        setProperty('shoot.visible', false)
        setProperty('green.visible', false)
       isShooting = false
       isShootingGREEN = false
       active = false
    elseif botPlay and isShooting then
        playSound('hurt', 1.9) 
       objectPlayAnimation('card', 'noCard')
       setProperty('health', getProperty('health') + 0.50)
       cameraShake('camOther', 0.008, 0.1)
       cameraShake('camHud', 0.008, 0.1)
       isShooting = false
       isShootingGREEN = false
       active = false
    end
end

function goodNoteHit(i, d, n, sus)
    if n == 'Parry' then
        objectPlayAnimation('card', 'popCard')
        playSound('indiecross/parry', 1.9)
        playSound('indiecross/parry', 1.9)
        active = true
    end
end

function opponentNoteHit(i, d, n, sus)
    if isShootingGREEN and not sus then
        playSound('indiecross/chaser'..getRandomInt(0,4), 1.9)
        setProperty('hurtOverlay2.alpha', 0.1)
        setProperty('health', getProperty('health') - 0.018)
        doTweenAlpha('fade2', 'hurtOverlay2', 0, 0.1, 'linear')
        setProperty('green.visible', true)
        objectPlayAnimation('green', 'green')
    end
end