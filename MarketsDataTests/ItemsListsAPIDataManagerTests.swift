//
//  ItemsListsAPIDataManagerTests.swift
//  MarketsDataTests
//
//  Created by martin ogg on 15/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
import Alamofire
@testable import MarketsData

class ItemsListsAPIDataManagerTests: XCTestCase {
    
    let dataManagerToTest = ItemsListsAPIDataManager.init()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetOnlineTestData() {
        let testBundle = Bundle(for: type(of: self))
        
        let successExpectation = expectation(description: "Found json")
        let failedExpectation = expectation(description: "Failed loading incorrect json")
        let failedURLExpectation = expectation(description: "Failed with bad URL")
        
        guard let path = testBundle.path(forResource: "testdata", ofType: "json") else {
            fatalError()
        }
        dataManagerToTest.testURL = NSURL.fileURL(withPath: path)
        
        dataManagerToTest.getOnlineTestData(onSuccess: { (codes) in
            successExpectation.fulfill()
        }) { (error) in
            XCTFail()
        }
        
        guard let failPath = testBundle.path(forResource: "testfaildata", ofType: "json") else {
            fatalError()
        }
        
        dataManagerToTest.testURL = NSURL.fileURL(withPath: failPath)
        
        dataManagerToTest.getOnlineTestData(onSuccess: { (codes) in
            XCTFail()
        }) { (error) in
            failedExpectation.fulfill()
        }
        
        dataManagerToTest.testURL = URL(string: "www.abrokenurl13124124.comssss/132413r")!
        
        dataManagerToTest.getOnlineTestData(onSuccess: { (codes) in
            XCTFail()
        }) { (error) in
            failedURLExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
