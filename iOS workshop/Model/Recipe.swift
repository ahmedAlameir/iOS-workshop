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
    var show_id: Int?
    var name: String?
    var credits: [Credit]?
    var thumbnail_url: String?
    var video_url: String?
    var num_servings: Int?
    var instructions: [Instruction]?
    var tags: [Ingredient]?
    
    enum CodingKeys: String, CodingKey {
        case show_id
        case name
        case credits
        case thumbnail_url
        case video_url
        case num_servings
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
    var display_text: String?
    
    enum CodingKeys: String, CodingKey {
        case display_text
    }
}

struct Ingredient: Decodable {
    var display_name: String?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case display_name
        case type
    }
}

// Add initializers for the structs
extension Meal {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        show_id = try container.decodeIfPresent(Int.self, forKey: .show_id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        credits = try container.decodeIfPresent([Credit].self, forKey: .credits)
        thumbnail_url = try container.decodeIfPresent(String.self, forKey: .thumbnail_url)
        video_url = try container.decodeIfPresent(String.self, forKey: .video_url)
        num_servings = try container.decodeIfPresent(Int.self, forKey: .num_servings)
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
        display_text = try container.decodeIfPresent(String.self, forKey: .display_text)
    }
}

extension Ingredient {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        display_name = try container.decodeIfPresent(String.self, forKey: .display_name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
    }
}
