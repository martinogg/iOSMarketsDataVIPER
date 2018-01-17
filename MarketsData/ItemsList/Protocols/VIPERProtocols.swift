//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

protocol VIPERViewProtocol: class
{
    var presenter: VIPERPresenterProtocol? { get set }
    var alertController: UIAlertController? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func showData(_ data: [DataItem])
    func showError(_ errorText: String)
}

protocol VIPERWireFrameProtocol: class
{
    static func createVIPERModule() -> UIViewController
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol VIPERPresenterProtocol: class
{
    var view: VIPERViewProtocol? { get set }
    var interactor: VIPERInteractorInputProtocol? { get set }
    var wireFrame: VIPERWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    func viewDidLoad()
    func refreshData()
}

protocol VIPERInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func dataRecv(data: [DataItem])
    func dataError(error: Error)
}

protocol VIPERInteractorInputProtocol: class
{
    var presenter: VIPERInteractorOutputProtocol? { get set }
    var APIDataManager: VIPERAPIDataManagerInputProtocol? { get set }
    var localDatamanager: VIPERLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func getOnlineTestData()
}

protocol VIPERDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol VIPERAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func getOnlineTestData(onSuccess: @escaping (([DataItem]) -> ()), onFail: @escaping ((Error) -> ()))
}

protocol VIPERLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}

protocol DataCellViewProtocol: class {
    func configure(value: DataItem)
}
