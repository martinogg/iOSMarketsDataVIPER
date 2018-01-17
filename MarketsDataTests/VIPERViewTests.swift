//
//  VIPERViewTests.swift
//  MarketsDataTests
//
//  Created by martin ogg on 12/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
import UIKit
@testable import MarketsData

class VIPERViewTests: XCTestCase {
    
    class VIPERViewForTest: VIPERView {
        var presentFuncCalled = false
        var viewControllerPresented: UIViewController?
        
        override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
            presentFuncCalled = true
            viewControllerPresented = viewControllerToPresent
            super.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }
    
    let viewToTest = VIPERViewForTest.init(style: .plain)
    
    class MockVIPERPresenter: VIPERPresenterProtocol {
        
        weak var view: VIPERViewProtocol?
        var interactor: VIPERInteractorInputProtocol?
        var wireFrame: VIPERWireFrameProtocol?
        var viewDidLoadCalled = false
        
        func viewDidLoad() {
            viewDidLoadCalled = true
        }
        
        func refreshData() {
        }
    }
    
    class MockUITableView: UITableView {
        var reloadDataCalled = false
        override func reloadData() {
            reloadDataCalled = true
        }
        
        var cellToReturn: DataCellView?
        override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell {
            guard let cellToReturn = cellToReturn else {
                fatalError()
            }
            return cellToReturn
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
    
    func testShowData() {
        let mockData = [DataItem.init(code: "aa11", name: "V1", value: 1),
                             DataItem.init(code: "aa22", name: "V2", value: 2),
                             DataItem.init(code: "aa33", name: "V3", value: 3)]
        let mockTableView = MockUITableView.init()
        
        viewToTest.tableView = mockTableView
        viewToTest.showData(mockData)
        
      
        guard let dataItemsToTest = viewToTest.dataItems else {
            XCTFail()
            fatalError()
        }
        
        XCTAssert(mockData == dataItemsToTest)
        XCTAssert(mockTableView.reloadDataCalled == true)
        
        XCTAssert(viewToTest.tableView(UITableView.init(), numberOfRowsInSection: 0) == 3)
        
        let moreMockData = [DataItem.init(code: "aa3", name: "V3", value: 3),
                        DataItem.init(code: "aa44", name: "V4", value: 4)]
        
        viewToTest.showData(moreMockData)
        
        XCTAssert(viewToTest.tableView(UITableView.init(), numberOfRowsInSection: 0) == 2)
        
        let mockDataCellView = DataCellView.init(style: .default, reuseIdentifier: "DataCellTest")
        let mockLabel = UILabel.init()
        mockDataCellView.label1 = mockLabel
        mockTableView.cellToReturn = mockDataCellView

        guard let cellToTest0 =
            viewToTest.tableView(mockTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? DataCellView else {
                XCTFail()
                fatalError()
        }
        
        XCTAssert(cellToTest0.label1.text == moreMockData[0].code)
        
        guard let cellToTest1 =
            viewToTest.tableView(mockTableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? DataCellView else {
                XCTFail()
                fatalError()
        }
        
        XCTAssert(cellToTest1.label1.text == moreMockData[1].code)
    }
    
    func testShowError() {
        let testAlertController = UIAlertController.init()
        viewToTest.alertController = testAlertController
        
        let errorText = "ErrorText"
        
        viewToTest.showError(errorText)
        
        XCTAssert(viewToTest.presentFuncCalled == true)
        XCTAssert(viewToTest.viewControllerPresented === testAlertController)
        XCTAssert(testAlertController.message == errorText)
        XCTAssert(testAlertController.title == "Error")
    }
    
}

