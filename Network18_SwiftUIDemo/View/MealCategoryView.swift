//
//  MealCategoryView.swift
//  Network18_SwiftUIDemo
//
//  Created by Neosoft on 04/11/24.
//

import SwiftUI

struct MealCategoryView: View {
    var mealCategory: Category
    
    var body: some View {
        HStack(spacing: Dimensions.ten) {
            
            MealImageView(urlString: mealCategory.strCategoryThumbURL)
            
            VStack(alignment: .leading, spacing: Dimensions.five) {
                if let title = mealCategory.strCategory, !title.isEmpty {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                        .lineLimit(1)
                }
                if let description = mealCategory.strCategoryDescription, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
            }
        }
        .padding(Dimensions.ten)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(Dimensions.fifteen)
        .overlay(
            RoundedRectangle(cornerRadius: Dimensions.fifteen)
                .stroke(Color.gray, lineWidth: Dimensions.one)
        )
        .shadow(radius: Dimensions.five)
    }
}
