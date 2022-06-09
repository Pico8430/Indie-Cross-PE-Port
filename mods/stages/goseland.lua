function onCreate()
	-- background shit
	makeAnimatedLuaSprite('BG', 'BG', -250, -62)
	luaSpriteAddAnimationByPrefix('BG', 'BG', 'BG instance', 24, true)
	scaleObject('BG', 0.85, 0.85)
	addLuaSprite('BG', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end