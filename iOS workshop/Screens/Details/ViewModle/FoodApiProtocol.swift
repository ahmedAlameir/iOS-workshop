//
//  FoodApiProtocol.swift
//  iOS workshop
//
//  Created by ahmed osama on 27/05/2023.
//

import Foundation
protocol FoodApiProtocol {
    func fetchFood(foodTag: String, completionHandler: @escaping (Result<[Meal]?, Error>) -> Void)
    func fetchFoodDetails(foodTag: String, completionHandler: @escaping (Result<Meal?, Error>) -> Void)
    func fetchSimilarRecipes(foodTag: String, completionHandler: @escaping (Result<[Meal]?, Error>) -> Void)
}
