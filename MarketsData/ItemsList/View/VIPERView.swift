//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

class VIPERView: UITableViewController, VIPERViewProtocol
{
    var presenter: VIPERPresenterProtocol?
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
    }
}

//MARK - UITableViewDataSource
extension VIPERView {
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") else {
            fatalError()
        }
        return cell
    }
}
