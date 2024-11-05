//
//  MealCategoryListView.swift
//  Network18_SwiftUIDemo
//
//  Created by Neosoft on 04/11/24.
//

import SwiftUI

struct MealCategoryListView: View {
    @ObservedObject var viewModel = MealCategoryListViewModel()
    
    init() {
        self.viewModel.fetchMealData()
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.mealData) { mealCategory in
                     MealCategoryView(mealCategory: mealCategory)
            }
            .padding(.horizontal, Dimensions.minusTwentyFive)
            .background(Color.white)
            .navigationTitle(NavigationConstant.mealFeedTitle)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
