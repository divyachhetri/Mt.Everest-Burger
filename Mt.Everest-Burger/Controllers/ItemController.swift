//
//  ItemController.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/21/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class ItemController: UIViewController, MenuDelegate {
    
    let homeView = HomeController()
    let menuLauncher = MenuLauncher()
    
    let itemDetails = ItemDetails()
    var itemImage = [""]
    var itemTitle = [""]
    var itemText = [""]
    var itemCount = 0
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuLauncher.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        view.backgroundColor = .white
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "CellId")
        setNavBarItems()
        setCollectionView()
        //print(itemDetails.coffeeImage)

        
    }

    func setNavBarItems() {
        
        self.navigationItem.leftItemsSupplementBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
        
        let menuButton = UIButton(type: .system)
        menuButton.setImage(#imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), for: .normal )
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        menuButton.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search..."
        navigationItem.titleView = searchBar
        
    }
    
    @objc func showMenu() {
        menuLauncher.launchMenu()
    }
    
    func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    func menuDidSelectItem(index: Int) {
        showSelectedController(index: index)
    }
    func showSelectedController (index : Int) {
        
        let aboutUSController = AboutUsController()
        let contactUsController = ContactUsController()
        let homeController = HomeController()
        switch index {
        case 0:
            self.navigationController?.pushViewController(homeController, animated: true)
        case 1:
            self.navigationController?.pushViewController(aboutUSController, animated: true)
        case 2:
            itemCount = itemDetails.coffeeTitle.count
            itemTitle = itemDetails.coffeeTitle
            itemImage = itemDetails.coffeeImage
            itemText = itemDetails.coffeeText
            collectionView.reloadData()
          
        case 3:
            itemCount = itemDetails.burgerTitle.count
            itemTitle = itemDetails.burgerTitle
            itemImage = itemDetails.burgerImage
            itemText = itemDetails.burgerText
            collectionView.reloadData()
    
        case 4:
            itemImage = itemDetails.sizzlerImage
            itemText = itemDetails.sizzlerText
            itemTitle = itemDetails.sizzlerTitle
            itemCount = itemDetails.sizzlerTitle.count
            collectionView.reloadData()
            
        case 6:
            itemCount = itemDetails.steakTitle.count
            itemTitle = itemDetails.steakTitle
            itemImage = itemDetails.steakImage
            itemText = itemDetails.steakText
            collectionView.reloadData()
            menuLauncher.dismissMenu()
        case 8:
            self.navigationController?.pushViewController(contactUsController, animated: true)
            
        default:
            menuLauncher.dismissMenu()
        }
    }
}
extension ItemController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! ItemCell
        cell.itemImageView.image = UIImage(named: itemImage[indexPath.row])
        cell.titleLabel.text = itemTitle[indexPath.row]
        cell.descriptionLabel.text = itemText[indexPath.row]
        return cell
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: (view.frame.height * 0.35))
    }
    
    
    
}
