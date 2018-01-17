//
//  DataItem.swift
//  MarketsData
//
//  Created by martin ogg on 17/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import ObjectMapper

struct DataItem {
    var code = ""
    var name = ""
    var value: Float = 0
}

extension DataItem: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code       <- map["code"]
        name     <- map["name"]
        value     <- map["value"]
    }
    
}
