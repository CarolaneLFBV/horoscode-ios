//
//  GridList.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 20/11/2024.
//

import SwiftUI

extension AstroSign.Views.SignList {
    struct ContentList: View {
        @State var vm: AstroSign.ViewModels.ListViewModel

        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        
        var body: some View {
            if vm.signData.isEmpty {
                Text("Loading...")
                    .boldTitle()
            } else {
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns) {
                            ForEach(vm.signData, id: \.id) { result in
                                NavigationLink(destination: AstroSign.Views.DetailView(sign: result)) {
                                    AstroSign.Components.Card(sign: result)
                                }
                            }
                        }
                                                
                        Link("Check the Q&A", destination: URL(string: "https://horoscode.dev/")!)
                            .buttonModifier()
                    }
                }
                .padding()
            }
        }
    }
}
