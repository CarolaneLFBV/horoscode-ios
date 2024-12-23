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
                .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                    Alert(
                        title: Text("Error"),
                        message: Text(viewModel.errorMessage ?? ""),
                        dismissButton: .default(Text("OK"), action: { viewModel.errorMessage = nil })
                    )
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
