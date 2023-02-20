require 'src/Dependencies'

function love.load()
    love.graphics.setDefaultFilter("nearest","nearest")
    love.window.setTitle("First test")
    love.window.setMode(GAME_WIDTH, GAME_HEIGHT)

    -- Using Push to set a virtua window
    Push:setupScreen(GAME_WIDTH, GAME_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,
        {
        vsync = true,
        fullscreen = false,
        resizable = true,
        })

    GStateMachine = StateMachine{
        ['start'] = function () return StartState() end
    }

    GStateMachine:change('start')

    -- initialize input table
    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    -- add to our input table the key was pressed 
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    end
    return false
end

function love.resize(w,h)
    Push:resize(w,h)
end

function love.update(dt)
    Timer.update(dt)
end
  

function love.draw()
    Push:start()
  
    Push:finish()
end