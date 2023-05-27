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
    let sections: [RecipeSection]?

    enum CodingKeys: String, CodingKey {
        case id

        case name
        case credits
        case thumbnailURL = "thumbnail_url"
        case videoURL = "video_url"
        case numServings = "num_servings"
        case instructions
        case tags
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
    let components: [RecipeComponent]
}
struct RecipeComponent:Decodable {
    let ingredient: Ingredient
    let measurements: [Measurement]
}
struct Ingredient:Decodable  {
    let name: String
}
struct Measurement :Decodable{
    let quantity: String
    let unit: Unit
}
struct Unit :Decodable{
    let name: String
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
        tags = try container.decodeIfPresent([Ingredient].self, forKey: .tags)
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

extension Ingredient {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
        type = try container.decodeIfPresent(String.self, forKey: .type)
    }
}
