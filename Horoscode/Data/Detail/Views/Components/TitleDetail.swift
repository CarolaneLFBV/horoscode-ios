//
//  TitleDetail.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.Views.DetailView {
    struct TitleDetail: View {
        let screenSize: CGRect = UIScreen.main.bounds
        let sign: AstroSign.Entity

        var body: some View {
            VStack {
                HStack {
                    AstroSign.Components.SignIcon(signName: sign.sign)
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

#Preview {
    AstroSign.Views.DetailView.TitleDetail(sign: .init(sign: "Aries", date: "12/12/2", contentFr: "", contentEn: "", rate: 0))
}
