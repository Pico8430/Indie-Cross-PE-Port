--Hello! This Is Video Vocoding and I Created This Script! So This Event Will Trigger When The Opponent Sings.
--Example: ('1, 0.05','1, 0.05')
--Name of Event: Screen Shake
--To Put This In Your Song For Psych Engine Make A script.lua File in Your Song data Folder.
--Next Copy This Script Below and Paste It Into The script.lua File.
--Then Test The Song, If It Works, Then Like This And Comment that It Worked!

function opponentNoteHit(id,data,type,sus)
    triggerEvent('Screen Shake','0.1, 0.005','0.1, 0.005')
end