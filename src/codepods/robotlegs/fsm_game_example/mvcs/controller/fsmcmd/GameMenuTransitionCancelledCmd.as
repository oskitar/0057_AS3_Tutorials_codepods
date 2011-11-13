package mvcs.controller.fsmcmd
{

	import org.robotlegs.mvcs.SignalCommand;

	public class GameMenuTransitionCancelledCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("GameMenuTransitionCancelledCmd");
		}
	}
}