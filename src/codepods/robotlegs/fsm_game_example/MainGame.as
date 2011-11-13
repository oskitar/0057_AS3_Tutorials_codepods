package
{

	import mvcs.context.GameContext;

	import org.robotlegs.core.IContext;

	import flash.display.Sprite;

	/**
	 * @author oscar de la mata
	 */
	[SWF(width='320',height='240',backgroundColor='0xededed',frameRate='30')]
	public class MainGame extends Sprite
	{

		public var contextView : IContext;

		public function MainGame()
		{
			contextView = new GameContext(this);
		}
	}
}
