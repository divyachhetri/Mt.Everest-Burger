//
//  AboutUsController.swift
//  Mt. Everest Burger
//
//  Created by Divya Pandit Chhetri on 6/19/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class AboutUsController: UIViewController, UIScrollViewDelegate {
    
    private let burgerImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "about_us_page"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var scrollView = UIScrollView()
    private let descriptiontextLabel : UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "At Everest Burger, we believe in the importance of the simple things. Things like kicking back with friends, tipping back beers, and enjoying some tasty burgers. (This is Lukla, after all.  A delicious burger is your right – perhaps even your responsibility.)\n\nWe teamed up with a few exceptional nearby farms and designed a menu around locally produced, top-tier ingredients. It’s a simple plan.  No muss, no fuss, and definitely no hormones – just uncommonly good stuff to eat and drink, much of it hailing from our own little patch of earth.\n\nSince nothing’s simpler than a burger, we aim to keep things pretty straightforward and let ours speak for themselves. Our partner farms like to keep things simple as well – we’re talking happy grass-fed cows and free-range chickens here. We hope you’ll agree: if you’re going to eat meat, this is the way to do it.\n\nWhile we’re proud of the menu, we must say the bar is no slouch, either… We’ve stocked our coolers with a huge, carefully curated collection of beers and created what we’d like to call a pretty crafty list of cocktails. Our wise and benevolent bar staff can recommend the perfect libation to complement your meal or your mood – just ask them. Our bar caters to the discerning drinker along with the avid sports fan.\n\nOur vision is anything but complicated: we believe in good food, cold drinks, and common ground. We know we’re not alone on that – and that’s how visitors came to be. This is the people’s burger bar.  Please, make yourselves at home."
        textLabel.textAlignment = .justified
        textLabel.font = UIFont(name: "Futura", size: 17)
        textLabel.numberOfLines = 0
        return textLabel
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "ABOUT US"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        setUpLayout()
    }
    
    private func setUpLayout () {
        scrollView.addSubview(burgerImageView)
        scrollView.addSubview( descriptiontextLabel)
        view.addSubview(scrollView)
       
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        burgerImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        burgerImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        burgerImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        burgerImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.4).isActive = true
        
        descriptiontextLabel.topAnchor.constraint(equalTo: burgerImageView.bottomAnchor, constant: 0.0).isActive = true
        descriptiontextLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        descriptiontextLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant:-10).isActive = true
        descriptiontextLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        descriptiontextLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -20).isActive = true
    }
   
    }


