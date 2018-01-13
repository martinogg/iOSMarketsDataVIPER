//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class VIPERInteractor: VIPERInteractorInputProtocol
{
    weak var presenter: VIPERInteractorOutputProtocol?
    var APIDataManager: VIPERAPIDataManagerInputProtocol?
    var localDatamanager: VIPERLocalDataManagerInputProtocol?
    
    init() {}
    
    func getOnlineTestData() {
        APIDataManager?.getOnlineTestData(onSuccess:{ [unowned self] (data) in
            self.presenter?.dataRecv(data: data)
        }, onFail:{ [unowned self] (error) in
            self.presenter?.dataError(error: error)
        })
    }
}
