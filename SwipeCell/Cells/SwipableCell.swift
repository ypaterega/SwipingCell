//
//  SwipableCell.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

protocol SwipableCellModel {
    var leadingActions: [UIContextualAction]? { get }
    var trailingActions: [UIContextualAction]? { get }
}

