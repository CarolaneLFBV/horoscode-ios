//
//  GridList.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.List.Views {
    struct ContentList: View {
        @Environment(\.openURL) private var openURL
        @State var vm: AstroSign.List.ViewModels.ListViewModel

        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        
        var body: some View {
            if vm.signData.isEmpty {
                Text("Loading...")
                    .boldTitle()
                    .foregroundStyle(.white)
            } else {
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns) {
                            ForEach(vm.signData, id: \.id) { result in
                                NavigationLink(destination: AstroSign.Detail.Views.DetailView(sign: result)) {
                                    Components.Card(sign: result)
                                }
                            }
                        }
                                                
                        Button {
                            if let url = URL(string: "https://horoscode.dev/") {
                                openURL(url)
                            }
                        } label: {
                            Label("Q&A", systemImage: "person.fill.questionmark")
                        }
                        .buttonModifier()
                    }
                }
                .padding()
            }
        }
    }
}
