//
// Created by martin ogg
// Copyright (c) 2018. All rights reserved.
//

import Foundation

class SpecificItemInteractor: SpecificItemInteractorInputProtocol
{
    weak var presenter: SpecificItemInteractorOutputProtocol?
    var APIDataManager: SpecificItemAPIDataManagerInputProtocol?
    var localDatamanager: SpecificItemLocalDataManagerInputProtocol?
    
    init() {}
}
