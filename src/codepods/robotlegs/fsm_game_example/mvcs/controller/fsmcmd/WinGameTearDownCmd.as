package mvcs.controller.fsmcmd
{

	import mvcs.view.components.WinGameStateUI;

	import org.robotlegs.mvcs.SignalCommand;

	public class WinGameTearDownCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("WinGameTearDownCmd");
			contextView.removeChild(contextView.getChildByName(WinGameStateUI.NAME));
		}
	}
}