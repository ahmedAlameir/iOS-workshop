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
    var foodApi = FoodApi()
   // var dataSource : [Meal] = Array<Meal>()
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
               // self?.dataSource = data ?? []
              //  self?.mapToTableData()
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
//    func mapToTableData(){
//        cellDataSource.value = HomeViewStruct(meals: dataSource)
//    }
}
