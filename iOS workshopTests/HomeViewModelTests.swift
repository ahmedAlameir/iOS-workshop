//
//  HomeViewModelTests.swift
//  iOS workshopTests
//
//  Created by ahmed osama on 27/05/2023.
//

import XCTest
@testable import iOS_workshop
class HomeViewModelTests: XCTestCase {
    var viewModel: HomeVIewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = HomeVIewModel()
        viewModel.foodApi = FakeFoodApi() // Set the fake API for testing
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testGetData() {
        // Set up the expectation
        let expectation = XCTestExpectation(description: "Data loaded successfully")
        
        // Call the getData method
        viewModel.getData(foodTag: "chicken")
        
        // Verify the cellDataSource value after the data is loaded
        viewModel.cellDataSource.bind { meals in
            XCTAssertNotNil(meals)
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5.0)
    }
    
}
