package mvcs.context
{

	import mvcs.controller.FSMConstants;
	import mvcs.controller.fsmcmd.GameMenuChangedCmd;
	import mvcs.controller.fsmcmd.GameMenuEnteredCmd;
	import mvcs.controller.fsmcmd.GameMenuTearDownCmd;
	import mvcs.controller.fsmcmd.GameMenuTransitionCancelledCmd;
	import mvcs.controller.fsmcmd.GameMenuValidateEntryCmd;
	import mvcs.controller.fsmcmd.GameMenuValidateExitCmd;
	import mvcs.controller.fsmcmd.PlayGameEnteredCmd;
	import mvcs.controller.fsmcmd.PlayGameTearDownCmd;
	import mvcs.controller.fsmcmd.WinGameEnteredCmd;
	import mvcs.controller.fsmcmd.WinGameTearDownCmd;
	import mvcs.view.ApplicationMediator;
	import mvcs.view.GameMenuStateUIMediator;
	import mvcs.view.PlayGameStateUIMediator;
	import mvcs.view.WinGameStateUIMediator;
	import mvcs.view.components.GameMenuStateUI;
	import mvcs.view.components.PlayGameStateUI;
	import mvcs.view.components.WinGameStateUI;

	import org.osflash.statemachine.SignalFSMInjector;
	import org.robotlegs.base.GuardedSignalCommandMap;
	import org.robotlegs.core.IGuardedSignalCommandMap;
	import org.robotlegs.core.ISignalCommandMap;
	import org.robotlegs.mvcs.SignalContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author oscar de la mata
	 */
	public class GameContext extends SignalContext
	{

		public function GameContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void
		{
			mapController();
			mapModel();
			mapView();
		}

		private function mapView() : void
		{
			mediatorMap.mapView(GameMenuStateUI, GameMenuStateUIMediator);
			mediatorMap.mapView(PlayGameStateUI, PlayGameStateUIMediator);
			mediatorMap.mapView(WinGameStateUI, WinGameStateUIMediator);
			mediatorMap.mapView(MainGame, ApplicationMediator);
		}

		private function mapModel() : void
		{
		}

		private function mapController() : void
		{
			var fsmInjector : SignalFSMInjector = new SignalFSMInjector(injector, IGuardedSignalCommandMap(signalCommandMap));
			fsmInjector.initiate(FSMConstants.FSM);

			fsmInjector.addClass(GameMenuEnteredCmd);
			fsmInjector.addClass(GameMenuTearDownCmd);
			fsmInjector.addClass(GameMenuTransitionCancelledCmd);
			fsmInjector.addClass(GameMenuValidateEntryCmd);
			fsmInjector.addClass(GameMenuValidateExitCmd);
			fsmInjector.addClass(GameMenuChangedCmd);

			fsmInjector.addClass(PlayGameEnteredCmd);
			fsmInjector.addClass(PlayGameTearDownCmd);

			fsmInjector.addClass(WinGameEnteredCmd);
			fsmInjector.addClass(WinGameTearDownCmd);

			fsmInjector.inject();
			fsmInjector.destroy();
		}

		override  public function get signalCommandMap() : ISignalCommandMap
		{
			return _signalCommandMap || (_signalCommandMap = new GuardedSignalCommandMap(injector.createChild(injector.applicationDomain)));
		}
	}
}
