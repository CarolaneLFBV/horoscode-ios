//
//  Sign.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 23/11/2024.
//

import Foundation

extension App.Models {
    struct Sign {
        let id: String
        let sign: String
        let date: String
        let content: String
        let rate: Int
        
        init(sign: String, date: String, content: String, rate: Int) {
            self.id = sign
            self.sign = sign
            self.date = date
            self.content = content
            self.rate = rate
        }
    }
}

extension App.Models.Sign: Identifiable {}
extension App.Models.Sign: Hashable {
    static func == (lhs: App.Models.Sign, rhs: App.Models.Sign) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension App.Models.Sign {
    static let example = App.Models.Sign(
        sign: "Gemini",
        date: "2024-11-11",
        content: "Gemini, seize the opportunities that come your way.",
        rate: 3
    )
}
