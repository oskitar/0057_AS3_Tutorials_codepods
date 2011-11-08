package helloworldexample.mvcs.contexts
{

	import helloworldexample.mvcs.controller.CreateViewsCommand;
	import helloworldexample.mvcs.controller.GreetCommand;
	import helloworldexample.mvcs.controller.HelloWorldEvent;
	import helloworldexample.mvcs.model.ITextsModel;
	import helloworldexample.mvcs.model.TextsModel;
	import helloworldexample.mvcs.view.HelloWorldMediator;
	import helloworldexample.mvcs.view.HelloWorldView;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author oscar de la mata
	 */
	public class HelloWorldContext extends Context
	{

		function HelloWorldContext(contextView : DisplayObjectContainer)
		{
			super(contextView);
		}

		override public function startup() : void
		{
			// Mapeado de comandos
			mapCommands();
			// Mapeado de Modelos
			mapModels();
			// Mapeado de Vistas
			mapViews();

			super.startup();
		}

		private function mapCommands() : void
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CreateViewsCommand, ContextEvent, true);
			commandMap.mapEvent(HelloWorldEvent.BUTTON_CLICKED, GreetCommand, HelloWorldEvent);
		}

		private function mapModels() : void
		{
			injector.mapSingletonOf(ITextsModel, TextsModel);
		}

		private function mapViews() : void
		{
			mediatorMap.mapView(HelloWorldView, HelloWorldMediator);
		}
	}
}
