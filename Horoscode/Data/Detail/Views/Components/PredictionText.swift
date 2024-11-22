//
//  PredictionText.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.Detail.Components {
    struct PredictionText: View {
        let sign: AstroSign.Entity
        
        var body: some View {
            VStack {
                Text(sign.getContent())
                    .rectangleSection()
            }
        }
    }
}
