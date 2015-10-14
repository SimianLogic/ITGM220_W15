package
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class GemButton extends SimpleButton
	{
		
		[Embed(source="web_images/jewel1.png")] public var jewel1:Class;
		[Embed(source="web_images/jewel2.png")] public var jewel2:Class;
		[Embed(source="web_images/jewel3.png")] public var jewel3:Class;
		[Embed(source="web_images/jewel4.png")] public var jewel4:Class;
		[Embed(source="web_images/jewel5.png")] public var jewel5:Class;
		[Embed(source="web_images/jewel6.png")] public var jewel6:Class;
		[Embed(source="web_images/jewel7.png")] public var jewel7:Class;
		[Embed(source="web_images/jewel8.png")] public var jewel8:Class;
		[Embed(source="web_images/jewel9.png")] public var jewel9:Class;
		[Embed(source="web_images/jewel10.png")] public var jewel10:Class;
		[Embed(source="web_images/jewel11.png")] public var jewel11:Class;
		[Embed(source="web_images/jewel12.png")] public var jewel12:Class;
		
		public var jewelList:Array = [ jewel1, jewel2, jewel3, jewel4,
			jewel5, jewel6,jewel7, jewel8,
			jewel9, jewel10, jewel11, jewel12
		];
		
		public var value:int;
		public var gridX:int;
		public var gridY:int;
		
		public function GemButton(which_gem:int, grid_x:int, grid_y:int)
		{
			value = which_gem;
			gridX = grid_x;
			gridY = grid_y;
			
			//the contents of jewelList are classes... so here we're instantiating 
			// one of the objects (Classes) in the list. looks weird but it works!
			var up:Bitmap = new jewelList[which_gem]();
			var over:Bitmap = new jewelList[which_gem]();
			var down:Bitmap = new jewelList[which_gem]();
			
			over.width = 105;
			over.height = 105;
			
			down.width = 95;
			down.height = 95;

			super(up, over, down, up);
		}
	}
}