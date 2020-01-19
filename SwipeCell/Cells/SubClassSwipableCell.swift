//
//  SubClassSwipableCell.swift
//  SwipeCell
//
//  Created by Yuriy Paterega on 18.01.2020.
//  Copyright © 2020 Yuriy Paterega. All rights reserved.
//

import UIKit

class SubClassSwipableCell: UITableViewCell, SwipableCellProtocol {
    
    var leadingAction =  [UIContextualAction]()
    var trailingAction = [UIContextualAction]()
    
    private let someLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(someLabel)
        someLabel.translatesAutoresizingMaskIntoConstraints = false
        
        someLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        someLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        someLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        someLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        someLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension SubClassSwipableCell {
    struct ViewModel {
        var labelText = ""
        var swipingActions: [UIContextualAction]?
    }
}

extension SubClassSwipableCell: ConfigurableCell {    
    func updateCell(model: ViewModel) {
        someLabel.text = model.labelText
        
        leadingAction = model.swipingActions!
        trailingAction = model.swipingActions!
    }
}
