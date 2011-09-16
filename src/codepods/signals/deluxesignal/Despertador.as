package codepods.signals.deluxesignal
{

	import org.osflash.signals.DeluxeSignal;
	import org.osflash.signals.events.GenericEvent;

	/**
	 * @author oscar de la mata
	 * @desc Objeto que puede lanzar una señal de alarma.
	 */
	public class Despertador
	{

		// Creamos el DeluxeSignal, pasando como parámetro el objeto que lo contiene
		public var alarmSignal : DeluxeSignal = new DeluxeSignal(this);
		// Variable con el contenido del sonido al que accederemos desde el Generic Event
		public var sonido : String = "RING RING";

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
			// Disparo de la señal pasando como parámetro un nuevo GenericEvent
			alarmSignal.dispatch(new GenericEvent());
		}
	}
}