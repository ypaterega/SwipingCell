//
//  TableViewConfigurator.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

protocol CellConfigurator {
    static var reuseId: String { get }
    func configureCell(cell: UIView)
}

class TableViewConfigurator<CellType: ConfigurableCell, CellModel>: CellConfigurator where CellType.CellModel == CellModel, CellType: UITableViewCell {
    
    static var reuseId: String { return String(describing: CellType.self) }
    let cellModel: CellModel
    
    init(model: CellModel) {
        self.cellModel = model
    }
    
    func configureCell(cell: UIView) {
        if let cell = cell as? CellType {
            cell.updateCell(model: cellModel)
        }
    }
}

extension TableViewConfigurator {
    func conformProtocol<T>(_ protocol: T.Type) -> CellModel?  {
        if CellType.self is T {
            return cellModel
        }
        
        return nil
    }
}

typealias SubClassSwipableCellConfigurator = TableViewConfigurator<SubClassSwipableCell, SubClassSwipableCell.ViewModel>
