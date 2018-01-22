//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class ItemsListsInteractor: ItemsListsInteractorInputProtocol
{
    weak var presenter: ItemsListsInteractorOutputProtocol?
    var APIDataManager: ItemsListsAPIDataManagerInputProtocol?
    var localDatamanager: ItemsListsLocalDataManagerInputProtocol?
    
    init() {}
    
    func getOnlineTestData() {
        APIDataManager?.getOnlineTestData(onSuccess:{ [unowned self] (data) in
            self.presenter?.dataRecv(data: data)
        }, onFail:{ [unowned self] (error) in
            self.presenter?.dataError(error: error)
        })
    }
}
