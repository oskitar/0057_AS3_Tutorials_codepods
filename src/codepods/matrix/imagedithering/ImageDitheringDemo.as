package codepods.matrix.imagedithering
{

	import codepods.matrix.imagedithering.constants.Constants;

	import es.cerocerocincuentaysiete.ui.core.AbstractElement;

	import com.bit101.components.Component;
	import com.bit101.components.PushButton;
	import com.bit101.components.RadioButton;
	import com.bit101.utils.MinimalConfigurator;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author oscar de la mata
	 */
	[SWF(width='600',height='420',backgroundColor='0xFFFFFF',frameRate='30')]
	public class ImageDitheringDemo extends AbstractElement
	{
		[Embed(source="../assets/img/hue_circle6.png")]
		public var HueWeel : Class;
		// DISPLAYLIST
		private var bitmapData : BitmapData;
		private var container : Sprite;
		private var hueWeel : Bitmap;
		// MINIMAL COMPS
		private var btn : PushButton;
		private var config : MinimalConfigurator;

		public function ImageDitheringDemo()
		{
			super();
		}

		public function onClick(event : MouseEvent) : void
		{
			resetImage();
		}
		
		public function onCheck (event : Event):void
		{
			btn.enabled = true;
			applyFilter(int(RadioButton(event.target).name));
		}

		protected override function init() : void
		{
			container = new Sprite();
			container.y = 45;
			container.x = 45;
			addChild(container);
			
			Component.initStage(stage);
			config = new MinimalConfigurator(this);
			config.parseXML(Constants.MCXML);

			btn = config.getCompById("clickButton") as PushButton;
			btn.enabled = false;

			hueWeel = new HueWeel() as Bitmap;
			container.addChild(hueWeel);
		}

		private function resetImage() : void
		{
			container.removeChild(hueWeel);
			hueWeel = new HueWeel() as Bitmap;
			container.addChild(hueWeel);
		}

		private function applyFilter(ditherMode : uint) : void
		{
			bitmapData = Bitmap(new HueWeel()).bitmapData.clone();

			DitherFilterFactory.getDitherFilter(ditherMode).dither(bitmapData);

			container.removeChild(hueWeel);
			hueWeel = new Bitmap(bitmapData);
			container.addChild(hueWeel);
		}
	}
}