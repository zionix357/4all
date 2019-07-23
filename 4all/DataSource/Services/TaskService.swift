//
//  TaskService.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Moya

enum TaskService {
    case getTasks
    case getTask(id: String)
}

extension TaskService: TargetType {
    var baseURL: URL { return URL(string: "http://dev.4all.com:3003")! }
    
    var path: String {
        switch self {
        case .getTasks:
            return "/tarefa"
        case .getTask(id: let id):
            return "/tarefa/" + id
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .getTasks:
            return "{lista: [1, b, c33, ultimo]}".data(using: String.Encoding.utf8)!
        case .getTask(id: let id):
            return "{id: \(id)}".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getTasks:
            return .requestPlain
        case .getTask( _):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? { return nil }
}
