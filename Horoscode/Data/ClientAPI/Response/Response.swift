//
//  Response.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 23/11/2024.
//

import Foundation

extension App.ClientAPI.HoroscodeAPI {
    struct Response: Codable {
        let astroSign: String
        let date: String
        let content: Content
        let rate: Int
        
        struct Content: Codable {
            let fr: String
            let en: String
        }
        
        enum CodingKeys: String, CodingKey {
            case astroSign = "sign"
            case date
            case content
            case rate
        }
    }
}
