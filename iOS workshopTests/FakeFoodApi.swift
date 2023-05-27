//
//  FakeFoodApi.swift
//  iOS workshopTests
//
//  Created by ahmed osama on 27/05/2023.
//

import Foundation
@testable import iOS_workshop
class FakeFoodApi: FoodApiProtocol {
    
    func fetchFood(foodTag: String, completionHandler: @escaping (Result<[Meal]?, Error>) -> Void) {
        // Implement fake response for fetchFood method
        let meals: [Meal] = [
            Meal(id: 1, name: "Meal 1"),
            Meal(id: 2, name: "Meal 2"),
            Meal(id: 3, name: "Meal 3")
        ]
        
        completionHandler(.success(meals))
    }
    
    func fetchFoodDetails(foodTag: String, completionHandler: @escaping (Result<Meal?, Error>) -> Void) {
        // Implement fake response for fetchFoodDetails method
        let meal: Meal = Meal(id: 1, name: "Meal Details")
        
        completionHandler(.success(meal))
    }
    
    func fetchSimilarRecipes(foodTag: String, completionHandler: @escaping (Result<[Meal]?, Error>) -> Void) {
        // Implement fake response for fetchSimilarRecipes method
        let similarMeals: [Meal] = [
            Meal(id: 4, name: "Similar Meal 1"),
            Meal(id: 5, name: "Similar Meal 2"),
            Meal(id: 6, name: "Similar Meal 3")
        ]
        
        completionHandler(.success(similarMeals))
    }
}
