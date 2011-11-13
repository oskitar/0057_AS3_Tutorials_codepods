package mvcs.view
{

	import mvcs.controller.FSMConstants;
	import mvcs.view.components.PlayGameStateUI;

	import org.osflash.statemachine.core.IFSMController;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	public class PlayGameStateUIMediator extends Mediator
	{

		[Inject]
		public var view : PlayGameStateUI;
		[Inject]
		public var fsmController : IFSMController;

		public override function onRegister() : void
		{
			super.onRegister();
			view.draw();
			view.cancelButtonClickSignal.add(cancelButtonClickSignalHandler);
			view.winButtonClickSignal.add(winButtonClickSignalHandler);
		}

		private function winButtonClickSignalHandler(m : MouseEvent) : void
		{
			fsmController.action(FSMConstants.WINGAME_ACTION, null);
		}

		private function cancelButtonClickSignalHandler(m : MouseEvent) : void
		{
			fsmController.action(FSMConstants.GAMEMENU_ACTION, null);
		}
	}
}