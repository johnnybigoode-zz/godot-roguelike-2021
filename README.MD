Godot Roguelike Tutorial

https://github.com/Bozar/GodotRoguelikeTutorial/wiki/01

The initial step is simply creating the project, recomendation for a VS Code extension and that's about it 

https://github.com/Bozar/GodotRoguelikeTutorial/wiki/02

Now we're gonna do some project customization within Godot. Starting with a custom folder step and moving initial resources to the respective folder.
Let's create the MainScene, 
And set project's settings, including things I don't need, like Low Processor Mode
Icon was added as a sprite, which wasn't mentioned in the tutorial.
Add export settings, installing some extra features, now we can create a 26mg exe file that does nothing!

https://github.com/Bozar/GodotRoguelikeTutorial/wiki/03

First add font and tilemap. 
Then create the proper node for it. 
Here we did everything before 'change PC's color and save it as a packed scene.'
Note https://docs.godotengine.org/en/stable/getting_started/step_by_step/instancing.html as a reference to saving scenes

It was impossible boring to make the sprites since it was necessary to create each Sprite node from SCRATCH. 
If you try to duplicate a note, they are instances of the same thing, meaning, if you change one tile position from one sprite, and you'll change for the other. This is the exact type of experience I DO NOT WANT to have while making games. How am I supposed to make a deep copy of an instance so I can change it without changing the others?!

Still on the third part, subtitle 'Create Sprites From Scripts', writter recomends reading on Godot static typing and style guide
https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/static_typing.html
https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_styleguide.html

Then it mentions groups in Godot
https://docs.godotengine.org/en/stable/getting_started/step_by_step/scripting_continued.html#groups