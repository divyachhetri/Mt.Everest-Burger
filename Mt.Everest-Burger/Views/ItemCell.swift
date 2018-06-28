//
//  ItemCell.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/25/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    var itemImageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
   
    func setUpLayout() {
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(itemImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        itemImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
        itemImageView.contentMode = .scaleAspectFit
        
        titleLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.textColor = .red
        titleLabel.font = UIFont(name: "Futura", size: 17)
        
        
        descriptionLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 34).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "Futura", size: 15)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
