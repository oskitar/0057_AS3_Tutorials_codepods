package codepods.signals.signaleliminado
{

	import org.osflash.signals.Signal;

	/**
	 * @author oscar de la mata
	 * @desc Objeto que puede lanzar una señal de alarma.
	 */
	public class Despertador
	{

		// Creamos el signal, pasando como parámetro la clase del objeto que devuelve.
		public var alarmSignal : Signal = new Signal(String);

		/**
		 * Constructor
		 */
		function Despertador()
		{
		}

		/**
		 * @desc lanzará una alarma al ser invocado
		 */
		public function initDespertador() : void
		{
			// En algún momento de la app debe ejecutar alarma, por ejemplo despues de un TIMER.
			// No se desarrolla el ejemplo para simplificar.

			// ...
			alarma();
		}

		/**
		 * @desc Dispara el signal, pasando un parámetro (String)
		 */
		private function alarma() : void
		{
			// Disparo de la señal
			alarmSignal.dispatch("RING");
		}
	}
}