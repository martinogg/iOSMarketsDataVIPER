//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation

class VIPERAPIDataManager: VIPERAPIDataManagerInputProtocol
{
    func getOnlineTestData(onSuccess: @escaping (([String]) -> ()), onFail: @escaping ((Error) -> ())) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //onSuccess(["ok"]) // TODO: Alamofire Request
            onFail(NSError(domain: "domain1", code: 1, userInfo: ["Error1": "Error!"]))
        }
    }
    
    init() {}
}
