import Foundation
import SwiftUI

extension App.Views.List {
    @Observable
    final class ViewModel {
        var horoscodes: [App.Models.Sign] = []
        var errorMessage: String? = nil

        func fetch() async {
            let result = await App.Repository.Horoscode().fetchData()
            
            switch result {
            case .success(let signs):
                horoscodes = signs
                errorMessage = nil
            case .failure(let error):
                horoscodes = []
                errorMessage = error.localizedDescription
            }
        }
    }
}

