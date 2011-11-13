package mvcs.controller.fsmcmd
{

	import mvcs.view.components.GameMenuStateUI;

	import org.robotlegs.mvcs.SignalCommand;

	public class GameMenuTearDownCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("GameMenuTearDownCmd");
			contextView.removeChild(contextView.getChildByName(GameMenuStateUI.NAME));
		}
	}
}