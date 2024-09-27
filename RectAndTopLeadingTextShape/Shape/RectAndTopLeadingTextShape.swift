//
//  RectAndTopLeadingTextShape.swift
//
//  Created by Nemo on 2024/8/28.
//

import SwiftUI

/// The Shape help to quickly create a customized shape(View)
/// that can use it in ZStack with another view to show the customized view.
struct RectAndTopLeadingTextShape<S: ShapeStyle>: Shape {
    var lineWidth: CGFloat
    var cornerRadius: CGFloat
    var title: String
    var titleFont: Font
    var titleBackground: S
    var spacing: CGFloat
    
    /// Creates a shape with view as the given rounded rectangle, which can setting customized
    /// line width, corner radius, aligning title with titleFont for rectangle.
    /// 
    /// ``Do not implement it on background with image.``
    /// 
    /// - Parameters:
    ///   - lineWidth: The specified lineWidth for rect.
    ///   - cornerRadius: The cornerRadius for rect.
    ///   - title: The description for title with string.
    ///   - titleFont: The Font enum that demands the font for setting font size and aligning spacing with rect.
    ///   - titleBackground: The shapeStyle of title.
    ///   - spacing: The leading sapcing of title on the shape.
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
        default: 0
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
//            .background {
//                GeometryReader { proxy in
//                    Color.clear
//                        .overlay(self.titleBackground, in: RoundedRectangle(cornerRadius: 0))
//                        .preference(key: TitleBackgroundPreferenceKey.self, value: proxy.size.height)
//                }
//            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, spacing)
            .padding(.top, titleTopSpacing)
            .background {
                self.stroke(lineWidth: lineWidth)
            }
    }
}

fileprivate struct TitleBackgroundPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 50
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
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
