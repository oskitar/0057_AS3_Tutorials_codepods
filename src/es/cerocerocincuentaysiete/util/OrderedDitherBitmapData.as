package es.cerocerocincuentaysiete.util
{

	import codepods.matrix.imagedithering.IDitherBitmap;

	import flash.display.BitmapData;

	/**
	 * @author oscar de la mata
	 *
	 */
	public class OrderedDitherBitmapData implements IDitherBitmap
	{

		public static const MATRIX_TYPE_2X2 : uint = 0;
		public static const MATRIX_TYPE_3X3 : uint = 1;
		public static const MATRIX_TYPE_4X4 : uint = 2;
		public static const MATRIX_TYPE_8X8 : uint = 3;
		// Definimos las constantes R,G,B del vector de luminancia
		private static const RED : Number = 0.3086;
		private static const GREEN : Number = 0.6094;
		private static const BLUE : Number = 0.0820;
		// Definimos las diferentes Matrices bidimensionales
		private static const Matrix2x2 : Array = [[1, 3], [4, 2]];
		private static const Matrix3x3 : Array = [[8, 3, 4], [6, 1, 2], [7, 5, 9]];
		private static const Matrix4x4 : Array = [[1, 9, 3, 11], [13, 5, 15, 7], [4, 12, 2, 10], [16, 8, 14, 6]];
		private static const Matrix8x8 : Array = [[0, 32, 8, 40, 2, 34, 10, 42], [48, 16, 56, 24, 50, 18, 58, 26], [12, 44, 4, 36, 14, 46, 6, 38], [60, 28, 52, 20, 62, 30, 54, 22], [3, 35, 11, 43, 1, 33, 9, 41], [51, 19, 59, 27, 49, 17, 57, 25], [15, 47, 7, 39, 13, 45, 5, 37], [63, 31, 55, 23, 61, 29, 53, 21]];
		private var matrixType : uint;

		function OrderedDitherBitmapData(matrixType : uint)
		{
			this.matrixType = matrixType;
		}

		/**
		 *		@desc: Aplica el dither a un bitmapData
		 *		@param: bitmapData de la imagen de entrada.
		 */
		public function dither(bitmapData : BitmapData) : void
		{
			var pixel : uint, matrixValue : uint;
			var matrix : Array;

			// Indicamos el tipo de filtro
			switch (matrixType)
			{
				case MATRIX_TYPE_2X2:
					matrix = Matrix2x2;
					break;
				case MATRIX_TYPE_3X3:
					matrix = Matrix3x3;
					break;
				case MATRIX_TYPE_4X4:
					matrix = Matrix4x4;
					break;
				case MATRIX_TYPE_8X8:
					matrix = Matrix8x8;
					break;
			}
			var matrixHeight : uint = matrix.length;
			var matrixWidth : uint = (matrix[0] as Array).length;
			var matrixMultiplier : uint = 256 / (matrixWidth * matrixHeight);

			// Recorremos todo el BitmapData
			for (var x : int = 0;x < bitmapData.width;x++)
			{
				for (var y : int = 0; y < bitmapData.height;y++)
				{
					// Recuperamos el valor del píxel para la posición x,y
					// Transformamos el valor RGB a BN [0-255], valores de gris
					pixel = RGBtoBN256(bitmapData.getPixel(x, y));

					// Calculamos el valor de salida de la matriz
					matrixValue = matrixMultiplier * (matrix[x % matrixWidth][y % matrixHeight] );

					// Aplicacion de treshold manual.
					pixel = (matrixValue < pixel) ? 255 : 0;

					pixel = BN256toBN(pixel);
					bitmapData.setPixel(x, y, pixel);
				}
			}
		}

		/**
		 * Transforma un color de formato hexadecimal
		 * en un gris entre 0-255;
		 * @param: Color de entrada en formato 0xRGB 
		 * @return: El gris de salida en [0,255]
		 */
		private static function RGBtoBN256(color : uint) : uint
		{
			return ((color >> 16 & 0xFF) * RED + (color >> 8 & 0xFF) * GREEN + (color & 0xFF) * BLUE);
		}

		/**
		 * Transforma un color de formato hexadecimal
		 * en un gris entre 0-255;
		 * @param: Color de entrada en formato 0xRGB 
		 * @return: El gris de salida en formato 0xRGB
		 */
		private static function BN256toBN(color : uint) : uint
		{
			return(color << 16) | (color << 8) | color;
		}
	}
}
