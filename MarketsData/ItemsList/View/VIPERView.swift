//
//  Created by martin ogg on 11/01/2018.
//  Copyright © 2018 martinogg. All rights reserved.
//

import Foundation
import UIKit

class VIPERView: UITableViewController, VIPERViewProtocol
{
    var presenter: VIPERPresenterProtocol?
    var dataItems: [DataItem]?
    var alertController: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    //MARK - VIPERViewProtocol
    func showData(_ data: [DataItem]) {
        dataItems = data
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    
    func showError(_ errorText: String) {
        self.tableView.refreshControl?.endRefreshing()
        if let alertController = alertController {
            alertController.title = "Error"
            alertController.message = errorText
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc private func refreshData(_ sender: Any) {
        presenter?.refreshData()
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
