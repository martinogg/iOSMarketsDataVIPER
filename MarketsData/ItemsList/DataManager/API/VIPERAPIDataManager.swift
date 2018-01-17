//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class VIPERAPIDataManager: VIPERAPIDataManagerInputProtocol
{
    var testURL: URL = URL(string: "https://martinogg.com/test/marketdata/stocks.json")!
    
    func getOnlineTestData(onSuccess: @escaping (([DataItem]) -> ()), onFail: @escaping ((Error) -> ())) {
        
        Alamofire
            .request(testURL, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[DataItem]>) in
                guard response.result.isSuccess else {
                    onFail(response.result.error ?? NSError(domain: "UnknownError", code: 1, userInfo: nil))
                    return
                }
                
                guard let rows = response.result.value else {
                    onFail(NSError(domain: "Malformed data received", code: 1, userInfo: nil))
                    return
                }
                
                onSuccess(rows)
            })
    }
    
    init() {}
}
