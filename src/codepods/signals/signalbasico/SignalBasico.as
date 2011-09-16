package codepods.signals.signalbasico
{

	import flash.display.Sprite;
	
	/**
	 * @author oscar de la mata
	 * @desc Ejemplo 1 recibir una señal. 
	 */
	public class SignalBasico extends Sprite
	{

		public var despertador : Despertador;

		/**
		 * constructor
		 */
		public function SignalBasico()
		{
			// Areamos el objeto que emitirá nuestra señales
			despertador = new Despertador();
			
			// Añadimos a la señal del objeto nuestro handler 
			despertador.alarmSignal.add(alarmSignalHandler);
			
			// Inicializamos el despertador
			despertador.initDespertador();
			
		}
		
		/**
		 * @desc Handler ejecutado en el momento en el que se dispara la señal. 
		 */
		private function alarmSignalHandler (sonido : String):void
		{
			trace('sonido: ' + (sonido));
		}
	}
}