//
//  DetailsViewModel.swift
//  iOS workshop
//
//  Created by ahmed osama on 27/05/2023.
//

import Foundation
class DetailViewModel {
    var isLoading: Observable<Bool> = Observable(value: false)
    var mealDetails: Observable<Meal?> = Observable(value: nil)
    var similarRecipes: Observable<[Meal]?> = Observable(value: nil)
    var foodApi = FoodApi()
    
    func getMealDetails(foodTag: String) {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        
        foodApi.fetchFoodDetails(foodTag: foodTag) { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let meal):
                self?.mealDetails.value = meal
                
            case .failure(let error):
                print(error.localizedDescription)
                self?.mealDetails.value = nil
            }
        }
    }
    func getsimilarDetails(foodTag: String) {
       
        
        foodApi.fetchSimilarRecipes(foodTag: foodTag) { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let meals):
                self?.similarRecipes.value = meals
                
            case .failure(let error):
                print(error.localizedDescription)
                self?.similarRecipes.value = nil
            }
        }
    }
    
   
    
}
