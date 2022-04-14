function onCreatePost()
	makeAnimatedLuaSprite('fakeN0', 'NOTE_assets', defaultOpponentStrumX0 + 5, defaultOpponentStrumY0 + 5)
	makeAnimatedLuaSprite('fakeN1', 'NOTE_assets', defaultOpponentStrumX1, defaultOpponentStrumY1 + 5)
	makeAnimatedLuaSprite('fakeN2', 'NOTE_assets', defaultOpponentStrumX2, defaultOpponentStrumY2 + 2)
	makeAnimatedLuaSprite('fakeN3', 'NOTE_assets', defaultOpponentStrumX3 + 2, defaultOpponentStrumY3 + 2)
	addAnimationByPrefix('fakeN0', '0', 'left press', 24, false)
	addAnimationByPrefix('fakeN1', '1', 'down press', 24, false)
	addAnimationByPrefix('fakeN2', '2', 'up press', 24, false)
	addAnimationByPrefix('fakeN3', '3', 'right press', 24, false)
	
	for i = 0, 3 do
		setProperty('fakeN'..i..'.visible', false)
		setObjectCamera('fakeN'..i, 'hud')
		addLuaSprite('fakeN'..i, false)
		scaleObject('fakeN'..i, 0.7, 0.7)
	end
	ogDC = getProperty('dad.color')
end

local DadSingAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
local DadSingDir = 1
local MissColor = '5f1ea4' --color the dad shifts to when missing a note
function onUpdatePost(elapsed)
    for a = 0, getProperty('notes.length') - 1 do
        noteData = getPropertyFromGroup('notes', a, 'noteData')
		strumTime = getPropertyFromGroup('notes', a, 'strumTime')
		mustPress = getPropertyFromGroup('notes', a, 'mustPress')
		isSustainNote = getPropertyFromGroup('notes', a, 'isSustainNote')
		if not mustPress and not isSustainNote then
			if (strumTime - getSongPosition()) / getProperty('songSpeed') < 1 and getPropertyFromGroup('notes', a, 'active') and getRandomBool(1, 100) then
				setPropertyFromGroup('notes', a, 'ignoreNote', true)
				DadSingDir = noteData
				setProperty('vocals.volume', 0)
				soundName = string.format('missnote%i', math.random(1, 3));
				playSound(soundName, getRandomFloat(0.1, 0.2), 'OPMiss');
				if getProperty('dad.hasMissAnimations') then
					characterPlayAnim('dad', DadSingAnims[DadSingDir+1]..'miss', true)
				else
					characterPlayAnim('dad', DadSingAnims[DadSingDir+1], true)
					setProperty('dad.color', getColorFromHex(MissColor))
				end
				setProperty('dad.specialAnim', true)
				fakeNote(noteData)
				setPropertyFromGroup('notes', a, 'active', false)
			end
			if (strumTime - getSongPosition()) < -310 / getProperty('songSpeed') and getPropertyFromGroup('notes', a, 'ignoreNote') then
				setPropertyFromGroup('opponentStrums', noteData, 'visible', true)
				setProperty('fakeN'..noteData..'.visible', false)
			end
		end
	end
end

function opponentNoteHit(id, dir, nt, sus)
	setPropertyFromGroup('opponentStrums', dir, 'visible', true)
	setProperty('fakeN'..dir..'.visible', false)
	setProperty('dad.color', ogDC)
end

function fakeNote(note)
	setProperty('health', getProperty('health') + 0.023)
	setPropertyFromGroup('opponentStrums', note, 'visible', false)
	setProperty('fakeN'..note..'.visible', true)
	objectPlayAnimation('fakeN'..note, note, false)
end