//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

class VIPERWireFrame: VIPERWireFrameProtocol
{
    static func createVIPERModule() -> UIViewController
    {
        // Generating module components
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "VIPERNavigationController")
        
        guard let view = navController.childViewControllers.first as? VIPERViewProtocol else {
            fatalError()
        }
        
        let presenter: VIPERPresenterProtocol & VIPERInteractorOutputProtocol = VIPERPresenter()
        let interactor: VIPERInteractorInputProtocol = VIPERInteractor()
        let APIDataManager: VIPERAPIDataManagerInputProtocol = VIPERAPIDataManager()
        let localDataManager: VIPERLocalDataManagerInputProtocol = VIPERLocalDataManager()
        let wireFrame: VIPERWireFrameProtocol = VIPERWireFrame()
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
        
        return view as! UIViewController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
