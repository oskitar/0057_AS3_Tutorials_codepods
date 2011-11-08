package helloworldexample.mvcs.view
{

	import helloworldexample.mvcs.controller.HelloWorldEvent;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	/**
	 * @author oscar de la mata
	 */
	public class HelloWorldMediator extends Mediator
	{

		[Inject]
		public var view : HelloWorldView;

		public function HelloWorldMediator()
		{
		}

		override public function onRegister() : void
		{
			eventMap.mapListener(view, MouseEvent.CLICK, onViewClicked);
			eventMap.mapListener(eventDispatcher, HelloWorldEvent.UPDATE_GREETING, onUpdatedGreeting);
		}

		private function onViewClicked(m : MouseEvent) : void
		{
			eventDispatcher.dispatchEvent(new HelloWorldEvent(HelloWorldEvent.BUTTON_CLICKED));
		}

		private function onUpdatedGreeting(event : HelloWorldEvent) : void
		{
			var message : String = String(event.body);
			view.updateMessage(message);
		}
	}
}