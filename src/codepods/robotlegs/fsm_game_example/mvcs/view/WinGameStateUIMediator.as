package mvcs.view
{

	import mvcs.controller.FSMConstants;
	import mvcs.view.components.WinGameStateUI;

	import org.osflash.statemachine.core.IFSMController;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	public class WinGameStateUIMediator extends Mediator
	{

		[Inject]
		public var view : WinGameStateUI;
		[Inject]
		public var fsmController : IFSMController;

		public override function onRegister() : void
		{
			super.onRegister();
			view.draw();
			view.returnButtonClickSignal.add(returnButtonClickSignalHandler);
		}

		private function returnButtonClickSignalHandler(m : MouseEvent) : void
		{
			fsmController.action(FSMConstants.GAMEMENU_ACTION, null);
		}
	}
}