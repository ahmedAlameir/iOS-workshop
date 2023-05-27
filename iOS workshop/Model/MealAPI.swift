//
//  MealAPI.swift
//  iOS workshop
//
//  Created by ahmed osama on 26/05/2023.
//


import Foundation
import Alamofire

class FoodApi {
    
    func fetchFood(foodTag:String , completionHandler: @escaping (Result<[Meal]?, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": Constant.API_KEY,
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        AF.request("https://tasty.p.rapidapi.com/recipes/list",
                   method: .get,
                   parameters: ["from": "0", "size": "20", "tags":foodTag],
                   headers: headers)
        .validate()
        .responseDecodable { (response: AFDataResponse<MealReaspond>) in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value.results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    func fetchFoodDetails(foodTag:String , completionHandler: @escaping (Result<Meal?, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": Constant.API_KEY,
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        AF.request("https://tasty.p.rapidapi.com/recipes/get-more-info",
                   method: .get,
                   parameters: ["id":foodTag],
                   headers: headers)
        .validate()
        .responseDecodable { (response: AFDataResponse<Meal>) in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    func fetchSimilarRecipes(foodTag:String , completionHandler: @escaping (Result<[Meal]?, Error>) -> Void){
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": Constant.API_KEY,
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        AF.request("https://tasty.p.rapidapi.com/recipes/list-similarities",
                   method: .get,
                   parameters: ["recipe_id": foodTag],
                   headers: headers)
        .validate()
        .responseDecodable { (response: AFDataResponse<MealReaspond>) in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value.results))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}

enum NetworkError : Error{
    case urlError
    case canNotParseData
}

