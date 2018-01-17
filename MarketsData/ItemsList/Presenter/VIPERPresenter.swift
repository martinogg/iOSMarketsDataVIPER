//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class VIPERPresenter: VIPERPresenterProtocol
{
    weak var view: VIPERViewProtocol?
    var interactor: VIPERInteractorInputProtocol?
    var wireFrame: VIPERWireFrameProtocol?
    
    init() {}
    
    func viewDidLoad() {
        interactor?.getOnlineTestData()
    }
    
    func refreshData() {
        interactor?.getOnlineTestData()
    }
}

extension VIPERPresenter: VIPERInteractorOutputProtocol {
    func dataRecv(data: [DataItem]) {
        view?.showData(data)
    }
    
    func dataError(error: Error) {
        view?.showError("An Error Occurred")
    }
}
