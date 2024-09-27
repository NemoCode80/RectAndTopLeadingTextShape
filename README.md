# RectAndTopLeadingTextShape
- The Shape help to quickly create a customized shape(View) that can use it in ZStack with another view to show the customized view.
- Simulate Android's *[Text fields](https://m2.material.io/components/text-fields)  - Material Design* text rectangular frame.

### *init(lineWidth:cornerRadius:title:titleFont:titleBackground:spacing:)*
Creates a shape with view as the given rounded rectangle, which can setting customized
line width, corner radius, aligning title with titleFont for rectangle.
     
Important: `Do not implement it on background with image.`

#### *Parameters:*
- lineWidth: The specified lineWidth for rect.
- cornerRadius: The cornerRadius for rect.
- titleFont: The Font enum that demands the font for setting font size and aligning spacing with rect.
- title: The description for title with string.
- titleBackground: The shapeStyle of title.
- spacing: The leading sapcing of title on the shape.

# ContentView
<img width="392" alt="截圖 2024-09-27 下午4 47 26" src="https://github.com/user-attachments/assets/7136017c-fa69-478d-8194-bb6242907c9e">
