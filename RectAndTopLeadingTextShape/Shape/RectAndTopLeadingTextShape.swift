//
//  RectAndTopLeadingTextShape.swift
//
//  Created by Nemo on 2024/8/28.
//

import SwiftUI

/// A custom `Shape` that allows for rapid creation of customized views.
///
/// This shape can be used within a `ZStack`, enabling you to overlay it 
/// with other views to create a customized appearance.
struct RectAndTopLeadingTextShape<S: ShapeStyle>: Shape {
    var lineWidth: CGFloat
    var cornerRadius: CGFloat
    var title: String
    var titleFont: Font
    var titleBackground: S
    var spacing: CGFloat
    
    /// Creates a customized rounded rectangle shape with configurable line width, corner radius, and title alignment.
    ///
    /// - Important: Do not apply this method to backgrounds containing images.
    ///
    /// - Parameters:
    ///   - lineWidth: The width of the rectangle's border.
    ///   - cornerRadius: The radius for rounding the rectangle's corners.
    ///   - title: A string representing the title to be displayed within the rectangle.
    ///   - titleFont: A `Font` enum that specifies the font type and size for the title, ensuring proper alignment within the rectangle.
    ///   - titleBackground: The background style for the title, defined as a `ShapeStyle`.
    ///   - spacing: The leading spacing between the title and the rectangle's border.
    init(lineWidth: CGFloat = 3, cornerRadius: CGFloat = 20, title: String = "標題名稱", titleFont: Font = .headline, titleBackground: S = .background, spacing: CGFloat = 30) {
        self.lineWidth = lineWidth
        self.cornerRadius = cornerRadius
        self.title = title
        self.titleFont = titleFont
        self.titleBackground = titleBackground
        self.spacing = spacing
    }
    
    private var halfWidth: CGFloat {
        lineWidth / 2
    }
    
    private var titleTopSpacing: CGFloat {
        switch titleFont {
        case .largeTitle: -20
        case .title: -17
        case .title2, .title3: -13
        case .body, .headline, .subheadline, .callout: -10
        case .footnote: -8
        case .caption, .caption2: -6
        default: fatalError("The titleFont has not been setting yet❗️")
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
//        path.addLines(
//            [.zero,
//             .init(x: rect.maxX - halfWidth, y: .zero),
//             .init(x: rect.maxX - halfWidth, y: rect.maxY - halfWidth),
//             .init(x: .zero + halfWidth, y: rect.maxY - halfWidth),
//             .init(x: .zero + halfWidth, y: .zero)]
//        )
        
        path.addRoundedRect(in: rect, cornerSize: .init(width: cornerRadius, height: cornerRadius))
        
        return path
    }

    var body: some View {
        Text(title)
            .font(titleFont)
            .bold()
            .foregroundStyle(.primary)
            .padding(.horizontal, 8) // a spacing with roundedRect
            .background(self.titleBackground, in: RoundedRectangle(cornerRadius: 0))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, spacing)
            .padding(.top, titleTopSpacing)
            .background {
                self.stroke(lineWidth: lineWidth)
            }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 10) {
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".largeTitle", titleFont: .largeTitle, titleBackground: .background, spacing: 100)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
            
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".title", titleFont: .title)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
            
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".title2", titleFont: .title2)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
            
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".title3", titleFont: .title3)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
            
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".body", titleFont: .body)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
            
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".headline", titleFont: .headline)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
            
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".subheadline", titleFont: .subheadline)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
            
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".footnote", titleFont: .footnote)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
            
            RectAndTopLeadingTextShape(lineWidth: 5, cornerRadius: 15, title: ".caption2", titleFont: .caption2)
                .foregroundStyle(.cyan)
                .padding()
                .frame(height: 150)
        }
    }
}
