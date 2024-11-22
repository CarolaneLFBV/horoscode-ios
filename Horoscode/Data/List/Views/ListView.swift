import SwiftUI

extension AstroSign.List.Views {
    struct SignList: View {
        @State var vm = AstroSign.List.ViewModels.ListViewModel()
        var body: some View {
            NavigationStack {
                ZStack {
                    Color("PrimaryBackgroundColor")
                        .ignoresSafeArea()
                    
                    content
                        .task {
                            if vm.signData.isEmpty {
                                await vm.fetchData()
                            }
                        }
                }
            }
            
        }
    }
}

extension AstroSign.List.Views.SignList {
    private var content: some View {
        AstroSign.List.Views.ContentList(vm: vm)
    }
}

#Preview {
    AstroSign.List.Views.SignList()
}
