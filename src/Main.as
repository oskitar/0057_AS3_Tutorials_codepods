package
{

	import codepods.matrix.colormanipulation.ConvertToGrayScaleBitmapDemo;

	import es.cerocerocincuentaysiete.ui.core.AbstractElement;

	// import com.junkbyte.console.Cc;
	[SWF(width='300',height='320',backgroundColor='0xFFFFFF',frameRate='30')]
	public class Main extends AbstractElement
	{

		public function Main()
		{
		}

		override protected function init() : void
		{
			var demoElement : ConvertToGrayScaleBitmapDemo = new ConvertToGrayScaleBitmapDemo();
			addChild(demoElement);
			// Cc.startOnStage(this);
			// Cc.visible = true;
		}
	}
}