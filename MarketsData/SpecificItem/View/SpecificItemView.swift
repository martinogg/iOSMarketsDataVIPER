//
// Created by martin ogg
// Copyright (c) 2018. All rights reserved.
//

import Foundation
import UIKit

class SpecificItemView: UIViewController
{
    var presenter: SpecificItemPresenterProtocol?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension SpecificItemView: SpecificItemViewProtocol {
    func show(item: DataItem) {
        nameLabel.text = item.name
        codeLabel.text = item.code
        valueLabel.text = "\(item.value)"
    }
}
