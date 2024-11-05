//
//  APIManager.swift
//  Network18_SwiftUIDemo
//
//  Created by Neosoft on 04/11/24.
//

import Foundation
struct APIManager {

    func request<T: Decodable>(_ api: APIEndPoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        if let request = api.urlRequest {
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(.networkError(error.localizedDescription)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.emptyData("No data received from the server.")))
                    return
                }
            
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch let error {
                    completion(.failure(.decodingError(error.localizedDescription)))
                }
            }
            
            task.resume()
        }
    }
}

enum NetworkError: Error, Equatable {

    case invalidURL(String)
    case networkError(String)
    case decodingError(String)
    case emptyData(String)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL(let message):
            return "Invalid URL: \(message)"
        case .networkError(let message):
            return "Network error: \(message)"
        case .decodingError(let message):
            return "Decoding error: \(message)"
        case .emptyData(let message):
            return "EmptyData \(message)"
        }
    }
}
