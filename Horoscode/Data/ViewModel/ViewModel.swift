//
//  ViewModel.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import Foundation

@Observable
class ContentViewModel {
    var signData = [Response]()
    var searchText = ""
    
    var searchResults: [Response] {
          if searchText.isEmpty {
              return signData
          } else {
              return signData.filter { $0.sign == searchText }
          }
      }
    
    func fetchData() async {
        guard let downloadedSigns: [Response] = await ApiService().downloadData(fromURL: "https://horoscode.dev/api/v1/horoscopes") else {return}
        signData = downloadedSigns
    }
}
