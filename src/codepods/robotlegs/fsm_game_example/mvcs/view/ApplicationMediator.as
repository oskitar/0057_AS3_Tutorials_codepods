package mvcs.view
{

	import mvcs.controller.FSMConstants;

	import org.osflash.statemachine.core.IFSMController;
	import org.robotlegs.mvcs.Mediator;

	public class ApplicationMediator extends Mediator
	{

		[Inject]
		public var view : MainGame;
		[Inject]
		public var fsmController : IFSMController;

		override public function onRegister() : void
		{
			trace("ApplicationMediator");
			fsmController.action(FSMConstants.GAMEMENU_ACTION, null);
		}
	}
}