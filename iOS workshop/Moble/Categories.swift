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
        return [Categories(categorieName: "breakfast", categorieImage: "ic_breakfast", categorieKey: "")]
    }
}
