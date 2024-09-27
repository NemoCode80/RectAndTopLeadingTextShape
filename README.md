# RectAndTopLeadingTextShape
- The Shape help to quickly create a customized shape(View) that can use it in ZStack with another view to show the customized view.
- Simulate Android's *[Text fields](https://m2.material.io/components/text-fields)  - Material Design* text rectangular frame.

### *init(lineWidth:cornerRadius:title:titleFont:titleBackground:spacing:)*
Creates a shape with view as the given rounded rectangle, which can setting customized
line width, corner radius, aligning title with titleFont for rectangle.
     
> Important: `Do not implement it on background with image.`

#### *Parameters:*
- lineWidth: The specified lineWidth for rect.
- cornerRadius: The cornerRadius for rect.
- titleFont: The Font enum that demands the font for setting font size and aligning spacing with rect.
- title: The description for title with string.
- titleBackground: The shapeStyle of title.
- spacing: The leading sapcing of title on the shape.

# ContentView
<img width="322" alt="截圖 2024-09-28 凌晨12 39 41" src="https://github.com/user-attachments/assets/b3531639-e8cb-4d82-b4a9-530c3ae6fb8d">

