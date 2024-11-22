//
//  SocialsView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.Views {
    struct SocialsView: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("Socials")
                    .boldTitle()
                Text("If you wish to visit his social media profiles, please click on the links below.")
                    .padding(.bottom)
                
                HStack {
                    Link("LinkedIn", destination: URL(string: "https://www.linkedin.com/in/cleprohon/")!)
                    Link("GitHub", destination: URL(string: "https://github.com/CedricLphn")!)
                    Link("Personal Website", destination: URL(string: "https://lecederom.com/")!)
                }
                .foregroundStyle(Color("PinkHoroscode"))
            }
            .frame(maxWidth: .infinity)
            .rectangleSection()
        }
    }
}

#Preview {
    AstroSign.Views.SocialsView()
}
