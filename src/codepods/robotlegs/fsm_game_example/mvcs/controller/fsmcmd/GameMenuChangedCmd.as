package mvcs.controller.fsmcmd
{

	import org.robotlegs.mvcs.SignalCommand;

	public class GameMenuChangedCmd extends SignalCommand
	{

		override public function execute() : void
		{
			trace("GameMenuChangedCmd");
		}
	}
}