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
            if let signType = AstroSign.SignType.fromString(signName) {
                Text(signType.imageName)
            } else {
                Text("Unknown Sign")
            }
        }
    }

}

#Preview {
   Components.SignIcon(signName: "leo")
}
