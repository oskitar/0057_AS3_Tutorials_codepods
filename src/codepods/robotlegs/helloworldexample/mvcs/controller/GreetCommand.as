package helloworldexample.mvcs.controller
{

	import helloworldexample.mvcs.model.ITextsModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author oscar de la mata
	 */
	public class GreetCommand extends Command
	{

		[Inject]
		public var model : ITextsModel;

		override public function execute() : void
		{
			var message : String = model.getGreet();
			var helloWorldEvent : HelloWorldEvent = new HelloWorldEvent(HelloWorldEvent.UPDATE_GREETING, message);
			eventDispatcher.dispatchEvent(helloWorldEvent);
		}
	}
}