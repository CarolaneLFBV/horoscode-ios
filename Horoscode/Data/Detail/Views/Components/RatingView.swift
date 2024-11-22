//
//  RatingView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.Detail.Components {
    struct RatingView: View {
        let sign: AstroSign.Entity
        
        var body: some View {
            Text("Rate: \(sign.rate)")
                .rectangleSection()
        }
    }
}

