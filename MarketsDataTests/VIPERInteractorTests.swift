//
//  VIPERInteractorTests.swift
//  VIPERInteractorTests
//
//  Created by martin ogg on 12/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
@testable import MarketsData

class VIPERInteractorTests: XCTestCase {
    
    let interactorToTest = VIPERInteractor.init()
    
    class MockError: Error {}
    
    class MockAPIDataManager: VIPERAPIDataManagerInputProtocol {
        
        let successReturn = ["Success", "Another", "Yes"]
        let failReturn = MockError.init()
        var willReturnFail = false
        
        func getOnlineTestData(onSuccess: (([String]) -> ()), onFail: ((Error) -> ())) {
            if (willReturnFail) {
                onFail(failReturn)
            } else {
                onSuccess(successReturn)
            }
        }
    }
    
    class MockPresenter: VIPERInteractorOutputProtocol {
        var dataReceived: [String]? = nil
        var errorReceived: Error? = nil
        
        func dataRecv(data: [String]) {
            dataReceived = data
        }
        
        func dataError(error: Error) {
            errorReceived = error
        }
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetOnlineTestData() {
        let mockAPIDataManager = MockAPIDataManager.init()
        let mockPresenter = MockPresenter.init()
        
        interactorToTest.APIDataManager = mockAPIDataManager
        interactorToTest.presenter = mockPresenter
        
        interactorToTest.getOnlineTestData()
        
        guard let testDataReceived = mockPresenter.dataReceived else {
            XCTFail()
            fatalError()
        }
        
        XCTAssert(testDataReceived == mockAPIDataManager.successReturn)
        
        mockAPIDataManager.willReturnFail = true
        
        interactorToTest.getOnlineTestData()
        guard let testErrorReceived = mockPresenter.errorReceived as? MockError else {
            XCTFail()
            fatalError()
        }
        
        XCTAssert(mockAPIDataManager.failReturn === testErrorReceived)
    }
    
}
