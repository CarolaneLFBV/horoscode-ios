//
//  DetailView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI

extension AstroSign.Detail.Views {
    struct DetailView: View {
        let sign: AstroSign.Entity

        var body: some View {
            ZStack {
                Color("PrimaryBackgroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                        AstroSign.Detail.Components.HeaderView(sign: sign)
                        AstroSign.Detail.Components.RatingView(sign: sign)
                        AstroSign.Detail.Components.PredictionText(sign: sign)
                }
                .padding()
            }
        }
    }
}
