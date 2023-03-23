//
//  ApiManager.swift
//  networkingPart3
//
//  Created by Evgenii Kutasov on 15.03.2023.
//

import Foundation

enum ApiType { // создвли перечисление с кейсами
    
    case login
    case getUsers
    case getPosts
    case getAlbums
    
    var baseURL: String { // создали переменую с адресом сайта
        return "https://jsonplaceholder.typicode.com/"
    }
    
    var header: [String: String] { // создаем 
        switch self {
        case .login:
            return["authToken": "12345"]
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .login: return "login"
        case .getUsers: return "users"
        case .getPosts: return "posts"
        case .getAlbums: return "albums"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        switch self {
        case .login: request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
    
}

class ApiManager {
    static let shared = ApiManager()
    
        
    func getUsers(comletion: @escaping (Users) -> Void) {
        let request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data) {
                comletion(users)
                
            } else {
                comletion([])
            }
        }
        task.resume()
    }
    func getPosts(comletion: @escaping (Posts) -> Void) {
        let request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let posts = try? JSONDecoder().decode(Posts.self, from: data) {
                comletion(posts)
                
            } else {
                comletion([])
            }
        }
        task.resume()
    }
    func getAlbums(comletion: @escaping (Albums) -> Void) {
        let request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let albums = try? JSONDecoder().decode(Albums.self, from: data) {
                comletion(albums)
                
            } else {
                comletion([])
            }
        }
        task.resume()
    }
}


