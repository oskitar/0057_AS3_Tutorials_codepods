package es.cerocerocincuentaysiete.util
{

	import codepods.matrix.imagedithering.IDitherBitmap;

	import flash.display.BitmapData;

	/**
	 * @author oscar de la mata
	 *
	 */
	public class AverageDitherBitmapData implements IDitherBitmap
	{

		// Definimos las constantes R,G,B del vector de luminancia
		private static const RED : Number = 0.3086;
		private static const GREEN : Number = 0.6094;
		private static const BLUE : Number = 0.0820;

		function AverageDitherBitmapData()
		{
		}

		/**
		 *		@desc: Aplica el dither a un bitmapData
		 *		@param: bitmapData de la imagen de entrada.
		 */
		public function dither(bitmapData : BitmapData) : void
		{
			var pixel : uint;

			var thresholdLimit : int = 0xffffff / 2;

			// Recorremos todo el BitmapData
			for (var x : int = 0;x < bitmapData.width;x++)
			{
				for (var y : int = 0; y < bitmapData.height;y++)
				{
					// Recuperamos el valor del píxel para la posición x,y
					// Transformamos el valor RGB a BN hex.
					// Es decir; grises con sus 3 componentes iguales
					pixel = RGBtoBN(bitmapData.getPixel(x, y));

					// Aplicacion de treshold manual.
					pixel = (pixel > thresholdLimit) ? 0xffffff : 0;

					bitmapData.setPixel(x, y, pixel);
				}
			}
		}

		/**
		 * @desc: Transforma un color de formato hexadecimal
		 * en un gris de formato hexadecimal 
		 * @param: Color de entrada en formato 0xRGB 
		 * @return: El gris de salida en formato 0xRGB
		 */
		private static function RGBtoBN(color : uint) : uint
		{
			var luma : int = ((color >> 16 & 0xFF) * RED + (color >> 8 & 0xFF) * GREEN + (color & 0xFF) * BLUE);
			return (luma << 16) | (luma << 8) | luma;
		}
	}
}
