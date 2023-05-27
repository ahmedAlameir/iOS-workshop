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
            "X-RapidAPI-Key": "4245b5e9bdmsh31a8c10b1958790p1237e8jsn43e88b98534c",
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
    
}

enum NetworkError : Error{
    case urlError
    case canNotParseData
}

