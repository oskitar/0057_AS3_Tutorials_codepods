package mvcs.controller.fsmcmd
{

	import mvcs.view.components.PlayGameStateUI;

	import org.robotlegs.mvcs.SignalCommand;

	public class PlayGameEnteredCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("PlayGameEnteredCmd");
			var view : PlayGameStateUI = new PlayGameStateUI();
			contextView.addChild(view);
		}
	}
}