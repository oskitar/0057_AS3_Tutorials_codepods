package helloworldexample.mvcs.model
{

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author oscar de la mata
	 */
	public class TextsModel extends Actor implements ITextsModel
	{

		public function TextsModel()
		{
		}

		public function getInitMessage() : String
		{
			return "Click me!!";
		}

		public function getGreet() : String
		{
			return "Hello World!!";
		}
	}
}
