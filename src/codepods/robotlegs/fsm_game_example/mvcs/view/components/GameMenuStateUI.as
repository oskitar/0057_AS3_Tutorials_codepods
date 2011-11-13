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
	public class GameMenuStateUI extends StateUI
	{

		public static const NAME : String = "GameMenuStateUI";
		// SIGNALS
		public var playButtonClickSignal : NativeSignal = new NativeSignal();
		// DISPLAY LIST
		private var playButton : PushButton;
		private var contenedor : VBox;
		// HELPER VARS
		private const MCXML : XML = <comps>
			<VBox id="contenedor">
			<Label id="myLabel" x="0" y="0" text="GAME MENU"/>
				<PushButton id="playButton" x="0" y="20" label="Play New Game" event="click:onClick"/>
			</VBox>
			</comps>;
		private var config : MinimalConfigurator;

		public function GameMenuStateUI()
		{
			name = NAME;
		}

		override public function draw() : void
		{
			Component.initStage(stage);
			config = new MinimalConfigurator(this);
			config.parseXML(MCXML);

			contenedor = config.getCompById("contenedor") as VBox;
			contenedor.alignment = VBox.CENTER;
			contenedor.x = (stage.stageWidth - contenedor.width) / 2;
			contenedor.y = (stage.stageHeight - contenedor.height) / 2;

			playButton = config.getCompById("playButton") as PushButton;
			playButtonClickSignal = new NativeSignal(playButton, MouseEvent.CLICK, MouseEvent);
		}
	}
}
