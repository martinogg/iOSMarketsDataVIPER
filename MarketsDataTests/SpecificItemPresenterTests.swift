//
//  SpecificItemPresenterTests.swift
//  MarketsDataTests
//
//  Created by martin ogg on 24/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
@testable import MarketsData

class SpecificItemPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockView: SpecificItemViewProtocol {
        var presenter: SpecificItemPresenterProtocol?
        var showCallback: ((_ item: DataItem)->())?
        func show(item: DataItem) {
            showCallback?(item)
        }
    }
    
    func testViewDidLoad() {
        let presenterToTest = SpecificItemPresenter()
        let mockItem = DataItem(code: "1", name: "1", value: 1)
        let mockView = MockView()
        let expectation1 = expectation(description: "view.show called")
        
        mockView.showCallback = { item in
            expectation1.fulfill()
            XCTAssert(item == mockItem)
        }
        
        presenterToTest.item = mockItem
        presenterToTest.view = mockView
        
        presenterToTest.viewDidLoad()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}

