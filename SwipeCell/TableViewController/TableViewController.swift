//
//  TableViewController.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

class TableViewController: BaseTableViewControler {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCells()
    }
    
    
    private func setupCells() {
      
        tableView.register(SubClassSwipableCell.self, forCellReuseIdentifier: "SubClassSwipableCell")
        
        var cells = [CellConfigurator]()
        
        for _ in 0...3 {
            var cellModel = SubClassSwipableCell.ViewModel()
            cellModel.labelText = "random"
            cellModel.swipingActions = createLeadingSwipingAction()
            
            let cellConfigurator = SubClassSwipableCellConfigurator(model: cellModel)
    
            cells.append(cellConfigurator)
        }
        
        addCells(cells)
    }
    
    private func createLeadingSwipingAction() -> [UIContextualAction] {
        
        var actions = [UIContextualAction]()
        
        let action_1 = UIContextualAction(style: .normal, title: "this is swipe", handler: { (action, view, completionHandler) in
            print("some")
            completionHandler(true)
        })
                
        actions.append(action_1)
        
        return actions
    }
    
}
