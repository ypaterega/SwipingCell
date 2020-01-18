//
//  BaseTableViewDataSource.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

class BaseTableViewDataSource: NSObject, UITableViewDataSource {
    
    var items = [CellConfigurator]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId) ?? UITableViewCell()
        item.configureCell(cell: cell)

        return cell
    }
    
}
