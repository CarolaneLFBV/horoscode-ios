//
//  Response.swift
//  Horoscode
//
//  Created by Carolane Lefebvre on 19/11/2024.
//

import Foundation

struct Response: Identifiable, Codable {
    let id = UUID()
    let sign: String
    let date: String
    let contentFr: String
    let contentEn: String
    let rate: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case sign
        case date
        case contentFr = "content_fr"
        case contentEn = "content_en"
        case rate
    }
}
