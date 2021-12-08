require('Parallax')




function love.load()
	love.window.setFullscreen(true)
	Parallax:load()
	Src = love.audio.newSource("assets/sounds/music.ogg", "stream")
	Src:setVolume(0.7)
end


function love.update( dt )
	if not Src:isPlaying() then
		love.audio.play(Src)
	end
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	Parallax:update(dt)
	
end


function love.draw()
	Parallax:draw()
end