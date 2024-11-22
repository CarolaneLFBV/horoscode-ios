//
//  BoldTitle 2.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//

import SwiftUI

extension AstroSign.Modifiers {
    struct ButtonModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding()
                .background(Color("PinkHoroscode"))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

// MARK: - Extension View
extension View {
    func buttonModifier() -> some View {
        modifier(AstroSign.Modifiers.ButtonModifier())
    }
}
