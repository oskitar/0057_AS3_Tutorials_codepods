package codepods.signals.nativesignal
{

	import com.bit101.components.PushButton;

	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;

	import flash.events.MouseEvent;

	/**
	 * @author oscar de la mata
	 * @desc Objeto que puede lanzar una señal de alarma.
	 */
	public class Despertador
	{

		// Creamos el Signal, pasando como parámetro la clase del objeto que devuelve.
		public var alarmSignal : Signal = new Signal();
		// Creamos el Signal que recogerá el evento nativo de click de un botón.
		// Declaramos privado el ámbito de esta señal para que
		// solo despertador conozca la existencia de esta señal
		private var clickedSignal : NativeSignal;
		// MINIMAL COMPS
		private var boton : PushButton;

		/**
		 * Constructor
		 */
		function Despertador()
		{
			// Añadimos un botón de minimal comps
			boton = new PushButton();
			// La añadimos un label
			boton.label = "ALARMA";

			// Inicializamos nuestro NativeSignal, para:
			// el objeto boton
			// El evento MouseEvent.CLICK
			// Y el tipo de Evento MouseEvent
			clickedSignal = new NativeSignal(boton, MouseEvent.CLICK, MouseEvent);

			// Añadimos el handler para manipular la recepción del Native Signal
			clickedSignal.add(onClickedHandler);
		}

		/**
		 * @desc Recibe el evento del click de ratón y lanza una señal pública.
		 */
		private function onClickedHandler(event : MouseEvent) : void
		{
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
