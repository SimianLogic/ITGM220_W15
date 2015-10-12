package
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
/*   <--- this opens a multi-line comment
WHERE DID OUR FRAMEWORK GO?
Flash provides a LOT more functionality out-of-the-box that Process, so we can get rid of a lot of our boiler plate Processing code.
			
RECTANGLE
In Processing, we wanted a re-usable rectangle that we could move around the screen. We could modify it's x, y, width, height, 
and it's fill color. We wanted to be able to query helpful things like top/bottom/left/right as well as see if a point was inside 
the rectangle or if the rectangle overlapped...

SPRITE
In Processing, we used "Sprite" to mean an image we loaded from the file system. There are multiple ways to get images into a SWF:
	1) put them in an asset catalog (a swc), make a movie clip, and load it by name
	2) put them in an asset catalog (a swc) and load the BitmapData by name into a Bitmap object
	3) use a Loader to load the image asynchronously
	
BUTTON
Flash has a SimpleButton class that simply takes 3 dislplay objects (sprites usually)
	
GAMESCREEN
GameScreen becomes obsolete! We use GameScreens in Processing as a way to disseminate events (mousePressed, draw, etc). Because
Flash uses event listeners, ANY class can hook into the event loop. So we don't need these any more. Every class (that subclasses
Sprite or MovieClip) can hook into the ENTER_FRAME event to get its own draw call. Any DisplayObject (Sprite) can implement 
mouse listeners.
	
To control which screen is "active" -- just add/remove them from the stage (you will need to turn off your listeners unless
	you use a central run loop).
	
	
this is how you end a multi-line comment ----> */
				
				
	[SWF(width="800",height="600", backgroundColor="#999999", frameRate="30")]
	public class Framework extends Sprite
	{
		
		public static const RECTANGLE_EXAMPLE:int = 1;
		public static const SPRITE_EXAMPLE:int = 2;
		public static const BUTTON_EXAMPLE:int = 3;
		public static const GAMESCREEN_EXAMPLE:int = 4;
		
		
		public var LIVE_EXAMPLE:int = BUTTON_EXAMPLE;
		
		//RECTANGLE EXAMPLES
		public var rectangleExample1:Sprite;
		public var rectangleExample2:Sprite;
		public var rectangleExample3:Sprite;
		
		//SPRITE EXAMPLES
		public var spriteExample1:KingSymbol;
		public var spriteExample2:Bitmap;
		public var spriteExample3:Loader;
		
		public function Framework()
		{
			super();
			
			addEventListener(Event.ENTER_FRAME, draw);
			
			
			if(LIVE_EXAMPLE == RECTANGLE_EXAMPLE)
			{
				setupRectangleExample();
			}else if(LIVE_EXAMPLE == SPRITE_EXAMPLE){
				setupSpriteExample();
			}else if(LIVE_EXAMPLE == BUTTON_EXAMPLE){
				setupButtonExample();
			}
			
		}
		
		public function setupRectangleExample():void
		{
			
			//to make a Processing-style rectangle centered in the middle, use the 
			//graphics class to draw a rectangle from -w/2,-h/2 to +w/2, +h/2
			rectangleExample1 = new Sprite();
			//will be drawn in our draw function
			addChild(rectangleExample1);
			rectangleExample1.x = 0;
			rectangleExample1.y = 0;
			
			
			rectangleExample2 = new Sprite();
			rectangleExample2.graphics.beginFill(0x0000ff);
			rectangleExample2.graphics.drawRect(-50, -50, 100, 100);
			addChild(rectangleExample2);
			rectangleExample2.x = 400;
			rectangleExample2.y = 400;
			
			
			rectangleExample3 = new Sprite();
			rectangleExample3.graphics.beginFill(0x0000ff);
			rectangleExample3.graphics.drawRect(-50, -50, 100, 100);
			addChild(rectangleExample3);
			rectangleExample3.x = 500;
			rectangleExample3.y = 500;
			
		}
		
		public function setupSpriteExample():void
		{
			spriteExample1 = new KingSymbol();
			addChild(spriteExample1);
			
			spriteExample2 = new Bitmap(new BlackKing());
			
			//LOADER is a class that is made to load content from disc or from the web. it can be either a Bitmap (png/jpg/whatev)
			//OR a SWF file (if you were doing your animated characters in Flash, for example)
			spriteExample3 = new Loader();
			spriteExample3.load(new URLRequest("black_king.png"));
			
			addChild(spriteExample1);
			addChild(spriteExample2);
			addChild(spriteExample3);
			
			
			spriteExample1.x = 50;
			spriteExample1.y = 50;
			
			spriteExample2.x = 400;
			spriteExample2.y = 300;
			
			spriteExample3.x = 200;
			spriteExample3.y = 200;
			
		}
		
		public function setupButtonExample():void
		{
			//as3's SimpleButton is pretty much just like our processing Rectangle
			var upSprite:Sprite = new Sprite();
			var overSprite:Sprite = new Sprite();
			var downSprite:Sprite = new Sprite();
			
			upSprite.graphics.beginFill(0x0000ff);
			overSprite.graphics.beginFill(0x0000aa);
			downSprite.graphics.beginFill(0x000077);
			
			upSprite.graphics.drawRect(-100,-40,200,80);
			overSprite.graphics.drawRect(-100,-40,200,80);
			downSprite.graphics.drawRect(-100,-40,200,80);
			
			//the 4th PARAMETER is hitSprite, which is a sprite that determines our bounds... 99% of the time this will be the same as upSprite
			var button:SimpleButton = new SimpleButton(upSprite, overSprite, downSprite, upSprite);
			addChild(button);
			
			button.x = 400;
			button.y = 300;
			
			button.addEventListener(MouseEvent.CLICK, handleButtonClick);
				
		}
		
		public function handleButtonClick(event:MouseEvent):void
		{
			trace("CLICK CLICK");
		}
		
		public function draw(event:Event):void
		{
			//DO YOUR DRAWING CODE HERE
			//to get the mouseX and mouseY like processing, use stage.mouseX and stage.mouseY
			
			if(LIVE_EXAMPLE == RECTANGLE_EXAMPLE)
			{
				drawRectangleExample();
			}
		}
		
		public function drawRectangleExample():void
		{
			rectangleExample1.graphics.clear();
			rectangleExample1.graphics.beginFill(0x00ff00);
			rectangleExample1.graphics.drawRect(0, 0, stage.mouseX, stage.mouseY);
			
			//any display object (parent class of Sprite) has a hitTestPoint function to see if a point is within the bounds of that object
			if(rectangleExample2.hitTestPoint(stage.mouseX, stage.mouseY))
			{		
				rectangleExample2.graphics.beginFill(0xff0000);
				rectangleExample2.graphics.drawRect(-50, -50, 100, 100);
			}else{
				rectangleExample2.graphics.beginFill(0x0000ff);
				rectangleExample2.graphics.drawRect(-50, -50, 100, 100);
			}
			
			//to figure out intersects, you can use hitTestObject instead of hitTestPoint
			if(rectangleExample3.hitTestObject(rectangleExample1))
			{
				rectangleExample3.graphics.beginFill(0xff0000);
				rectangleExample3.graphics.drawRect(-50, -50, 100, 100);	
			}else{
				rectangleExample3.graphics.beginFill(0x0000ff);
				rectangleExample3.graphics.drawRect(-50, -50, 100, 100);
			}
			
		}
	}
}