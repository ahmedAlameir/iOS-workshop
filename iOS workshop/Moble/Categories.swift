//
//  Categories.swift
//  iOS workshop
//
//  Created by ahmed osama on 26/05/2023.
//

import Foundation
struct Categories{
    let categorieName:String
    let categorieImage:String
    let categorieKey:String
    init(categorieName:String,categorieImage:String,categorieKey:String){
        self.categorieName = categorieName
        self.categorieImage = categorieName
        self.categorieKey = categorieName
    }
    static func getCategories()-> [Categories] {
        return [Categories(categorieName: "Popular", categorieImage: "ic_fire", categorieKey: "middle_eastern"),
                Categories(categorieName: "Breakfast", categorieImage: "ic_breakfast", categorieKey: "breakfast"),
                Categories(categorieName: "Lunch", categorieImage: "lunch-box", categorieKey: "lunch"),
                Categories(categorieName: "Dinner", categorieImage: "ic_weddingDinner", categorieKey: "dinner"),
                Categories(categorieName: "Dessert", categorieImage: "ic_breakfast", categorieKey: "desserts")]
    }
}
