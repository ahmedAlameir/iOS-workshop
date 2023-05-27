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
struct Meal: Decodable {
    var id: Int?

    var name: String?
    var credits: [Credit]?
    var thumbnailURL: String?
    var videoURL: String?
    var numServings: Int?
    var instructions: [Instruction]?
    var sections: [RecipeSection]?
    var tags:[Ingredient]?
    enum CodingKeys: String, CodingKey {
        case id

        case name
        case credits
        case thumbnailURL = "thumbnail_url"
        case videoURL = "video_url"
        case numServings = "num_servings"
        case instructions
        case sections
    }
}


struct Credit: Decodable {
    var name: String?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
    }
}

struct Instruction: Decodable {
    var displayText: String?
    
    enum CodingKeys: String, CodingKey {
        case displayText = "display_text"
    }
}
struct RecipeSection:Decodable {
    var position:Int
    var components: [RecipeComponent]
}
struct RecipeComponent:Decodable {
    var ingredient: Ingredient
    var measurements: [Measurement]
}
struct Ingredient:Decodable  {
    var name: String
}
struct Measurement :Decodable{
    var quantity: String
    var unit: Unit
}
struct Unit :Decodable{
    var name: String
}
// Add initializers for the structs
extension Meal {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)

        name = try container.decodeIfPresent(String.self, forKey: .name)
        credits = try container.decodeIfPresent([Credit].self, forKey: .credits)
        thumbnailURL = try container.decodeIfPresent(String.self, forKey: .thumbnailURL)
        videoURL = try container.decodeIfPresent(String.self, forKey: .videoURL)
        numServings = try container.decodeIfPresent(Int.self, forKey: .numServings)
        instructions = try container.decodeIfPresent([Instruction].self, forKey: .instructions)
        sections = try container.decodeIfPresent([RecipeSection].self, forKey: .sections)
    }
}

extension Credit {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
    }
}

extension Instruction {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayText = try container.decodeIfPresent(String.self, forKey: .displayText)
    }
}


