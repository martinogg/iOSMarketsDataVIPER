//
//  DataCellViewTests.swift
//  DataCellViewTests
//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
import UIKit
@testable import MarketsData

class DataCellViewTests: XCTestCase {
    
    var dataCellViewToTest: DataCellView?
    
    override func setUp() {
        super.setUp()
        
        dataCellViewToTest = DataCellView.init(style: .default, reuseIdentifier: "DataCell")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConfigureCell() {
        guard let dataCellViewToTest = dataCellViewToTest else {
            XCTFail()
            fatalError()
        }
        let labelToTest = UILabel.init(frame: CGRect.zero)
        dataCellViewToTest.label1 = labelToTest
        
        let testValue1 = "Test1"
        let testValue2 = "Test222"
        
        dataCellViewToTest.configure(value: testValue1)
        XCTAssert(labelToTest.text == testValue1)
        dataCellViewToTest.configure(value: testValue2)
        XCTAssert(labelToTest.text == testValue2)
    }
}

