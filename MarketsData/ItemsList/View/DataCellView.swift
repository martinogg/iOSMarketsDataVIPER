//
//  DataCellView.swift
//  MarketsData
//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

class DataCellView: UITableViewCell, DataCellViewProtocol {
    @IBOutlet weak var label1: UILabel!
    
    func configure(value: DataItem) {
        label1.text = value.code
    }
    
}
