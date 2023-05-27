//
//  FoodApiTests.swift
//  iOS workshopTests
//
//  Created by ahmed osama on 27/05/2023.
//

import XCTest
@testable import iOS_workshop // Import your app module

class FoodApiTests: XCTestCase {

    var api: FoodApi!
       
       override func setUp() {
           super.setUp()
           api = FoodApi()
       }
       
       override func tearDown() {
           api = nil
           super.tearDown()
       }
       
       func testFetchFood() {
           let expectation = XCTestExpectation(description: "Fetch food data")
           
           api.fetchFood(foodTag: "chicken") { result in
               switch result {
               case .success(let meals):
                   XCTAssertNotNil(meals)
                   expectation.fulfill()
               case .failure(let error):
                   XCTFail("Error: \(error.localizedDescription)")
               }
           }
           
           wait(for: [expectation], timeout: 5.0)
       }
       
       func testFetchFoodDetails() {
           let expectation = XCTestExpectation(description: "Fetch food details")
           
           api.fetchFoodDetails(foodTag: "8138") { result in
               switch result {
               case .success(let meal):
                   XCTAssertNotNil(meal)
                   expectation.fulfill()
               case .failure(let error):
                   XCTFail("Error: \(error.localizedDescription)")
               }
           }
           
           wait(for: [expectation], timeout: 10.0)
       }
       
       func testFetchSimilarRecipes() {
           let expectation = XCTestExpectation(description: "Fetch similar recipes")
           
           api.fetchSimilarRecipes(foodTag: "8138") { result in
               switch result {
               case .success(let meals):
                   XCTAssertNotNil(meals)
                   expectation.fulfill()
               case .failure(let error):
                   XCTFail("Error: \(error.localizedDescription)")
               }
           }
           
           wait(for: [expectation], timeout: 10.0)
       }
}
