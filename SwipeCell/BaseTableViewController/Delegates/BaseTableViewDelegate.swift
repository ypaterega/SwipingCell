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
        
        //TODO
        
        if let cell = item as? TableViewConfigurator<SubClassSwipableCell, SubClassSwipableCell.ViewModel>, let cellModel = cell.conformSwipableProtocol() {
            if let swipingActions = cellModel.swipingActions {
                let configuration = UISwipeActionsConfiguration(actions: swipingActions)
                return configuration
            }
        }
        
        return nil
    }
}
