//
//  AboutUsController.swift
//  Mt. Everest Burger
//
//  Created by Divya Pandit Chhetri on 6/19/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class AboutUsController: UIViewController {
    
    let burgerImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "about_us_page"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptiontextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "At Everest Burger, we believe in the importance of the simple things. Things like kicking back with friends, tipping back beers, and enjoying some tasty burgers. (This is Lukla, after all.  A delicious burger is your right – perhaps even your responsibility.)\n\nWe teamed up with a few exceptional nearby farms and designed a menu around locally produced, top-tier ingredients. It’s a simple plan.  No muss, no fuss, and definitely no hormones – just uncommonly good stuff to eat and drink, much of it hailing from our own little patch of earth.\n\nSince nothing’s simpler than a burger, we aim to keep things pretty straightforward and let ours speak for themselves. Our partner farms like to keep things simple as well – we’re talking happy grass-fed cows and free-range chickens here. We hope you’ll agree: if you’re going to eat meat, this is the way to do it.\n\nWhile we’re proud of the menu, we must say the bar is no slouch, either… We’ve stocked our coolers with a huge, carefully curated collection of beers and created what we’d like to call a pretty crafty list of cocktails. Our wise and benevolent bar staff can recommend the perfect libation to complement your meal or your mood – just ask them. Our bar caters to the discerning drinker along with the avid sports fan.\n\nOur vision is anything but complicated: we believe in good food, cold drinks, and common ground. We know we’re not alone on that – and that’s how visitors came to be. This is the people’s burger bar.  Please, make yourselves at home."
        textView.isEditable = false
        textView.textAlignment = .justified
        textView.font = UIFont(name: "Futura", size: 15)
        return textView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "ABOUT US"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        setUpLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.descriptiontextView.setContentOffset(.zero, animated: false)
    }
    func setUpLayout () {
        view.addSubview(burgerImageView)
        view.addSubview(descriptiontextView)
        burgerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 58).isActive = true
        burgerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        burgerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        burgerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        descriptiontextView.topAnchor.constraint(equalTo: burgerImageView.bottomAnchor, constant: 0).isActive = true
        descriptiontextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        descriptiontextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        descriptiontextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
   
    }


