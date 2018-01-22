//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class ItemsListsPresenter: ItemsListsPresenterProtocol
{
    weak var view: ItemsListsViewProtocol?
    var interactor: ItemsListsInteractorInputProtocol?
    var wireFrame: ItemsListsWireFrameProtocol?
    
    init() {}
    
    func viewDidLoad() {
        interactor?.getOnlineTestData()
    }
    
    func refreshData() {
        interactor?.getOnlineTestData()
    }
}

extension ItemsListsPresenter: ItemsListsInteractorOutputProtocol {
    func dataRecv(data: [DataItem]) {
        view?.showData(data)
    }
    
    func dataError(error: Error) {
        view?.showError("An Error Occurred")
    }
}
