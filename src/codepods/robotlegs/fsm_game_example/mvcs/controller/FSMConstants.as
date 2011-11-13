package mvcs.controller
{
	public class FSMConstants
	{

		public static const IDLING_STATE : String = "STATE/IDLING";
		// // // /////////////  GAME MENU // // // /////////////
		public static const GAMEMENU_STATE : String = "STATE/GAMEMENU_STATE";
		public static const GAMEMENU_ACTION : String = "ACTION/GAMEMENU_ACTION";
		// // // /////////////  PLAY GAME // // // /////////////
		public static const PLAYGAME_STATE : String = "STATE/PLAYGAME_STATE";
		public static const PLAYGAME_ACTION : String = "ACTION/PLAYGAME_ACTION";
		// // // /////////////  WIN GAME // // // /////////////
		public static const WINGAME_STATE : String = "STATE/WINGAME_STATE";
		public static const WINGAME_ACTION : String = "ACTION/WINGAME_ACTION";
		/**
		 * XML configures the State Machine. This could be loaded from an external
		 * file as well.
		 */
		public static const FSM : XML = <fsm initial={IDLING_STATE}>

        <!-- THE INITIAL STATE -->
        <state name={IDLING_STATE} >
            <transition action={GAMEMENU_ACTION} target={GAMEMENU_STATE}/>
        </state>

	        <state name={GAMEMENU_STATE} inject ="true">
            <entered>
                <commandClass classPath="GameMenuEnteredCmd"/>
            </entered>
            <exitingGuard>
                <commandClass classPath="GameMenuValidateExitCmd"/>
            </exitingGuard>
            <enteringGuard>
                <commandClass classPath="GameMenuValidateEntryCmd"/>
            </enteringGuard>
            <cancelled>
                <commandClass classPath="GameMenuTransitionCancelledCmd"/>
            </cancelled>
            <tearDown>
                <commandClass classPath="GameMenuTearDownCmd"/>
            </tearDown>
			<changed>
                <commandClass classPath="GameMenuChangedCmd"/>
            </changed>
            <transition action={PLAYGAME_ACTION} target={PLAYGAME_STATE}/>
        </state>
		
		<state name={PLAYGAME_STATE} inject ="true">
            <entered>
                <commandClass classPath="PlayGameEnteredCmd"/>
            </entered>
            <tearDown>
                <commandClass classPath="PlayGameTearDownCmd"/>
            </tearDown>
            <transition action={GAMEMENU_ACTION} target={GAMEMENU_STATE}/>
            <transition action={WINGAME_ACTION} target={WINGAME_STATE}/>
        </state>
		
		<state name={WINGAME_STATE} inject ="true">
            <entered>
                <commandClass classPath="WinGameEnteredCmd"/>
            </entered>
            <tearDown>
                <commandClass classPath="WinGameTearDownCmd"/>
            </tearDown>
            <transition action={GAMEMENU_ACTION} target={GAMEMENU_STATE}/>
        </state>
    </fsm>;
	}
}