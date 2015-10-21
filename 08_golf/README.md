# MiniGolf Homework
* Add 9 Holes of Golf (i.e. make 9 total levels). Add a button for each level on the menu scene.
* Create a GameOver scene and transition to that scene once the player gets the ball in the goal
* On the GameOver scene, add a button that transitions back to the menu scene
* On the GameOver scene, show which level the player finished and how many shots they took (use the static Player variables)
* Create a rotating hazard (a custom MonoBehaviour) in at least one of your levels

* BONUS
  * add a check-mark sprite below each button on the home screen for whether that level has been completed or not
  * add a label below each button on the home screen for "best score" on that level
  * on the home screen, show your total score across all 9 levels



# STEPS TO ADD A LEVEL 
(We'll go through this a couple of times in class)

## Create a level
* golf\_00 is your "base" level -- copy it and rename it ("golf\_01", "golf\_02", etc)
* go to File -> Build Settings and drag your scene into the "Scenes in Build" box
* drag box sprites onto the scene graph and place/scale them as you wish
* in general, you can resize things in the Inspector panel (top-right) or in the Scene View with: 
  * "q" to get a grabby hand that lets you move around the scene 
  * "w" to get a move-handle to move your boxes/goals around
  * "e" to get a rotation-handle to rotate a sprite
  * "r" to get a scale-handle to resize a sprite  
* once placed, select your sprite node and hit "Add Component" -- type in BoxCollider2D (it'll trace it automagically)
* navigate to the Materials panel and drag "WallMaterial" onto the Material field of your collider

## Add it to the menu
* duplicate the "Level 1" button
* move it so it doesn't overlap
* drop down to the text object and change the label to "Level 2" or "Level 3" etc
* on the button object, scroll down to the OnClick() box and change the tag that gets sent to our click handler (if you duped Level\_1, it'll say "Level\_1")
* open up GolfMenu.cs and add a case to our switch statement to load your new level when that new tag is passed into the HandleButton function