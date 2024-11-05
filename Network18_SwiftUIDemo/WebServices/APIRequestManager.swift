//
//  APIRequestManager.swift
//  Network18_SwiftUIDemo
//
//  Created by Neosoft on 04/11/24.
//

import Foundation

protocol APIRequestManagerProtocol {

    func fetchMealData(completion: @escaping (Result<MealData, NetworkError>) -> Void)
}

struct APIRequestManager: APIRequestManagerProtocol {
    
    func fetchMealData(completion: @escaping (Result<MealData, NetworkError>) -> Void) {
        let api = APIEndPoint.fetchData
        let networkManager = APIManager()
        networkManager.request(api, completion: completion)
    }
}
