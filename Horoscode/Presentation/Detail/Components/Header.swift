//
//  HeaderView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension App.Views.Detail {
    struct Header: View {
        let sign: App.Models.Sign
        let screenSize: CGRect = UIScreen.main.bounds
        
        var body: some View {
            Group {
                Image("HoroscodeGlobe")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 140)
                    .padding(20)
                
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
                        .foregroundStyle(Color("BlueHoroscode"))
                }
                .frame(width: screenSize.width / 2, height: screenSize.width / 6.8)
            }
        }
    }
}
