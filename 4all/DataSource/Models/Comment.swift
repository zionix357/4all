//
//  Comment.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct Comment: Codable {
    var photoURL: String
    var name: String
    var note: NSInteger
    var title: String
    var comment: String
    
    enum CodingKeys: String, CodingKey {
        case photoURL = "urlFoto"
        case name = "nome"
        case note = "nota"
        case title = "titulo"
        case comment = "comentario"
    }
}
