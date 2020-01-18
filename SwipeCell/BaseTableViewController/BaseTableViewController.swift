//
//  BaseTableViewController.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

class BaseTableViewControler: UIViewController {
    
    var tableView = UITableView()
    var tableViewDelegate = BaseTableViewDelegate()
    var tableViewDataSource = BaseTableViewDataSource()
    
    private(set) var cells = [CellConfigurator]() {
        didSet {
            tableViewDataSource.items = cells
            tableViewDelegate.items = cells
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func addCells(_ cells: [CellConfigurator]) {
        self.cells = cells
    }
    
    private func setupView() {
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension

        tableView.bounces = false
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}
