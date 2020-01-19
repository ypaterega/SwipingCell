//
//  BaseTableViewDelegate.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

class BaseTableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var source: BaseTableViewDataSource?
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return source?.items[indexPath.row].swipeConfig(for: .leading)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return source?.items[indexPath.row].swipeConfig(for: .trailing)
    }

}
