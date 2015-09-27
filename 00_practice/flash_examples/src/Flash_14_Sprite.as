package
{
	import flash.display.Sprite;
	import flash.events.*;  //we need the events package to hook into the enterFrame event
	
	
	[SWF(width="800",height="600", backgroundColor="#999999")]
	public class Flash_14_Sprite extends Sprite
	{
		public var isMouseDown:Boolean = false;
		
		public var redSprite:Sprite = new Sprite();
		public var blueSprite:Sprite = new Sprite();
		
		public function Flash_14_Sprite()
		{
			super();
			
			addEventListener(Event.ENTER_FRAME, draw);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mousePressed);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseReleased);
			
			blueSprite.graphics.beginFill(0x0000ff);
			redSprite.graphics.beginFill(0xff0000);
			
			blueSprite.graphics.drawRect(-10,-10,20,20);
			redSprite.graphics.drawRect(-10,-10,20,20);
			
			addChild(redSprite);
			addChild(blueSprite);
		}
		
		public function mousePressed(event:MouseEvent):void
		{
			isMouseDown = true;
			
			//adding it puts it above blue sprite
			addChild(redSprite);	
		}
		
		public function mouseReleased(event:MouseEvent):void
		{
			isMouseDown = false;
			
			//adding it puts it above blue sprite
			addChild(blueSprite);	
		}
		
		public function draw(event:Event):void
		{
			blueSprite.x = stage.mouseX;
			blueSprite.y = stage.mouseY;
			
			redSprite.x = stage.mouseX;
			redSprite.y = stage.mouseY;
		}
	}
}