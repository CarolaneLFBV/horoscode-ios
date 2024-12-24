//
//  DetailView.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//
import SwiftUI

extension App.Views {
    struct Detail: View {
        private enum Constants {
            enum Size {
                static let height: Double = 70.0
                static let padding: Double = 8.0
            }
        }
        
        @State var sign: App.Models.Sign
        @State private var viewModel = App.Views.Detail.ViewModel()
        
        var body: some View {
            ScrollView {
                App.Views.Detail.HorizontalNav(signs: viewModel.signs,
                                               selectedSign: $sign)
                VStack {
                    App.Views.Detail.Header(sign: sign)
                    App.Views.Detail.Rating(sign: sign)
                    App.Views.Detail.PredictionText(sign: sign)
                }
                .padding(Constants.Size.padding)
            }
            .task {
                await viewModel.fetch()
            }
            .background{
                Color("PrimaryBackgroundColor")
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    App.Views.Detail(sign: App.Models.Sign.example)
}
