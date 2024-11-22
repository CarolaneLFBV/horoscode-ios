import Foundation
import SwiftUI

extension AstroSign.List.ViewModels {
    @Observable
    final class ListViewModel {
        var signData = [AstroSign.Entity]()
    
        func fetchData() async {
            guard let downloadedSigns: [AstroSign.Entity] = await AstroSign.List.Repositories.ListRepository().downloadData(fromURL: "https://horoscode.dev/api/v1/horoscopes") else {return}
            signData = downloadedSigns
        }
    }

}
