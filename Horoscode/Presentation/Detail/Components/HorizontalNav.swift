//
//  HorizontalNav.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 24/11/2024.
//

import SwiftUI

extension App.Views.Detail {
    struct HorizontalNav: View {
        let rows = [GridItem(.fixed(100))]
        var horoscodes: [App.Models.Sign] = []
        @Binding var selectedSign: App.Models.Sign
        
        var body: some View {
            content
        }
    }
}

extension App.Views.Detail.HorizontalNav {
    private var content: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 16) {
                ForEach(horoscodes) { sign in
                    Components.CircleItem(sign: sign,
                                          isSelected: sign == selectedSign) { selectedSign in
                        withAnimation {
                            self.selectedSign = selectedSign
                        }
                    }
                }
            }
        }
    }
}
