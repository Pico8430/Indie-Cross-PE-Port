function onCreate()

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('CupheadAngryBackground', 'CupheadAngryBackground', -600, -300);
		setScrollFactor('CupheadAngryBackground', 0.9, 0.9);

		makeAnimatedLuaSprite('angry/NewRAINLayer01', 'angry/NewRAINLayer01', -350, -100);
		addAnimationByPrefix('angry/NewRAINLayer01', 'first', 'RainFirstlayer instance', 24, true);
		objectPlayAnimation('angry/NewRAINLayer01', 'first');
		setScrollFactor('angry/NewRAINLayer01', 1.0, 1.0);
		scaleObject('angry/NewRAINLayer01', 2.0, 2.0);
	end

	addLuaSprite('CupheadAngryBackground', false);
	addLuaSprite('angry/NewRAINLayer01', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end