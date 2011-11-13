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
	public class WinGameStateUI extends StateUI
	{

		public static const NAME : String = "WinGameStateUI";
		// INTERNAL SIGNALS
		public var returnButtonClickSignal : NativeSignal = new NativeSignal();
		// DISPLAY LIST
		private var returnButton : PushButton;
		private var container : VBox;
		// HELPER VARS
		private const MCXML : XML = <comps>
			<VBox id="container">
			<Label id="myLabel" x="0" y="0" text="Congratulations you win!"/>
				<HBox>
					<PushButton id="returnButton" x="0" y="20" label="Return to Main Menu" event="click:onClick"/>
				</HBox>
			</VBox>
			</comps>;
		private var config : MinimalConfigurator;

		public function WinGameStateUI()
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

			returnButton = config.getCompById("returnButton") as PushButton;
			returnButtonClickSignal = new NativeSignal(returnButton, MouseEvent.CLICK, MouseEvent);
		}
	}
}
