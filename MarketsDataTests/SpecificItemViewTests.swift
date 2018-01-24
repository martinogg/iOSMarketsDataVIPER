//
//  SpecificItemViewTests.swift
//  MarketsDataTests
//
//  Created by martin ogg on 24/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
@testable import MarketsData

class SpecificItemViewTests: XCTestCase {
    
    let viewToTest = SpecificItemView()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockPresenter: SpecificItemPresenterProtocol {
        var view: SpecificItemViewProtocol?
        var interactor: SpecificItemInteractorInputProtocol?
        var wireFrame: SpecificItemWireFrameProtocol?
        var item: DataItem?
        
        var viewDidLoadCallback: (()->())?
        
        func viewDidLoad() {
            viewDidLoadCallback?()
        }
        
        
    }
    
    func testViewDidLoad() {
        let mockPresenter = MockPresenter()
        viewToTest.presenter = mockPresenter
        let expect1 = expectation(description: "presenter viewDidLoad call")
        
        mockPresenter.viewDidLoadCallback = {
            expect1.fulfill()
        }
        
        viewToTest.viewDidLoad()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testShow() {
        let name = "name1"
        let code = "code1"
        let value: Float = 1.1
        let item = DataItem(code: code, name: name, value: value)
        let nameLabel = UILabel()
        let codeLabel = UILabel()
        let valueLabel = UILabel()
        viewToTest.nameLabel = nameLabel
        viewToTest.codeLabel = codeLabel
        viewToTest.valueLabel = valueLabel
        
        viewToTest.show(item: item)
        
        XCTAssert(nameLabel.text == name)
        XCTAssert(codeLabel.text == code)
        XCTAssert(valueLabel.text == "\(value)")
    }
}

