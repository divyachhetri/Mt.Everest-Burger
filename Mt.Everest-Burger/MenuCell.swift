//
//  MenuCell.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/20/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit
class MenuCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    var iconImageView = UIImageView()
    var iconLabel = UILabel()
    
    func setupViews() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
        addSubview(iconLabel)
        
        iconImageView.topAnchor.constraint (equalTo: contentView.topAnchor).isActive = true
        iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        iconImageView.contentMode = .scaleAspectFit
        
        iconLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        iconLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        iconLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 30).isActive = true
        iconLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        iconLabel.font = UIFont(name: "Futura", size: 15)
        iconLabel.textAlignment = .natural
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


