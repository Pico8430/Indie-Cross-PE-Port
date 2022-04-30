function onCreate()

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('bendybg/BendyBlack', 'bendybg/BendyBlack', -600, -300);
		setScrollFactor('bendybg/BendyBlack', 0.6, 0.6);

		makeLuaSprite('bendybg/BendyBackBehind', 'bendybg/BendyBackBehind', -600, -450);
		setScrollFactor('bendybg/BendyBackBehind', 0.9, 0.9);
		scaleObject('bendybg/BendyBackBehind', 0.8, 0.8)

		makeLuaSprite('bendybg/BendyBack', 'bendybg/BendyBack', -600, -300);
		setScrollFactor('bendybg/BendyBack', 0.8, 0.8);

		makeLuaSprite('bendybg/BendyMidGround', 'bendybg/BendyMidGround', -600, -300);
		setScrollFactor('bendybg/BendyMidGround', 1.0, 1.0);

		makeLuaSprite('bendybg/BendyForeground', 'bendybg/BendyForeground', -600, -300);
		setScrollFactor('bendybg/BendyForeground', 0.6, 0.6);
		scaleObject('bendybg/BendyForeground', 1.1, 1.1)
	end
	
	addLuaSprite('bendybg/BendyBlack', false);
	addLuaSprite('bendybg/BendyBackBehind', false);
	addLuaSprite('bendybg/BendyBack', false);
	addLuaSprite('bendybg/BendyMidGround', false);
	addLuaSprite('bendybg/BendyForeground', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end