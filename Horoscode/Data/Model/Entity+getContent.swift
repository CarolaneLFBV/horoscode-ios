//
//  Entity+getContent.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 23/11/2024.
//

import Foundation

extension App.ClientAPI.HoroscodeAPI.Response {
    func convert() -> App.Models.Sign {
        let languageCode = Locale.current.language.languageCode?.identifier.lowercased()
        let isFrench = languageCode?.contains("fr") ?? false
        let content: String = isFrench ? contentFr : contentEn

        return App.Models.Sign(
            sign: self.astroSign,
            date: date,
            content: content,
            rate: rate
        )
    }
}

extension Array where Element == App.ClientAPI.HoroscodeAPI.Response {
    func convert() -> [App.Models.Sign] {
        self.map { $0.convert() }
    }
}
