function love.load()
	-- This function is called every frame, dt is the time elapsed since the last frame
	-- Window settings
	love.window.setMode(800, 600) -- Set window size to 800x600

	-- Initialize snake
	snake = {}
	snake.segments = {
		{x = 5, y = 5};
		{x = 4, y = 5};
		{x = 3, y = 5};
	}
	snake.direction = "right" -- Initial direction
	snake.size = 20 		  --Size of each segments

	--Initialize food
	food = {}
	food.x = math.random(0, love.graphics.getWidth() / snake.size - 1)
	food.y = math.random(0, love.graphics.getHeight() / snake.size - 1)
end	

function love.keypressed(key)
	if key == "up" and snake.direction ~= "down" then
		snake.direction = "up"
	elseif key == "down" and snake.direction ~= "up" then
		snake.direction = "down"
    elseif key == "left" and snake.direction ~= "right" then
        snake.direction = "left"
    elseif key == "right" and snake.direction ~= "left" then
        snake.direction = "right"
    end
end

function love.update(dt)
	snake.timer = snake.timer + dt
	if snake.timer >= snake.speed then
		snake.timer = snake.timer - snake.speed

		-- Move the snake segments
		for i = #snake.segments, 2, -1 do
			snake.segments[i].x = snake.segments[i-1].x
			snake.segments[i].x = snake.segments[i-1].y
		end

		-- Update the head of the snake
		local head = snake.segments[1]
        if snake.direction == "right" then
            head.x = head.x + 1
        elseif snake.direction == "left" then
            head.x = head.x - 1
        elseif snake.direction == "up" then
            head.y = head.y - 1
        elseif snake.direction == "down" then
            head.y = head.y + 1		
		end
	end
	
end

function love.draw()
	-- Draw snake
	for _, segment in ipairs(snake.segments) do
		love.graphics.rectangle("fill", segment.x * snake.size, segment.y * snake.size, snake.size, snake.size)
    end

	-- Draw food
	love.graphics.rectangle("fill", food.x * snake.size, food.y * snake.size, snake.size, snake.size)
	
	-- set the background color to green
	love.graphics.clear(0, 1, 0)
end