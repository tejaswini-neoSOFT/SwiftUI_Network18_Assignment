//
//  MealData.swift
//  Network18_SwiftUIDemo
//
//  Created by Neosoft on 04/11/24.
//

import Foundation

struct MealData: Codable {
    let categories: [Category]?
}

struct Category: Codable, Identifiable {
    var id = UUID()
    let idCategory: String?
    let strCategory: String?
    let strCategoryThumbURL: String?
    let strCategoryDescription: String?
    
        enum CodingKeys: String, CodingKey {
            case idCategory, strCategory, strCategoryThumbURL = "strCategoryThumb", strCategoryDescription
        }
}
