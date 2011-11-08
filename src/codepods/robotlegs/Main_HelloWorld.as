package
{

	import helloworldexample.mvcs.contexts.HelloWorldContext;

	import org.robotlegs.core.IContext;

	import flash.display.Sprite;

	public class Main_HelloWorld extends Sprite
	{

		private var context : IContext;

		public function Main_HelloWorld()
		{
			context = new HelloWorldContext(this);
		}
	}
}