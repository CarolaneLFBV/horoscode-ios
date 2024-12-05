//
//  Card.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI

extension Components {
    struct Card: View {
        let sign: App.Models.Sign
        let screenSize: CGRect = UIScreen.main.bounds

        var body: some View {
            NavigationLink(value: sign) {
                SignIcon(signName: sign.sign)
                Text(sign.sign)
                    .font(.title3)
            }
            .frame(width: screenSize.width / 3, height: screenSize.width / 6.8)
            .font(.title2.bold())
            .rectangleSection()
        }
    }
}


