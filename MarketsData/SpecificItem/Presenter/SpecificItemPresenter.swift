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
    
    init() {}
}
