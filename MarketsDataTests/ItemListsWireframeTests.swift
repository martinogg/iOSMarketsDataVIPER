//
//  ItemListsWireframeTests.swift
//  MarketsDataTests
//
//  Created by martin ogg on 22/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import XCTest
@testable import MarketsData

class ItemListsWireframeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateItemsListsModule() {
        guard let createdModuleToTest = ItemsListsWireFrame.createItemsListsModule() as? ItemsListsViewProtocol else {
            XCTFail()
            fatalError()
        }
        XCTAssert(createdModuleToTest.presenter != nil)
        XCTAssert(createdModuleToTest.alertController != nil)
        
        XCTAssert(createdModuleToTest.presenter?.view != nil)
        XCTAssert(createdModuleToTest.presenter?.wireFrame != nil)
        XCTAssert(createdModuleToTest.presenter?.interactor != nil)
        XCTAssert(createdModuleToTest.presenter?.interactor?.presenter != nil)
        
        XCTAssert(createdModuleToTest.presenter?.interactor?.APIDataManager != nil)
        XCTAssert(createdModuleToTest.presenter?.interactor?.localDatamanager != nil)
    }
    
    func testMainStoryboard() {
        let storyboardToTest = ItemsListsWireFrame.mainStoryboard
        guard let storyBoardName = storyboardToTest.value(forKey: "name") as? String else {
            XCTFail()
            fatalError()
        }
        XCTAssert(storyBoardName == "Main")
    }
    
    class MockNavigationController: UINavigationController {
        var pushedViewController: UIViewController?
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
    
    func testPresentSpecificItemScreen() {
        let wireframeToTest = ItemsListsWireFrame()
        
        let mockView = ItemsListsView()
        let mockNavigationViewController = MockNavigationController.init(rootViewController: mockView)
        
        
        let mockDataItem = DataItem(code: "code", name: "name", value: 1.0)
        
        wireframeToTest.presentSpecificItemScreen(from: mockView, forItem: mockDataItem)
        
        guard let pushedNavigationController = mockNavigationViewController.pushedViewController else {
            XCTFail("No Pushed viewController")
            fatalError()
        }
        
        XCTAssert(pushedNavigationController is SpecificItemViewProtocol)
    }
}
