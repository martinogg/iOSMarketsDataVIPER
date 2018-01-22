//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

protocol ItemsListsViewProtocol: class
{
    var presenter: ItemsListsPresenterProtocol? { get set }
    var alertController: UIAlertController? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func showData(_ data: [DataItem])
    func showError(_ errorText: String)
}

protocol ItemsListsWireFrameProtocol: class
{
    static func createItemsListsModule() -> UIViewController
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol ItemsListsPresenterProtocol: class
{
    var view: ItemsListsViewProtocol? { get set }
    var interactor: ItemsListsInteractorInputProtocol? { get set }
    var wireFrame: ItemsListsWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func viewDidLoad()
    func refreshData()
}

protocol ItemsListsInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func dataRecv(data: [DataItem])
    func dataError(error: Error)
}

protocol ItemsListsInteractorInputProtocol: class
{
    var presenter: ItemsListsInteractorOutputProtocol? { get set }
    var APIDataManager: ItemsListsAPIDataManagerInputProtocol? { get set }
    var localDatamanager: ItemsListsLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func getOnlineTestData()
}

protocol ItemsListsDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol ItemsListsAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func getOnlineTestData(onSuccess: @escaping (([DataItem]) -> ()), onFail: @escaping ((Error) -> ()))
}

protocol ItemsListsLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}

protocol DataCellViewProtocol: class {
    func configure(value: DataItem)
}
