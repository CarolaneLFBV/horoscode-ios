//
//  HeaderView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.Views.DetailView {
    struct HeaderView: View {
        let sign: AstroSign.Entity
        
        var body: some View {
            Group {
                Image("HoroscodeGlobe")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 140)
                    .padding(20)
                
                AstroSign.Views.DetailView.TitleDetail(sign: sign)
            }
        }
    }
}