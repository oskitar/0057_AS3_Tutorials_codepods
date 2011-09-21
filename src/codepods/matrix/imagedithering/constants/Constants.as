package codepods.matrix.imagedithering.constants
{
	/**
	 * @author oscar de la mata
	 */
	public class Constants
	{

		public static const LABEL_COLOR : String = "Reset";
		public static const DITHER_MODE_AVERAGE : uint = 1;
		public static const DITHER_MODE_RANDOM : uint = 2;
		public static const DITHER_MODE_ORDERED_2x2 : uint = 3;
		public static const DITHER_MODE_ORDERED_3x3 : uint = 4;
		public static const DITHER_MODE_ORDERED_4x4 : uint = 5;
		public static const DITHER_MODE_ORDERED_8x8 : uint = 6;
		public static const DITHER_MODE_FLOYD_STEINBERG : uint = 7;
		public static const DITHER_MODE_SIERRA_2_4A : uint = 8;
		public static const MCXML : XML = <comps>
			<Label id="title" x="160" y="5" text="DITHER IMAGES -CODE PODS-"/>
		    
			<VBox x="435" y="90">
				<Label id="radiotitle" text="DITHER MODE"/>
				<VBox spacing="10">
					<VBox x ="10">
						<Label text="BASIC"/>
						<RadioButton id={DITHER_MODE_AVERAGE} label="Average" groupName="dithermode" event="click:onCheck"/>
            			<RadioButton id={DITHER_MODE_RANDOM}  label="Random" groupName="dithermode" event="click:onCheck"/>
					</VBox>
            		<VBox x ="10">
						<Label text="ORDERED"/>
						<RadioButton id={DITHER_MODE_ORDERED_2x2}  label="Ordered 2x2" groupName="dithermode" event="click:onCheck"/>
						<RadioButton id={DITHER_MODE_ORDERED_3x3}  label="Ordered 3x3" groupName="dithermode" event="click:onCheck"/>
						<RadioButton id={DITHER_MODE_ORDERED_4x4}  label="Ordered 4x4" groupName="dithermode" event="click:onCheck"/>
						<RadioButton id={DITHER_MODE_ORDERED_8x8}  label="Ordered 8x8" groupName="dithermode" event="click:onCheck"/>
					</VBox>
					<VBox x ="10">
						<Label text="ERROR-DISPERSION"/>
						<RadioButton id={DITHER_MODE_FLOYD_STEINBERG}  label="Floyd-Steinberg" groupName="dithermode" event="click:onCheck"/>
						<RadioButton id={DITHER_MODE_SIERRA_2_4A}  label="Sierra-2-4A" groupName="dithermode" event="click:onCheck"/>
					</VBox>
					<VBox >
						<PushButton id="clickButton" label={LABEL_COLOR} event="click:onClick"/>
					</VBox>
				</VBox>
				
			</VBox>
		</comps>;
	}
}