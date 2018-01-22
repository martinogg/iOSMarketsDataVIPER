//
//  ItemsListsPresenterTests.swift
//  MarketsDataTests
//
//  Created by martin ogg on 12/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
@testable import MarketsData

class ItemsListsPresenterTests: XCTestCase {
    
    let presenterToTest = ItemsListsPresenter.init()
    
    class MockInteractor : ItemsListsInteractorInputProtocol {
        var getOnlineTestDataCallback: (()->())? = nil
        
        var presenter: ItemsListsInteractorOutputProtocol?
        var APIDataManager: ItemsListsAPIDataManagerInputProtocol?
        var localDatamanager: ItemsListsLocalDataManagerInputProtocol?
        
        func getOnlineTestData() {
            getOnlineTestDataCallback?()
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
    
    func testRefeshData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expecation = expectation(description: "getOnlineTestDataCalled")
        
        let mockInteractor = MockInteractor.init()
        mockInteractor.getOnlineTestDataCallback = {
            expecation.fulfill()
        }
        
        presenterToTest.interactor = mockInteractor
        
        presenterToTest.refreshData()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testViewDidLoad() {
        let expecation = expectation(description: "getOnlineTestDataCalled")
        
        let mockInteractor = MockInteractor.init()
        mockInteractor.getOnlineTestDataCallback = {
            expecation.fulfill()
        }
        
        presenterToTest.interactor = mockInteractor
        
        presenterToTest.viewDidLoad()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}

