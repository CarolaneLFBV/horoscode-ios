//
//  TitleDetail.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.Detail.Components {
    struct TitleDetail: View {
        let screenSize: CGRect = UIScreen.main.bounds
        let sign: AstroSign.Entity

        var body: some View {
            VStack {
                HStack {
                    Components.SignIcon(signName: sign.sign)
                    Text(sign.sign)
                }
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                
                Text(sign.date)
                    .font(.headline)
                    .foregroundStyle(Color("PinkHoroscode"))
            }
            .frame(width: screenSize.width / 2, height: screenSize.width / 6.8)
        }
    }
}
