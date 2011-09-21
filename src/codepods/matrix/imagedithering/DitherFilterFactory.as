package codepods.matrix.imagedithering
{

	import es.cerocerocincuentaysiete.util.Sierra24ADitherBitmapData;
	import es.cerocerocincuentaysiete.util.FloydSteinbergDitherBitmapData;
	import es.cerocerocincuentaysiete.util.OrderedDitherBitmapData;
	import es.cerocerocincuentaysiete.util.RandomDitherBitmapData;
	import es.cerocerocincuentaysiete.util.AverageDitherBitmapData;

	import codepods.matrix.imagedithering.constants.Constants;

	/**
	 * @author oscar de la mata
	 */
	public class DitherFilterFactory
	{

		function DitherFilterFactory()
		{
		}

		public static function getDitherFilter(ditherMode : int) : IDitherBitmap
		{
			var dither : IDitherBitmap;

			switch (ditherMode)
			{
				case Constants.DITHER_MODE_AVERAGE:
					dither = new AverageDitherBitmapData();
					break;
				case Constants.DITHER_MODE_RANDOM:
					dither = new RandomDitherBitmapData();
					break;
				case Constants.DITHER_MODE_ORDERED_2x2:
					dither = new OrderedDitherBitmapData(OrderedDitherBitmapData.MATRIX_TYPE_2X2);
					break;
				case Constants.DITHER_MODE_ORDERED_3x3:
					dither = new OrderedDitherBitmapData(OrderedDitherBitmapData.MATRIX_TYPE_3X3);
					break;
				case Constants.DITHER_MODE_ORDERED_4x4:
					dither = new OrderedDitherBitmapData(OrderedDitherBitmapData.MATRIX_TYPE_4X4);
					break;
				case Constants.DITHER_MODE_ORDERED_8x8:
					dither = new OrderedDitherBitmapData(OrderedDitherBitmapData.MATRIX_TYPE_8X8);
					break;
				case Constants.DITHER_MODE_FLOYD_STEINBERG:
					dither = new FloydSteinbergDitherBitmapData();
					break;
				case Constants.DITHER_MODE_SIERRA_2_4A:
					dither = new Sierra24ADitherBitmapData();
					break;
			}
			return dither;
		}
	}
}