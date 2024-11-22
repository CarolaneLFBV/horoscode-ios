//
//  NavigationTitle.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

struct NavigationTitle: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle.bold())
            .foregroundColor(.white)
    }
}

#Preview {
    NavigationTitle(text: "Horoscode")
}
