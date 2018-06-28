//
//  DetailsController.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/25/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class DetailsController: UIViewController, UIScrollViewDelegate {
    
    var itemTitle = ""
    var itemText = ""
    var array = ItemDetails()
    var scrollView = UIScrollView()
    
    private var itemImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private var descriptiontextLabel : UILabel = {
        var textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textAlignment = .justified
        textLabel.font = UIFont(name: "Futura", size: 17)
        textLabel.numberOfLines = 0
        return textLabel
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = itemTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        setUpLayout()
        print(array.breakfastText.count)

    }
    private func setUpLayout () {
        scrollView.addSubview(itemImageView)
        scrollView.addSubview( descriptiontextLabel)
        view.addSubview(scrollView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true

        itemImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        itemImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        itemImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.25).isActive = true
        itemImageView.image = UIImage(named: itemTitle)

        descriptiontextLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 0.0).isActive = true
        descriptiontextLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        descriptiontextLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant:-10).isActive = true
        descriptiontextLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        descriptiontextLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
        descriptiontextLabel.text = itemText
    }
    


    



}
