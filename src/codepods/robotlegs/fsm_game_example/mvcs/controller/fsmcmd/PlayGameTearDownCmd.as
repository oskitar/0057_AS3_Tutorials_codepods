package mvcs.controller.fsmcmd
{

	import mvcs.view.components.PlayGameStateUI;

	import org.robotlegs.mvcs.SignalCommand;

	public class PlayGameTearDownCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("PlayGameTearDownCmd");
			contextView.removeChild(contextView.getChildByName(PlayGameStateUI.NAME));
		}
	}
}