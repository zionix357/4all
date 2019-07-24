//
//  TaskRepository.swift
//  4all
//
//  Created by Arthur Rocha on 23/07/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Moya

protocol TaskRepositoryProtocol {
    func fetchAll(response: @escaping ([String]?, String) -> Void)
    func fetchId(id: String, response: @escaping (Assignment?, String) -> Void)
}

struct TaskRepository: TaskRepositoryProtocol {
    let provider: MoyaProvider<TaskService>
    
    init(provider: MoyaProvider<TaskService>) {
        self.provider = provider
    }
    
    func fetchAll(response: @escaping ([String]?, String) -> Void) {
        provider.request(.getTasks) { (result) in
            switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let list = try decoder.decode(List.self, from: res.data)
                    response(list.list, "Success!")
                } catch {
                    response(nil, "We could not decode the response!")
                }
            case .failure(let err):
                response(nil, err.localizedDescription)
            }
        }
    }
    
    func fetchId(id: String, response: @escaping (Assignment?, String) -> Void) {
        provider.request(.getTask(id: id)) { (result) in
            switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let assignment = try decoder.decode(Assignment.self, from: res.data)
                    response(assignment, "Success!")
                } catch {
                    response(nil, "We could not decode the response!")
                }
            case .failure(let err):
                response(nil, err.localizedDescription)
            }
        }
    }
}
