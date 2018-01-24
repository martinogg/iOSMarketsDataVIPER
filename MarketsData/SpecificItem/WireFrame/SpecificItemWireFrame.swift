//
// Created by martin ogg
// Copyright (c) 2018. All rights reserved.
//

import Foundation
import UIKit

class SpecificItemWireFrame: SpecificItemWireFrameProtocol
{
    static func createSpecificItemModule(forItem item: DataItem) -> UIViewController {
        
        // Generating module components
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SpecificItemVC")
        
        if let view = viewController as? SpecificItemView {
            
            let presenter: SpecificItemPresenterProtocol& SpecificItemInteractorOutputProtocol = SpecificItemPresenter()
            let interactor: SpecificItemInteractorInputProtocol = SpecificItemInteractor()
            let APIDataManager: SpecificItemAPIDataManagerInputProtocol = SpecificItemAPIDataManager()
            let localDataManager: SpecificItemLocalDataManagerInputProtocol = SpecificItemLocalDataManager()
            let wireFrame: SpecificItemWireFrameProtocol = SpecificItemWireFrame()
            
            // Connecting
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.item = item
            interactor.presenter = presenter
            interactor.APIDataManager = APIDataManager
            interactor.localDatamanager = localDataManager
        }
        
        return viewController as UIViewController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
