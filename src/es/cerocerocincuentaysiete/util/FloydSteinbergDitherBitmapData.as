package es.cerocerocincuentaysiete.util
{

	import codepods.matrix.imagedithering.IDitherBitmap;

	import flash.display.BitmapData;

	/**
	 * @author oscar de la mata
	 *
	 */
	public class FloydSteinbergDitherBitmapData implements IDitherBitmap
	{

		// Definimos las constantes R,G,B del vector de luminancia
		private static const RED : Number = 0.3086;
		private static const GREEN : Number = 0.6094;
		private static const BLUE : Number = 0.0820;

		function FloydSteinbergDitherBitmapData()
		{
		}

		/**
		 * Aplica el filtrado Floyd-Steinberg a un bitmapData
		 * 
		 * Valores de dispersión del error para el cálculo de Floyd-Steinberg (1/16)
		 * 			*	7
		 * 		3	5	1
		 * 		
		 */
		public function dither(bitmapData : BitmapData) : void
		{
			// Número de colores de la imagen de salida
			var levels : int = 1;
			var lNorm : Number = 255 / levels;

			// Valores de dispersion
			var dispersionArray : Array = [7 / 16, 3 / 16, 5 / 16, 1 / 16];

			// Declaración de variables
			var pixel : int;
			var pixelNormalized : int;
			var quantizedError : int;

			for (var y : int = 0; y < bitmapData.height;y++)
			{
				for (var x : int = 0; x <= bitmapData.width;x++)
				{
					// (X , Y)
					// Capturamos el valor del pixel en x,y
					pixel = bitmapData.getPixel(x, y);
					// Calculamos su valor en gris
					pixel = ((pixel >> 16 & 0xFF) * RED + (pixel >> 8 & 0xFF) * GREEN + (pixel & 0xFF) * BLUE);
					// Normalizamos el gris para reducir a n niveles de gris
					pixelNormalized = Math.round((pixel / 255) * levels) * lNorm;
					// Calculamos el error de cuantización entre el gris original y el normalizado
					quantizedError = pixel - pixelNormalized;
					// Colocamos el valor de gris Normalizado
					bitmapData.setPixel(x, y, (pixelNormalized << 16) | (pixelNormalized << 8) | pixelNormalized);

					// (X+1, Y)
					// Capturamos el color del pixel x+1 para aplicarle el valor de dispersión de cuantización (7/16)
					pixel = bitmapData.getPixel(x + 1, y);
					// Calculamos su valor en gris
					pixel = ((pixel >> 16 & 0xFF) * RED + (pixel >> 8 & 0xFF) * GREEN + (pixel & 0xFF) * BLUE);
					// Obtenemos el valor del pixel con la dispersión de error
					pixel += quantizedError * dispersionArray[0];
					// Fíjamos el límite del gris entre [0-255]
					pixel = clamp(pixel);
					// Colocamos el valor de pixel obtenido
					bitmapData.setPixel(x + 1, y, (pixel << 16) | (pixel << 8) | pixel);

					// (X-1, Y+1)
					// Capturamos el color del pixel x+1 para aplicarle el valor de dispersión de cuantización (3/16)
					// Repetimos el proceso anteriormente descrito
					pixel = bitmapData.getPixel(x - 1, y + 1);
					pixel = ((pixel >> 16 & 0xFF) * RED + (pixel >> 8 & 0xFF) * GREEN + (pixel & 0xFF) * BLUE);
					pixel += quantizedError * dispersionArray[1];
					pixel = clamp(pixel);
					bitmapData.setPixel(x - 1, y + 1, (pixel << 16) | (pixel << 8) | pixel);

					// (X, Y+1)
					// Capturamos el color del pixel x+1 para aplicarle el valor de dispersión de cuantización (5/16)
					// Repetimos el proceso anteriormente descrito
					pixel = bitmapData.getPixel(x, y + 1);
					pixel = ((pixel >> 16 & 0xFF) * RED + (pixel >> 8 & 0xFF) * GREEN + (pixel & 0xFF) * BLUE);
					pixel += quantizedError * dispersionArray[2];
					pixel = clamp(pixel);
					bitmapData.setPixel(x, y + 1, (pixel << 16) | (pixel << 8) | pixel);

					// (X+1, Y+1)
					// Capturamos el color del pixel x+1 para aplicarle el valor de dispersión de cuantización (1/16)
					// Repetimos el proceso anteriormente descrito
					pixel = bitmapData.getPixel(x + 1, y + 1);
					pixel = ((pixel >> 16 & 0xFF) * RED + (pixel >> 8 & 0xFF) * GREEN + (pixel & 0xFF) * BLUE);
					pixel += quantizedError * dispersionArray[3];
					pixel = clamp(pixel);
				}
			}
		}

		private function clamp(numero : int) : int
		{
			return numero < 0 ? numero = 0 : numero > 255 ? numero = 255 : numero;
		}
	}
}
