//
//  FvaouritesViewModel.swift
//  iOS workshop
//
//  Created by ammar on 26/05/2023.
//

import Foundation

class FvaouritesViewModel {
    var cellDataSource : Observable<Array<Meal>> = Observable(value:nil)
    
    func getData(){
        cellDataSource.value = DatabaseManager.shared.fetchAllMeals()
    }
    func removeMeal(IdMeal id : Int){
        DatabaseManager.shared.deleteMeal(withId: id)
        getData()
    }
    
    
    
}
