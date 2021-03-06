function love.load()
  image = love.graphics.newImage('images/nature_alley.jpg')
  x = 1
  y = 1
  local f = love.graphics.newFont(12)
  love.graphics.setFont(f)
end

function love.update(dt)
  if gameIsPaused then return end
  if love.keyboard.isDown("up") then
    num = num + 100 * dt
  end
end

function love.mousepressed(x,y,button)
  if button == 'l' then
    imgx = x
    imgy = y
  end
end

function love.mousereleased(x,y,button)
  if button == 'l' then
    fireSlingshot(x,y)
  end
end

function love.keypressed(key, unicode)
  if key == 'b' then
    text = "The B key was pressed."
  elseif key == 'a' then
    a_down = true
  end
end

function love.keyreleased(key, unicode)
  if key == 'b' then
    text = 'The B key was released.'
  elseif key == 'a' then
    a_down = false
  end
end

function love.focus(f) gameIsPaused = not f end

function love.quit()
  print("Thanks for playing! Come back soon!")
end

function love.draw()
  love.graphics.draw(image, x, y)
  love.graphics.print('rand print :3', 100, 100)
end

-- main loop

function love.run()
  math.randomseed(os.time())
  math.random() math.random()

  if love.load then love.load(arg) end
  local dt = 0
  -- [[main loop in love.run :3]]
  while true do
    if love.event then
      love.event.pump()
      for e,a,b,c,d in love.event.poll() do
        if e == 'quit' then
          if not love.quit or not love.quit() then
            if love.audio then
              love.audio.stop()
            end
            return
          end
        end
        love.handlers[e](a,b,c,d)
      end
    
    if love.timer then
      love.timer.step()
      dt = love.timer.getDelta()
    end 
  
    if love.update then love.update(dt) end
    if love.graphics then
      love.graphics.clear()
      if love.draw then love.draw() end
    end
  
    if love.timer then love.timer.sleep(0.001) end
    if love.graphics then love.graphics.present() end
    end
  end
end
