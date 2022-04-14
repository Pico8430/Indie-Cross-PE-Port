function onCreate()

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('CupheadBackground', 'CupheadBackground', -600, -300);
		setScrollFactor('CupheadBackground', 0.9, 0.9);
	end

	addLuaSprite('CupheadBackground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end