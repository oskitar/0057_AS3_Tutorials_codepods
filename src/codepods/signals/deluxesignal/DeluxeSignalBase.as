package codepods.signals.deluxesignal
{

	import org.osflash.signals.events.GenericEvent;

	import flash.display.Sprite;
	
	/**
	 * @author oscar de la mata
	 * @desc Ejemplo 1 recibir una señal. 
	 */
	public class DeluxeSignalBase extends Sprite
	{

		public var despertador : Despertador;

		/**
		 * constructor
		 */
		public function DeluxeSignalBase()
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
		private function alarmSignalHandler (event : GenericEvent):void
		{
			// Nos muestra el target (Despertador)
			trace ('target: ' + event.target);
			
			// Nos muestra la señal (AlarmSignal)
			trace ('signal: ' + event.signal);
			
			// Nos muestra el parámetro despertador.sonido
			trace('sonido: ' + (Despertador(event.target).sonido));
		}
	}
}