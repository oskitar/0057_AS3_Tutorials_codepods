package mvcs.controller.fsmcmd
{

	import org.robotlegs.mvcs.SignalCommand;

	public class GameMenuValidateEntryCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("GameMenuValidateEntryCmd");
		}
	}
}