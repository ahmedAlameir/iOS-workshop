//
//  HomeViewModel.swift
//  iOS workshop
//
//  Created by ammar on 26/05/2023.
//

import Foundation
class HomeVIewModel{
    var isLoading : Observable<Bool> = Observable(value: false)
    var cellDataSource : Observable<Array<Meal>> = Observable(value:nil)
    var foodApi:FoodApiProtocol = FoodApi()
    func getData(foodTag :String){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        foodApi.fetchFood(foodTag: foodTag){[weak self] result in
            self?.isLoading.value = false
            switch result{
            case .success(let data):
                self?.cellDataSource.value = data
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    func saveMeal(withData meal: Meal){
        DatabaseManager.shared.saveMeal(withData: meal)
    }
    func deleteMeal(withId id : Int){
        DatabaseManager.shared.deleteMeal(withId: id)
    }
    func getDataFormDataBase()-> [Meal]{
        return DatabaseManager.shared.fetchAllMeals()
    }
}
