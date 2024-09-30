# RectAndTopLeadingTextShape
- This shape can be used within a `ZStack`, enabling you to overlay it with other views to create a customized appearance.
- Simulate Android's *[Text fields](https://m2.material.io/components/text-fields)  - Material Design* text rectangular frame.

### *init(lineWidth:cornerRadius:title:titleFont:titleBackground:spacing:)*
Creates a customized rounded rectangle shape with configurable line width, corner radius, and title alignment.
     
> Important: `Do not implement it on background with image.`

#### *Parameters:*
- lineWidth: The width of the rectangle's border.
- cornerRadius: The radius for rounding the rectangle's corners.
- title: A string representing the title to be displayed within the rectangle.
- titleFont: A `Font` enum that specifies the font type and size for the title, ensuring proper alignment within the rectangle.
- titleBackground: The background style for the title, defined as a `ShapeStyle`.
- spacing: The leading spacing between the title and the rectangle's border.

# ContentView
<img width="322" alt="截圖 2024-09-28 凌晨12 39 41" src="https://github.com/user-attachments/assets/b3531639-e8cb-4d82-b4a9-530c3ae6fb8d">

