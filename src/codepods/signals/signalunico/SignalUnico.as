package codepods.signals.signalunico
{

	import flash.display.Sprite;
	
	/**
	 * @author oscar de la mata
	 * @desc Ejemplo 1 recibir una señal. 
	 */
	public class SignalUnico extends Sprite
	{

		public var despertador : Despertador;

		/**
		 * constructor
		 */
		public function SignalUnico()
		{
			// Areamos el objeto que emitirá nuestra señales
			despertador = new Despertador();
			
			// Añadimos a la señal del objeto nuestro handler 
			despertador.alarmSignal.add(alarmSignalHandler);
			
			// Añadimos a la señal del objeto nuestro handler 
			//mediante addOnce, se ejecutará el handler una sola vez
			despertador.specialAlarmSignal.addOnce(alarmSignalHandler);
			
			// Inicializamos el despertador
			despertador.initDespertador();
			
			//...
			// Subsiguientes llamadas a initDespertador(); 
			// solo ejecutarán el handler asignado para la primera señal.
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