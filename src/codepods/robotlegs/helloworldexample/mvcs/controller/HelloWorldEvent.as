package helloworldexample.mvcs.controller
{

	import flash.events.Event;

	public class HelloWorldEvent extends Event
	{

		public static const BUTTON_CLICKED : String = 'BUTTON_CLICKED';
		public static const UPDATE_GREETING : String = "UPDATE_GREETING";
		private var _body : *;

		/**
		 * @author oscar de la mata
		 */
		public function HelloWorldEvent(type : String, body : * = null)
		{
			super(type);
			_body = body;
		}

		public function get body() : *
		{
			return _body;
		}

		override public function clone() : Event
		{
			return new HelloWorldEvent(type, body);
		}
	}
}