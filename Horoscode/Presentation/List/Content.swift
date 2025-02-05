//
//  Content.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension App.Views.List {
    struct Content: View {
        @State var viewModel: App.Views.List.ViewModel

        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
                
        var body: some View {
            if viewModel.signs.isEmpty {
                ZStack {
                    Color("PrimaryBackgroundColor")
                        .ignoresSafeArea()
                    
                    ProgressView("app.loading")
                }
            } else {
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.signs, id: \.sign) { sign in
                                Components.Card(sign: sign)
                            }
                        }
                    }
                    .navigationDestination(for: App.Models.Sign.self) { sign in
                        App.Views.Detail(sign: sign)
                    }
                }
                .padding()
            }
        }
    }
}
