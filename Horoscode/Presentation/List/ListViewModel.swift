import Foundation
import SwiftUI

extension App.Views.List {
    @Observable
    final class ViewModel {
        var horoscodes: [App.Models.Sign] = []
        
        func fetch() async {
            horoscodes = await App.Repository.Horoscode().fetchData() ?? []
        }
    }
}
