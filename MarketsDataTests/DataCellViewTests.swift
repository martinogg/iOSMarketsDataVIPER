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
        
        let testValue1 = DataItem.init(code: "aa11", name: "V1", value: 1)
        let testValue2 = DataItem.init(code: "aa2", name: "V2", value: 2)
        
        dataCellViewToTest.configure(value: testValue1)
        XCTAssert(labelToTest.text == testValue1.code)
        dataCellViewToTest.configure(value: testValue2)
        XCTAssert(labelToTest.text == testValue2.code)
    }
}

