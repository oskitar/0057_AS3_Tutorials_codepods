package helloworldexample.mvcs.view
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	/**
	 * @author oscar de la mata
	 */
	public class HelloWorldView extends Sprite
	{

		private var textField : TextField;
		private var message : String;

		public function HelloWorldView(message : String)
		{
			this.message = message;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		public function updateMessage(message : String) : void
		{
			textField.text = this.message = message;
			textField.x = (stage.stageWidth - textField.width) / 2;
			textField.y = (stage.stageHeight - textField.height) / 2;
		}

		private function init(e : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			draw();
		}

		private function draw() : void
		{
			if (!textField)
			{
				textField = new TextField();
				textField.background = true;
				textField.backgroundColor = 0xededed;
				textField.selectable = false;
				textField.autoSize = TextFieldAutoSize.CENTER;

				addChild(textField);
			}
			updateMessage(this.message);
		}
	}
}