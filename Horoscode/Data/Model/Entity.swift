import Foundation

extension AstroSign {
    struct Entity: Identifiable, Codable {
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
}

extension AstroSign {
    static let example: AstroSign.Entity = .init(
    sign: "Leo",
    date: "2024-11-19",
    contentFr: "Lion, ta créativité est en feu aujourd'hui ! Il est temps d'affronter ce projet de design comme s'il s'agissait d'une bataille épique contre un boss. N'oublie pas, même les meilleurs développeurs ont besoin de pauses – peut-être prends un en-cas avant de déployer ton chef-d'œuvre !",
    contentEn: "Leo, your creativity is sizzling today! Time to tackle that design project like it’s an epic boss battle. Just remember, even the best developers need to take breaks – maybe grab a snack before you deploy your masterpiece!",
    rate: 13000
    )
}
