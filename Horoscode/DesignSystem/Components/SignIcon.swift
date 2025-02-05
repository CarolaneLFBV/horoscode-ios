//
//  SignIcon.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension Components {
    struct SignIcon: View {
        let signName: String
        
        var body: some View {
            if let signType = SignType.fromString(signName) {
                Text(signType.imageName)
            } else {
                Text("error.unknown")
            }
        }
    }
}

#Preview {
   Components.SignIcon(signName: "leo")
}
