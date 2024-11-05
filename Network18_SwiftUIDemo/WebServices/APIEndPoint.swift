//
//  APIEndPoint.swift
//  Network18_SwiftUIDemo
//
//  Created by Neosoft on 04/11/24.
//

import Foundation

enum APIEndPoint {

    case fetchData
}
    
extension APIEndPoint {

    var baseURL: URL? {
    
        return URL(string: APIConstant.baseURL)
    }
    
    var path: String {
    
        switch self {
        case .fetchData:
            return ""
        }
    }
    
    var method: String {
    
        switch self {
        case .fetchData:
            return HttpMethod.get
        }
    }
    
    var parameters: [String: String] {
    
        switch self {
        case .fetchData:
               return [:]
        }
    }
    
    var urlRequest: URLRequest? {
        
        guard let baseURL = baseURL else {
            return nil
        }
        
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let finalURL = components.url else {
            return nil
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = method
        return request
    }
}

