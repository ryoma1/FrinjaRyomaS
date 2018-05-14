-- Title: main_menu2.lua
-- Name: Ryoma Scott
-- Course: ICS2O/3C
-- This program...

--hide status bar
display.setStatusBar(display.HiddenStatusBar)
----------------------------------------------

local composer = require( "composer" )
sceneName = "main_menu2"
 
local scene = composer.newScene(sceneName)

--local variables
local bkg_image
local playButton
local creditsButton
local instructionsButton
local songSounds = audio.loadSound("Sounds/song.mp3")
local songSoundsChannel

----------------------------------------
--play background music

----------------------------------------
-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "flipFadeOutIn", time = 500})
end 

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "zoomInOutFade", time = 1000})
end 

--Creating transition to instructions
local function InstructionsScreenTransition( )
    composer.gotoScene( "instructions_screen", {effect = "zoomInOutFade", time = 1000})
end 

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    	-----------------------------------------------------------------------------------------
    	-- BACKGROUND IMAGE & STATIC OBJECTS
    	-----------------------------------------------------------------------------------------

    	-- Insert the background image and set it to the center of the screen
    	bkg_image = display.newImage("Images/MainMenuBassimH.png")
    	bkg_image.x = display.contentCenterX
    	bkg_image.y = display.contentCenterY
    	bkg_image.width = display.contentWidth
    	bkg_image.height = display.contentHeight


   	 	-- Associating display objects with this scene 
   	 	sceneGroup:insert( bkg_image )

    	-- Send the background image to the back layer so all other objects can be on top
   	 	bkg_image:toBack()

    	-----------------------------------------------------------------------------------------
    	-- BUTTON WIDGETS
    	-----------------------------------------------------------------------------------------   

    	-- Creating Play Button
    	playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*7/9,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedRyomaS.png",
            overFile = "Images/PlayButtonPressedRyomaS.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )

    	-----------------------------------------------------------------------------------------

    	-- Creating Credits Button
    	creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*7/14.5,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressedRyomaS.png",
            overFile = "Images/CreditsButtonPressedRyomaS.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 
    
   	 	-- ADD INSTRUCTIONS BUTTON WIDGET

    	--Creating instructions button
        instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/8.4,
            y = display.contentHeight*7/14.5,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressedRyomaS.png",
            overFile = "Images/InstructionsButtonPressedRyomaS.png",

            -- When the button is released, call the Instructions transition function
            onRelease = InstructionsScreenTransition
        } ) 
    

   	 -----------------------------------------------------------------------------------------

    	-- Associating button widgets with this scene
    	sceneGroup:insert( playButton )
    	sceneGroup:insert( creditsButton )
    	sceneGroup:insert( instructionsButton )
    	
	end 
end


-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then
    	--play background music
    	--songSoundsChannel = audio.play( songSounds )       
        

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        --audio.stop(songSoundsChannel)
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
