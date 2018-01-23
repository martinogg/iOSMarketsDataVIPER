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
        let view = SpecificItemView()
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
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        
        return view as UIViewController
    }
    
}
