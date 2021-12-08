require('Parallax')




function love.load()
	love.window.setFullscreen(true)
	Parallax:load()
	src = love.audio.newSource("assets/sounds/music.ogg", "stream")
	src:setVolume(0.7)
end


function love.update( dt )
	if not src:isPlaying() then
		love.audio.play(src)
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	Parallax:update(dt)
	
end


function love.draw()
	Parallax:draw()
end