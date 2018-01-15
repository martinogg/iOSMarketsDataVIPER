//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import Alamofire

class VIPERAPIDataManager: VIPERAPIDataManagerInputProtocol
{
    var testURL: URL = URL(string: "https://martinogg.com/test/marketdata/stocks.json")!
    
    func getOnlineTestData(onSuccess: @escaping (([String]) -> ()), onFail: @escaping ((Error) -> ())) {
        
        Alamofire
            .request(testURL, method: .get)
            .validate()
            .responseJSON(completionHandler: { (response) in
                guard response.result.isSuccess else {
                    onFail(response.result.error ?? NSError(domain: "UnknownError", code: 1, userInfo: nil))
                    return
                }
                
                guard let rows = response.result.value as? [[String: Any]] else {
                    onFail(NSError(domain: "Malformed data received", code: 1, userInfo: nil))
                    return
                }
                let entries = rows.flatMap({ (entryDict) -> String? in
                    let ret = entryDict["code"] as? String ?? "ERROR-NOCODE"
                    return ret
                })
                
                onSuccess(entries)
            })
    }
    
    init() {}
}
