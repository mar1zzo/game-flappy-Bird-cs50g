--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

-- By Mariana Rizzo (dt: 2021/04):
-- goal3: medals images
-- Credit: https://opengameart.org/content/medals-2
--         "Kenney.nl" or "www.kenney.nl"
local BRONZE_IMAGE = love.graphics.newImage('medals/flat_medal2.png')
local SILVER_IMAGE = love.graphics.newImage('medals/flat_medal9.png')
local GOLD_IMAGE = love.graphics.newImage('medals/flat_medal8.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- By Mariana Rizzo (dt: 2021/04):
    -- goal3: drawing the screen according to the score and medal
    if self.score == 0 then 
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
            
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
    elseif self.score < 10 then
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Wow! "Bronze" Medal!', 0, 64, VIRTUAL_WIDTH, 'center')
            love.graphics.draw(BRONZE_IMAGE, VIRTUAL_WIDTH / 2 - 21, VIRTUAL_HEIGHT / 2 - 30)
                
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
    elseif self.score < 20 then
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Yeah! "Silver" Medal!', 0, 64, VIRTUAL_WIDTH, 'center')
            love.graphics.draw(SILVER_IMAGE, VIRTUAL_WIDTH / 2 - 21, VIRTUAL_HEIGHT / 2 - 30)
            
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
    elseif self.score >= 20 then
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Uhuull! "Gold" Medal!', 0, 64, VIRTUAL_WIDTH, 'center')
            love.graphics.draw(GOLD_IMAGE, VIRTUAL_WIDTH / 2 - 21, VIRTUAL_HEIGHT / 2 - 30)
            
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
end