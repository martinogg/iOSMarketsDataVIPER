//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

class ItemsListsWireFrame: ItemsListsWireFrameProtocol
{
    static func createItemsListsModule() -> UIViewController
    {
        // Generating module components
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ItemsListsNavigationController")
        
        guard let view = navController.childViewControllers.first as? ItemsListsViewProtocol else {
            fatalError()
        }
        
        let presenter: ItemsListsPresenterProtocol & ItemsListsInteractorOutputProtocol = ItemsListsPresenter()
        let interactor: ItemsListsInteractorInputProtocol = ItemsListsInteractor()
        let APIDataManager: ItemsListsAPIDataManagerInputProtocol = ItemsListsAPIDataManager()
        let localDataManager: ItemsListsLocalDataManagerInputProtocol = ItemsListsLocalDataManager()
        let wireFrame: ItemsListsWireFrameProtocol = ItemsListsWireFrame()
        let alertController = UIAlertController.init()
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        // Connecting
        view.presenter = presenter
        view.alertController = alertController
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        
        return navController
    }
    
    func presentSpecificItemScreen(from view: ItemsListsViewProtocol, forItem item: DataItem) {
        
        let specificItemViewController = SpecificItemWireFrame.createSpecificItemModule(forItem: item)
        
        if let sourceView = view as? UIViewController {
            if (sourceView.navigationController != nil) {
                sourceView.navigationController?.pushViewController(specificItemViewController, animated: true)
            }
        }
        
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
