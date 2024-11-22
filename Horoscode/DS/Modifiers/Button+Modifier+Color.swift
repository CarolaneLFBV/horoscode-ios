//
//  BoldTitle 2.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 22/11/2024.
//


extension AstroSign.Modifiers {
    struct ButtonModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.title)
                .padding(.bottom, 4)
                .bold()
        }
    }
}

// MARK: - Extension View
extension View {
    func ButtonModifier() -> some View {
        modifier(AstroSign.Modifiers.BoldTitle())
    }
}
