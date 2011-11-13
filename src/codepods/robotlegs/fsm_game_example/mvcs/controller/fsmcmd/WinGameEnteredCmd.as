package mvcs.controller.fsmcmd
{

	import mvcs.view.components.WinGameStateUI;

	import org.robotlegs.mvcs.SignalCommand;

	public class WinGameEnteredCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("WinGameEnteredCmd");
			var view : WinGameStateUI = new WinGameStateUI();
			contextView.addChild(view);
		}
	}
}