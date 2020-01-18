//
//  BaseTableViewDelegate.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

class BaseTableViewDelegate: NSObject, UITableViewDelegate {
    var items = [CellConfigurator]()
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = items[indexPath.row]
        
    }
}
