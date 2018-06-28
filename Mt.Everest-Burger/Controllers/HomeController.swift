//
//  ViewController.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/20/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let iconArray = IconDetails()
   
    let burgerImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "burgerHomeImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
        
    }()
    
    let  menuLauncher = MenuLauncher()
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        menuLauncher.delegate = self
        view.backgroundColor = .white
        collectionView.register(HomeScreenCell.self, forCellWithReuseIdentifier: "CellId")
        setUpNavigationBar()
        setupLayout()
        setCollectionView()
    }
    
    func setUpNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = .orange
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "left-arrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "left-arrow")
        self.navigationItem.backBarButtonItem?.tintColor = .white
        setNavBarItems()
    }
    
    func setNavBarItems() {
        
        let menuButton = UIButton(type: .system)
        menuButton.setImage(#imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), for: .normal )
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        menuButton.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        
        
        searchBar.placeholder = "Search..."
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
    }
    
    func setupLayout() {
        view.addSubview(burgerImageView)
        burgerImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        burgerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        burgerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        burgerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: burgerImageView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func showMenu() {
        menuLauncher.launchMenu()
    }
    
   
    
}
extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return iconArray.iconName.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! HomeScreenCell
        cell.iconImageView.image = UIImage(named: iconArray.iconName[indexPath.row])
        cell.iconLabel.text = iconArray.iconName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 155, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      showSelectedController(index: indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.2, delay: 0.2, options: UIViewAnimationOptions.allowUserInteraction, animations: {cell?.contentView.backgroundColor = .orange}, completion: nil)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.2, delay: 0.2, options: UIViewAnimationOptions.allowUserInteraction, animations: {cell?.contentView.backgroundColor = nil}, completion: nil)
    }
}

extension HomeController : MenuDelegate{
    
    func menuDidSelectItem (index: Int) {
        if index == 0 {
            menuLauncher.dismissMenu()
        }
        else {
            showSelectedController(index: (index - 1))
        }
        
    }
    
    func showSelectedController (index : Int) {
        
        let aboutUSController = AboutUsController()
        let contactUsController = ContactUsController()
         let itemController = ItemController()
      
        
        let itemDetails = ItemDetails()
        switch index {
        case 0:
             self.navigationController?.pushViewController(aboutUSController, animated: true)
        case 1:
            itemController.itemText = itemDetails.coffeeText
            itemController.itemTitle = itemDetails.coffeeTitle
            self.navigationController?.pushViewController(itemController, animated: true)
        case 2:
            itemController.itemText = itemDetails.burgerText
            itemController.itemTitle = itemDetails.burgerTitle
            self.navigationController?.pushViewController(itemController, animated: true)
        case 3:
            itemController.itemText = itemDetails.sizzlerText
            itemController.itemTitle = itemDetails.sizzlerTitle
            self.navigationController?.pushViewController(itemController, animated: true)
        case 4:
            itemController.itemText = itemDetails.breakfastText
            itemController.itemTitle = itemDetails.breakfastTitle
            self.navigationController?.pushViewController(itemController, animated: true)
            
        case 5:
            itemController.itemText = itemDetails.steakText
            itemController.itemTitle = itemDetails.steakTitle
            self.navigationController?.pushViewController(itemController, animated: true)
        case 6:
            itemController.itemText = itemDetails.specialText
            itemController.itemTitle = itemDetails.specialTitle
            self.navigationController?.pushViewController(itemController, animated: true)
            
        case 7:
             self.navigationController?.pushViewController(contactUsController, animated: true)
            
        default:
           print("Error")
        }
    }
    
}
extension HomeController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let itemController = ItemController()
        let itemArray : [Items] = Items.generateItemsArray()
        var searchedItemArray : [Items] = Items.generateItemsArray()
        searchedItemArray = itemArray.filter({ (item) -> Bool in
            return item.name.lowercased().contains(searchBar.text!.lowercased())
        })
        for item in searchedItemArray {
            itemController.itemTitle.append(item.name)
            itemController.itemText.append(item.text)
        }
       
        navigationController?.pushViewController(itemController, animated: true)
        searchBar.endEditing(true)
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
    }
    
}
}




