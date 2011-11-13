package mvcs.controller.fsmcmd
{

	import mvcs.view.components.GameMenuStateUI;

	import org.robotlegs.mvcs.SignalCommand;

	public class GameMenuEnteredCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("GameMenuEnteredCmd");
			var view : GameMenuStateUI = new GameMenuStateUI();
			contextView.addChild(view);
		}
	}
}