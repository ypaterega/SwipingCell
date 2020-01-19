//
//  TableViewConfigurator.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

enum SwipeActionsSide {
    case leading, trailing
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configureCell(cell: UIView)
    func swipeConfig(for side: SwipeActionsSide) -> UISwipeActionsConfiguration?
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
    
    func swipeConfig(for side: SwipeActionsSide) -> UISwipeActionsConfiguration? {
        guard let model = cellModel as? SwipableCellModel else { return nil }
        switch side {
        case .leading: return model.leadingActions.map { .init(actions: $0) }
        case .trailing: return model.trailingActions.map { .init(actions: $0) }
        }
    }
}

extension TableViewConfigurator {
    func conformProtocol<T>(_ protocol: T.Type) -> CellModel? {
        if CellType.self is T {
            return cellModel
        }
        
        return nil
    }
}

typealias SubClassSwipableCellConfigurator = TableViewConfigurator<SubClassSwipableCell, SubClassSwipableCell.ViewModel>
