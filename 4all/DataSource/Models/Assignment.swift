//
//  Assignment.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct Assignment: Codable {
    var identifier: String
    var city: String
    var neighborhood: String
    var photoURL: String
    var logoURL: String
    var title: String
    var phone: String
    var text: String
    var address: String
    var latitude: Double
    var longitude: Double
    var comments: [Comment]
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case city = "cidade"
        case neighborhood = "bairro"
        case photoURL = "urlFoto"
        case logoURL = "urlLogo"
        case title = "titulo"
        case phone = "telefone"
        case text = "texto"
        case address = "endereco"
        case latitude
        case longitude
        case comments = "comentarios"
    }
    
    func getAddress() -> String {
        return "\(address) - \(city)/\(neighborhood)"
    }
}
