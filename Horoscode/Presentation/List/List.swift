import SwiftUI

extension App.Views {
    struct List: View {
        @State var viewModel = App.Views.List.ViewModel()
        
        var body: some View {
            content
                .task {
                    if viewModel.horoscodes.isEmpty {
                        await viewModel.fetch()
                    }
                }
                .background{
                    Color("PrimaryBackgroundColor")
                        .ignoresSafeArea()
                }
        }
    }
}

extension App.Views.List {
    private var content: some View {
        App.Views.List.Content(viewModel: viewModel)
    }
}

#Preview {
    App.Views.List()
}
