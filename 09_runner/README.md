# IN CLASS DEMO
* Code walkthrough
* Show how to add the gap/blocky platforms


# SCADRunner Homework
* Add double-jump functionality to Dude.cs -- our hero should be able to jump exactly twice (but not 3x)
* Add a new block prefab with just physics (some ideas below):
	* One that "steps down" one or two steps (down is WAY easier than up)
	* One with a "short" leading edge or "short" trailing edge (just take out a block)
	* One that is "angled" slightly (there's actually no reason not to rotate a collider)
* Add a new block prefab with custom logic (some ideas below):
	* One that ends with a "trampoline" that automatically launches you into the air
	* One with a "powerup" (a new sprite Trigger) that speeds you up
	* One with a "powerup" (a new sprite Trigger) that slows you down
	* One with a "glue trap" that stops you for 1-second

* BONUS
  * add another block prefab with just physics
  * add another block prefab with custom logic 
  * add a 1-second delay after respawning (hint: if done properly you can re-use the glue-trap code from above)



# STEPS TO ADD A BLOCK TYPE
(We'll go through this a couple of times in class)

* Building Blocks are turned off by default (we enable them to edit them, but don't want them on to start the scene).
* Duplicate "Platform" (or whichever block you want to build off of)
* Select the duplicate and go to the top menu item Game Object -> Break Prefab Instance (this will allow you to edit the dupe without editing the original)
* Drage the duplicate out of BuildingBlocks (it's enabled by default, so it should "pop" into the world).
* Make your edits:
	* each block will be graphically randomized at startup. don't put blocks on row2/3 below empty holes or it'll look like you can step there
	* any block named "row2" will have a random chance of appearing
	* any block named "row3" will have a lesser random chance of appearing
	* make sure to add colliders/triggers as needed if you're adding logic
* When DONE creating a block:
	* drag it back into BuildingBlocks (it'll go disabled again)
	* click on the Prefabs->Resources folder in the bottom left
	* drag the new block into that resources folder
	* add the name of your block to EndlessRunner.cs's AddPlatforms function
	* TEST TEST TEST
