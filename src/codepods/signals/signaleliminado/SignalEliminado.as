package codepods.signals.signaleliminado
{

	import flash.display.Sprite;

	/**
	 * @author oscar de la mata
	 * @desc Ejemplo 1 recibir una señal. 
	 */
	public class SignalEliminado extends Sprite
	{

		public var despertador : Despertador;

		/**
		 * constructor
		 */
		public function SignalEliminado()
		{
			// Creamos el objeto que emitirá nuestra señales
			despertador = new Despertador();

			// Añadimos a la señal del objeto nuestro handler
			despertador.alarmSignal.add(alarmSignalHandler);

			// Añadimos a la señal del objeto un segundo handler
			despertador.alarmSignal.add(otherAlarmSignalHandler);

			trace(" -- sonido y sirena");
			// Inicializamos el despertador
			despertador.initDespertador();

			// Eliminamos el segundo handler
			despertador.alarmSignal.remove(otherAlarmSignalHandler);

			trace(" -- solo sonido");
			// Esta llamada a initDespertador();
			// Solo ejecutarán el handler asignado para la primera señal.
			despertador.initDespertador();

			// Eliminamos todos los handlers
			despertador.alarmSignal.removeAll();

			trace(" -- ni sonido ni sirena");
			// Esta llamada a initDespertador();
			// no lanzará ningún signal
			despertador.initDespertador();
		}

		/**
		 * @desc Handler ejecutado en el momento en el que se dispara la señal. 
		 */
		private function alarmSignalHandler(valor : String) : void
		{
			trace('sonido: ' + (valor));
		}

		/**
		 * @desc Handler ejecutado en el momento en el que se dispara la señal. 
		 */
		private function otherAlarmSignalHandler(valor : String) : void
		{
			trace('sirena' + (valor));
		}
	}
}