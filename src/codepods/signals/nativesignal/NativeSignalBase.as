package codepods.signals.nativesignal
{

	import flash.display.Sprite;

	/**
	 * @author oscar de la mata
	 */
	public class NativeSignalBase extends Sprite
	{

		public var despertador : Despertador;

		/**
		 * constructor
		 */
		public function NativeSignalBase()
		{
			// Creamos el objeto que emitirá nuestra señales
			despertador = new Despertador();

			// Añadimos a la señal del objeto nuestro handler
			despertador.alarmSignal.add(alarmSignalHandler);
		}

		/**
		 * @desc Handler ejecutado en el momento en el que se dispara la señal. 
		 */
		private function alarmSignalHandler(sonido : String) : void
		{
			trace('sonido: ' + (sonido));
		}
	}
}