//
//  ItemsListsInteractorTests.swift
//  ItemsListsInteractorTests
//
//  Created by martin ogg on 12/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
@testable import MarketsData

extension DataItem: Equatable {
    static public func ==(lhs: DataItem, rhs: DataItem) -> Bool {
        return (
            (lhs.name == rhs.name) &&
                (lhs.code == rhs.code) &&
                (lhs.value == rhs.value) )
    }
}

class ItemsListsInteractorTests: XCTestCase {
    
    let interactorToTest = ItemsListsInteractor.init()
    
    class MockPresenter: ItemsListsInteractorOutputProtocol {
        var onDataRecvCallback: (([DataItem]) -> ())?
        var onErrorRecvCallback: ((Error) -> ())?
        
        func dataRecv(data: [DataItem]) {
            onDataRecvCallback?(data)
        }
        
        func dataError(error: Error) {
            onErrorRecvCallback?(error)
        }
    }
    
    class MockAPIDataManager: ItemsListsAPIDataManagerInputProtocol {
        
        let successReturn = [DataItem.init(code: "aa11", name: "V1", value: 1),
                             DataItem.init(code: "aa22", name: "V2", value: 2),
                             DataItem.init(code: "aa33", name: "V3", value: 3)]
        let failReturn: Error = NSError.init(domain: "Test", code: 0, userInfo: nil)
        var willReturnFail = false
        
        func getOnlineTestData(onSuccess: @escaping (([DataItem]) -> ()), onFail: @escaping ((Error) -> ())) {
            if (willReturnFail) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    onFail(self.failReturn)
                }
                
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    onSuccess(self.successReturn)
                }
            }
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
        
        let onDataRecvExpectation = expectation(description: "dataRecvExpectation")
        
        mockPresenter.onDataRecvCallback = { testDataReceived in
            XCTAssert(testDataReceived == mockAPIDataManager.successReturn)
            onDataRecvExpectation.fulfill()
        }
        
        interactorToTest.getOnlineTestData()
        
        mockAPIDataManager.willReturnFail = true
        
        let onErrorRecvExpectation = expectation(description: "errorRecvExpectation")
        
        mockPresenter.onErrorRecvCallback = { testErrorReceived in
            onErrorRecvExpectation.fulfill()
        }
        
        interactorToTest.getOnlineTestData()
        
        waitForExpectations(timeout: 5)
    }
    
}
