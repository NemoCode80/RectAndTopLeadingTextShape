//
//  ContentView.swift
//  RectAndTopLeadingTextShape
//
//  Created by Nemo on 2024/9/27.
//

import SwiftUI

struct ContentView: View {
    @State private var textField: String = ""
    
    private let title: String = "Item A"
    private let prompt: String = "Fill the title name"
    
    var body: some View {
        ZStack {
            RectAndTopLeadingTextShape(lineWidth: 3,
                                       cornerRadius: 20,
                                       title: title,
                                       titleFont: .headline,
                                       titleBackground: .background,
                                       spacing: 30)
            
            TextField(title, text: $textField, prompt: Text(prompt))
                .padding()
                .multilineTextAlignment(.leading)
        }
        .frame(height: 70)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
