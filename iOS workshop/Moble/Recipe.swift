//
//  Recipe.swift
//  iOS workshop
//
//  Created by ahmed osama on 26/05/2023.
//

import Foundation
class MealReaspond : Decodable {
    var count: Int?
    var results : [Meal]?
    
}

class Meal : Decodable{
    var show_id: Int?
    var name: String?
    var  credits : [credit]?
    var thumbnail_url: String?
    var video_url : String?
    var num_servings : Int?
    var instructions: [instruction]?
    var tags: [ingredient]?
    
    
}

class credit : Decodable{
    var name: String? //chef name
    var type: String? //mealType
    
}
class instruction : Decodable{
    var display_text: String?
}
class ingredient : Decodable{
    var display_name: String?
    var type: String?
}
