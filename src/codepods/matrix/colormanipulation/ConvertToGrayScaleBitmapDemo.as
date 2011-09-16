package codepods.matrix.colormanipulation
{

	import codepods.matrix.colormanipulation.constants.Constants;

	import es.cerocerocincuentaysiete.ui.core.AbstractElement;
	import es.cerocerocincuentaysiete.util.ConvertToGrayscaleBitmapData;

	import com.bit101.components.Component;
	import com.bit101.components.PushButton;
	import com.bit101.utils.MinimalConfigurator;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author oscar de la mata
	 */
	public class ConvertToGrayScaleBitmapDemo extends AbstractElement
	{

		[Embed(source="../assets/img/hue_weel.jpg")]
		public var HueWeel : Class;
		// DISPLAYLIST
		private var bitmapData : BitmapData;
		private var container : Sprite;
		private var hueWeel : Bitmap;
		// MINIMAL COMPS
		private var btn : PushButton;
		private var config : MinimalConfigurator;
		// HELPER VARS
		private var state : String;

		public function ConvertToGrayScaleBitmapDemo()
		{
			super();
			state = Constants.STATE_COLOR;
		}

		public function onClick(event : MouseEvent) : void
		{
			switch (state)
			{
				case Constants.STATE_COLOR:
					btn.label = Constants.LABEL_COLOR;
					state = Constants.STATE_BN;
					applyFilter();
					break;
				case Constants.STATE_BN:
					btn.label = Constants.LABEL_BN;
					state = Constants.STATE_COLOR;
					resetImage();
					break;
			}
		}

		protected override function init() : void
		{
			container = new Sprite();
			container.y = 20;
			addChild(container);
			Component.initStage(stage);

			config = new MinimalConfigurator(this);
			config.parseXML(Constants.MCXML);

			btn = config.getCompById("clickButton") as PushButton;
			btn.label = Constants.LABEL_BN;

			hueWeel = new HueWeel() as Bitmap;
			container.addChild(hueWeel);
		}

		private function resetImage() : void
		{
			container.removeChild(hueWeel);
			hueWeel = new HueWeel() as Bitmap;
			container.addChild(hueWeel);
		}

		private function applyFilter() : void
		{
			bitmapData = hueWeel.bitmapData.clone();
			ConvertToGrayscaleBitmapData.desaturate(bitmapData);
			container.removeChild(hueWeel);
			hueWeel = new Bitmap(bitmapData);
			container.addChild(hueWeel);
		}
	}
}
