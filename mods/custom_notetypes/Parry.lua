function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Parry' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_parry'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Parry' then
		playSound('parry')
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Parry' then
		addMisses(-1);
		cameraShake('camGame', 0.01, 0.2);
	end
end