//
// Created by martin ogg
// Copyright (c) 2018. All rights reserved.
//

import Foundation
import UIKit

protocol SpecificItemViewProtocol: class
{
    var presenter: SpecificItemPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func show(item: DataItem)
}

protocol SpecificItemWireFrameProtocol: class
{
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    static func createSpecificItemModule(forItem item: DataItem) -> UIViewController
}

protocol SpecificItemPresenterProtocol: class
{
    var view: SpecificItemViewProtocol? { get set }
    var interactor: SpecificItemInteractorInputProtocol? { get set }
    var wireFrame: SpecificItemWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    var item: DataItem? { get set }
    func viewDidLoad()
}

protocol SpecificItemInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol SpecificItemInteractorInputProtocol: class
{
    var presenter: SpecificItemInteractorOutputProtocol? { get set }
    var APIDataManager: SpecificItemAPIDataManagerInputProtocol? { get set }
    var localDatamanager: SpecificItemLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol SpecificItemDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol SpecificItemAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol SpecificItemLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
