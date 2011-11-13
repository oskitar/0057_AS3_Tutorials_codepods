package mvcs.controller.fsmcmd
{

	import org.robotlegs.mvcs.SignalCommand;

	public class GameMenuValidateExitCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("GameMenuValidateExitCmd");
		}
	}
}