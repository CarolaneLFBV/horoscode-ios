//
//  BoldTitle 2.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//

import SwiftUI

extension Modifiers {
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

extension View {
    func buttonModifier() -> some View {
        modifier(Modifiers.ButtonModifier())
    }
}
