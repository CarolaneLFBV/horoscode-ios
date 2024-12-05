//
//  RatingView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension App.Views.Detail {
    struct Rating: View {
        let sign: App.Models.Sign

        var body: some View {
            Text("Rate: \(sign.rate)")
                .rectangleSection()
            Spacer()
        }
    }
}

