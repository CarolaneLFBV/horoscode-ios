//
//  SocialsView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

struct SocialsView: View {    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Socials")
                .boldTitle()
            Text("You can find the socials' creator here")
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

#Preview {
    SocialsView()
}