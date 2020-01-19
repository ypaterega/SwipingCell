//
//  SwipableCell.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

@objc protocol SwipableCellProtocol {
    var leadingAction: [UIContextualAction] {get set}
    var trailingAction: [UIContextualAction] {get set}
}

