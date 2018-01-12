//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class VIPERAPIDataManager: VIPERAPIDataManagerInputProtocol
{
    func getOnlineTestData(onSuccess: (([String]) -> ()), onFail: ((Error) -> ())) {
        onSuccess(["ok"]) // TODO: Alamofire Request
    }
    
    init() {}
}
