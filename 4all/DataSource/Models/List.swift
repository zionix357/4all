//
//  List.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

struct List: Codable {
    var list: [String]
    
    enum CodingKeys: String, CodingKey {
        case list = "lista"
    }
}
