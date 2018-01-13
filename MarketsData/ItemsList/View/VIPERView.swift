//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

class VIPERView: UITableViewController, VIPERViewProtocol
{
    var presenter: VIPERPresenterProtocol?
    var dataItems: [String]?
    var alertController: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    //MARK - VIPERViewProtocol
    func showData(_ data: [String]) {
        dataItems = data
        self.tableView.reloadData()
    }
    
    func showError(_ errorText: String) {
        if let alertController = alertController {
            alertController.title = "Error"
            alertController.message = errorText
            present(alertController, animated: true, completion: nil)
        }
    }
}

//MARK - UITableViewDataSource
extension VIPERView {
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataItems = dataItems {
            return dataItems.count
        } else {
            return 0
        }
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as? DataCellView,
            let dataItem = dataItems?[indexPath.row] else {
                fatalError()
        }
        cell.configure(value: dataItem)
        return cell
    }
}
