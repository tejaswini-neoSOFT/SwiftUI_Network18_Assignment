//
//  MealCategoryListViewModel.swift
//  Network18_SwiftUIDemo
//
//  Created by Neosoft on 04/11/24.
//

import Foundation
import SwiftUI

class MealCategoryListViewModel : ObservableObject {
    
    @Published var mealData: [Category] = []
    @Published var showAlert = false
    @Published var alertMessage = ""
    
      private let apiRequestManager: APIRequestManagerProtocol
      
      init(apiRequestManager: APIRequestManagerProtocol = APIRequestManager()) {
          self.apiRequestManager = apiRequestManager
      }
    
    func fetchMealData(){
        apiRequestManager.fetchMealData { result in
            switch result {
            case .success(let data):          
                DispatchQueue.main.async {
                    self.mealData = data.categories ?? []
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.alertMessage = error.localizedDescription
                    self.showAlert = true
                }
            }
        }
    }
    
}
