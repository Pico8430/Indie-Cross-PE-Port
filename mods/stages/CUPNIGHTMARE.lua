function onCreate()

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('nightmarecupbg', 'nightmarecupbg', -600, -600);
		setScrollFactor('nightmarecupbg', 0.9, 0.9);
		scaleObject('nightmarecupbg', 1.5, 1.5)
	end

	addLuaSprite('nightmarecupbg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end