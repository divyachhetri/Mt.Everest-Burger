//
//  WebsiteController.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/28/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class WebsiteController: UIViewController {
    private let webImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "website_under_construction"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationItem.title = "BSAI TECHNO SALES"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem?.tintColor = .white
        setUpLayout()
        
    }
    func setUpLayout(){
        view.addSubview(webImageView)
        webImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    

}
