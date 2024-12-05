//
//  RectangleSection.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//
import SwiftUI

extension Modifiers {
    struct RectangleSection: ViewModifier {

        func body(content: Content) -> some View {
            content
                .padding()
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(Color("SecondaryBackgroundColor"))
                )
        }
    }
}

extension View {
   func rectangleSection() -> some View {
        modifier(Modifiers.RectangleSection())
    }
}
