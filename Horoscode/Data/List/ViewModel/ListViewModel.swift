import Foundation

extension AstroSign.ViewModels {
    @Observable
    class ListViewModel {
        typealias Entity = AstroSign.Entity
        var signData = [Entity]()
        var searchText = ""
        
        func fetchData() async {
            guard let downloadedSigns: [Entity] = await AstroSign.Repositories.ListRepository().downloadData(fromURL: "https://horoscode.dev/api/v1/horoscopes") else {return}
            signData = downloadedSigns
        }
    }

}
