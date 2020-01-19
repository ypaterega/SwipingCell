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
        
        for i in 0...3 {
            
            var cellModel = SubClassSwipableCell.ViewModel()
            cellModel.labelText = "random"
            cellModel.leadingActions = (0..<i).map { action(style: .normal, title: "L-\($0)") }
            cellModel.trailingActions = (0..<i).map { action(style: .destructive, title: "T-\($0)") }
            
            let cellConfigurator = SubClassSwipableCellConfigurator(model: cellModel)
    
            cells.append(cellConfigurator)
        }
        
        addCells(cells)
    }
    
    private func action(style: UIContextualAction.Style, title: String) -> UIContextualAction {
        UIContextualAction(style: style, title: title) { (action, view, handler) in
            print("action with view: \(view) of cell: \(title)")
            handler(true)
        }
    }
    
}
