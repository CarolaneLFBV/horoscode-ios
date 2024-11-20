//
//  DetailView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import SwiftUI

extension AstroSign.Views {
    struct DetailView: View {
        let sign: AstroSign.Entity

        var body: some View {
            ZStack {
                Color("PrimaryBackgroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                        AstroSign.Views.DetailView.HeaderView(sign: sign)
                        AstroSign.Views.DetailView.RatingView(sign: sign)
                        AstroSign.Views.DetailView.PredictionText(sign: sign)
                }
                .padding()
            }
        }
    }
}

#Preview {
    AstroSign.Views.DetailView(sign: AstroSign.example)
}
