//
//  ConfigurableCell.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

protocol ConfigurableCell {
    associatedtype CellModel
    func updateCell(model: CellModel)
}
