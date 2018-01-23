//
//  SpecificItemWireFrameTests.swift
//  MarketsDataTests
//
//  Created by martin ogg on 23/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
@testable import MarketsData

class SpecificItemWireFrameTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateSpecificItemModule() {
        let mockDataItem = DataItem(code: "a", name: "b", value: 1)
        let VCToTest = SpecificItemWireFrame.createSpecificItemModule(forItem: mockDataItem)
        
        guard let moduleToTest = VCToTest as? SpecificItemView else {
            XCTFail("CreateSpecificItemModule VC returned is not a SpecificItemView")
            return
        }
        
        XCTAssert(moduleToTest.presenter is SpecificItemPresenter)
        XCTAssert(moduleToTest.presenter?.view === moduleToTest)
        XCTAssert(moduleToTest.presenter?.wireFrame is SpecificItemWireFrame)
        XCTAssert(moduleToTest.presenter?.interactor is SpecificItemInteractor)
        XCTAssert(moduleToTest.presenter?.interactor?.presenter === moduleToTest.presenter)
        XCTAssert(moduleToTest.presenter?.interactor?.APIDataManager is SpecificItemAPIDataManager)
        XCTAssert(moduleToTest.presenter?.interactor?.localDatamanager is SpecificItemLocalDataManager)
    }
    
}
