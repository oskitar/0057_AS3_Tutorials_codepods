package mvcs.view.components
{

	import mvcs.view.StateUI;

	import com.bit101.components.Component;
	import com.bit101.components.PushButton;
	import com.bit101.components.VBox;
	import com.bit101.utils.MinimalConfigurator;

	import org.osflash.signals.natives.NativeSignal;

	import flash.events.MouseEvent;

	/**
	 * @author oscar de la mata
	 */
	public class PlayGameStateUI extends StateUI
	{

		public static const NAME : String = "PlayGameStateUI";
		// INTERNAL SIGNALS
		public var winButtonClickSignal : NativeSignal = new NativeSignal();
		public var cancelButtonClickSignal : NativeSignal = new NativeSignal();
		// DISPLAY LIST
		private var winButton : PushButton;
		private var cancelButton : PushButton;
		private var container : VBox;
		// HELPER VARS
		private const MCXML : XML = <comps>
			<VBox id="container">
			<Label id="myLabel" x="0" y="0" text="YOU'RE PLAYING"/>
				<HBox>
					<PushButton id="winButton"  label="Win Game" event="click:onClick"/>
					<PushButton id="cancelButton" label="Leave Game" event="click:onClick"/>
				</HBox>
			</VBox>
			</comps>;
		private var config : MinimalConfigurator;

		public function PlayGameStateUI()
		{
			name = NAME;
		}

		override public function draw() : void
		{
			Component.initStage(stage);
			config = new MinimalConfigurator(this);
			config.parseXML(MCXML);

			container = config.getCompById("container") as VBox;
			container.alignment = VBox.CENTER;
			container.x = (stage.stageWidth - container.width) / 2;
			container.y = (stage.stageHeight - container.height) / 2;

			winButton = config.getCompById("winButton") as PushButton;
			winButtonClickSignal = new NativeSignal(winButton, MouseEvent.CLICK, MouseEvent);

			cancelButton = config.getCompById("cancelButton") as PushButton;
			cancelButtonClickSignal = new NativeSignal(cancelButton, MouseEvent.CLICK, MouseEvent);
		}
	}
}