package es.cerocerocincuentaysiete.util
{

	import flash.display.BitmapData;

	/**
	 * @author oscar de la mata
	 *
	 * Based on Matrix Operations for Image Processing by Paul Haeberli (Nov 1993)
	 * @url http://www.graficaobscura.com/matrix/index.html
	 *
	 */
	public class ConvertToGrayscaleBitmapData
	{

		// Definimos las constantes R,G,B del vector de luminancia
		private static const RED : Number = 0.3086;
		private static const GREEN : Number = 0.6094;
		private static const BLUE : Number = 0.0820;

		/**
		 *		@desc: Aplica una Matriz de transformación a un BitmapData.
		 *		@param: bitmapData de la imagen de entrada.
		 */
		public static function desaturate(bitmapData : BitmapData) : void
		{
			var pixel : uint;
			// Definimos la Matriz de transformación como un Array
			var colorMatrixArray : Array = getColorMatrixArray();

			// Recorremos todo el BitmapData
			for (var x : int = 0;x < bitmapData.width;x++)
			{
				for (var y : int = 0; y < bitmapData.height;y++)
				{
					// Recuperamos el valor del píxel para la posición x,y
					pixel = bitmapData.getPixel(x, y);
					// Devolvemos al BitmapData el valor de salida calculado.
					bitmapData.setPixel(x, y, applyFilterToPixel(pixel, colorMatrixArray));
				}
			}
		}

		/**
		 *		@desc: Define la Matriz filtro
		 *		@return: Matrix filtro en formato Array. En lugar de ser una Matriz bidimensional, colocamos los valores a
		 *		continuación uno del otro, para no tener que definir un Array de Arrays. Siendo por ejemplo el elemento 1,0
		 *		igual al elemento del array [5];
		 */
		private static function getColorMatrixArray() : Array
		{
			var colorMatrixArray : Array = new Array();

			const redVector : Array = new Array(RED, GREEN, BLUE, 0);
			const greenVector : Array = new Array(RED, GREEN, BLUE, 0);
			const blueVector : Array = new Array(RED, GREEN, BLUE, 0);

			// En este caso nos olvidamos de la cuarta fila que corresponde al alpha para economizar procesos ya que no hay
			// variación en el alpha.
			colorMatrixArray = colorMatrixArray.concat(redVector);
			colorMatrixArray = colorMatrixArray.concat(greenVector);
			colorMatrixArray = colorMatrixArray.concat(blueVector);
			return colorMatrixArray;
		}

		/**
		 *		@desc: Aplica la Matriz de transformación a píxel
		 *		@param: bitmapData de la imagen de entrada.
		 */
		private static function applyFilterToPixel(pixel : uint, cM : Array) : uint
		{
			// Extraemos las componentes de color de un píxel
			var cC : Array = pixelToComponents(pixel);

			// Aplicamos el algoritmo de transformación con la Matriz
			var red : int = cC[0] * cM [0] + cC[1] * cM [1] + cC[2] * cM [2];
			var green : int = cC[0] * cM [4] + cC[1] * cM [5] + cC[2] * cM [6];
			var blue : int = cC[0] * cM [8] + cC[1] * cM [9] + cC[2] * cM [10];

			// Recomponemos el valor del píxel desde sus componentes.
			var color : uint = componentsToPixel([red, green, blue]);
			return color;
		}

		/**
		 *		@desc: Transforma el formato hexadecimal de color en un array de componentes RGB.
		 *		@param: color hexadecimal de pixel de entrada
		 *		@return: array de componentes [R,G,B]
		 */
		private static function pixelToComponents(pixel : uint) : Array
		{
			var red : uint = pixel >> 16 | 0xFF;
			var green : uint = pixel >> 8 | 0xFF;
			var blue : uint = pixel | 0xFF;
			return [red, green, blue];
		}

		/**
		 *		@desc: compone un número hexadecimal de color desde un array de componentes
		 *		@param: array de componentes [R,G,B]
		 *		@return: color en valor hexadecimal.
		 */
		private static function componentsToPixel(components : Array) : uint
		{
			return(components[0] << 16 | components[1] << 8 | components[2]);
		}
	}
}
