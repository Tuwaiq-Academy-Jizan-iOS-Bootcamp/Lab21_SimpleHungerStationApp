//
//  ResturantMenu.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 08/05/1443 AH.
//

import Foundation
struct Welcome: Codable {
    let menu: [Menu]
}


struct Menu: Codable {
    let id: Int
    let title: String
    let subtitle, calories: JSONNull?
    let price: Price
    let image: String
}


struct Price: Codable {
    let value: Int
    let currency: String
}



//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

