//
//  BoldTitle.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.Modifiers {
    struct BoldTitle: ViewModifier {
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
    func boldTitle() -> some View {
        modifier(AstroSign.Modifiers.BoldTitle())
    }
}
