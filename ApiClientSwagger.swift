//
//  ApiClient.swift
//  testSwagger
//
//  Created by KriDan on 16.05.2021.
//

import Foundation
import Alamofire


struct TaskCreate: Encodable {
    var title: String
    var description: String
    var done: Int
    var deadline: Int
    var category_id: Int
    var priority_id: Int
}

struct Category: Decodable {
    var id: Int? = nil
    var name: String? = nil
}

struct Priority: Decodable {
    var id: Int? = nil
    var name: String? = nil
    var color: String? = nil
}

struct TaskResponse: Decodable {
    var id: Int? = nil
    var title: String? = nil
    var description: String? = nil
    var done: Int? = nil
    var deadline: String? = nil
    var category: Category? = nil
    var priority: Priority? = nil
    var created: Int? = nil

}
struct RegisterRequest: Encodable {
    var email: String
    var name: String
    var password: String
}

struct RegisterResponse: Decodable {
    var email: String? = nil
    var name: String? = nil
    var id: Int? = nil
    var api_token: String? = nil
}

class ApiClient {
    
    let baseURL = "http://practice.mobile.kreosoft.ru/api/"
    
    func register(parameters: RegisterRequest, onSuccess: @escaping (RegisterResponse) -> Void){
        AF.request(baseURL+"register", method: .post, parameters: parameters).response {
            result in
            switch result.result {
            case .success(let data):
                onSuccess(try! JSONDecoder().decode(RegisterResponse.self, from: data!))
            case .failure(let data):
                print(data.errorDescription)
            }
        }
    }
    
    func taskCreate(parameters: TaskCreate, onSuccess: @escaping (TaskResponse) -> Void){
        
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "token")!
        
        let headers = HTTPHeaders(["Accept":"application/json", "Authorization":"Bearer \(token)"])
        
        AF.request(baseURL+"tasks", method: .post, parameters: parameters, headers: headers).response {response in
            switch response.result{
            case .success(let data):
                onSuccess(try! JSONDecoder().decode(TaskResponse.self, from: data!))
            case .failure(let data):
                
                print(data.errorDescription)
            }
        }
    }
    
}
