package helloworldexample.mvcs.controller
{

	import helloworldexample.mvcs.model.ITextsModel;
	import helloworldexample.mvcs.view.HelloWorldView;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author oscar de la mata
	 */
	public class CreateViewsCommand extends Command
	{

		[Inject]
		public var model : ITextsModel;

		override public function execute() : void
		{
			var view : HelloWorldView = new HelloWorldView(model.getInitMessage());
			contextView.addChild(view);
		}
	}
}
