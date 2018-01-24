//
// Created by martin ogg
// Copyright (c) 2018. All rights reserved.
//

import Foundation

class SpecificItemPresenter: SpecificItemPresenterProtocol, SpecificItemInteractorOutputProtocol
{
    weak var view: SpecificItemViewProtocol?
    var interactor: SpecificItemInteractorInputProtocol?
    var wireFrame: SpecificItemWireFrameProtocol?
    var item: DataItem?
    
    func viewDidLoad() {
        guard let item = item else {
            fatalError("item not set from wireframe")
        }
        view?.show(item: item)
    }
}
