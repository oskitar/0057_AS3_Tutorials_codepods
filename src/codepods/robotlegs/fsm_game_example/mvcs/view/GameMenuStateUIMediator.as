package mvcs.view
{

	import mvcs.controller.FSMConstants;
	import mvcs.view.components.GameMenuStateUI;

	import org.osflash.statemachine.core.IFSMController;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	public class GameMenuStateUIMediator extends Mediator
	{

		[Inject]
		public var view : GameMenuStateUI;
		[Inject]
		public var fsmController : IFSMController;

		public override function onRegister() : void
		{
			super.onRegister();
			view.draw();
			view.playButtonClickSignal.add(playButtonClickSignalHandler);
		}

		private function playButtonClickSignalHandler(m : MouseEvent) : void
		{
			fsmController.action(FSMConstants.PLAYGAME_ACTION, null);
		}
	}
}