//
//  VIPERViewTests.swift
//  MarketsDataTests
//
//  Created by martin ogg on 12/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
@testable import MarketsData

class VIPERViewTests: XCTestCase {
    
    let viewToTest = VIPERView.init(style: .plain)
    
    class MockVIPERPresenter: VIPERPresenterProtocol {
        weak var view: VIPERViewProtocol?
        var interactor: VIPERInteractorInputProtocol?
        var wireFrame: VIPERWireFrameProtocol?
        var viewDidLoadCalled = false
        
        func viewDidLoad() {
            viewDidLoadCalled = true
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
    
    func testViewDidLoad() {
        let mockPresenter = MockVIPERPresenter.init()
        
        viewToTest.presenter = mockPresenter
        viewToTest.viewDidLoad()
        
        XCTAssert(mockPresenter.viewDidLoadCalled == true)
    }
    
}

