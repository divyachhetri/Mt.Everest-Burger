//
//  ItemController.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/21/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class ItemController: UIViewController{
    
    let homeView = HomeController()
    let menuLauncher = MenuLauncher()
    
    var itemTitle = [String]()
    var itemText = [String]()
    
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
        view.backgroundColor = .white
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: "CellId")
        setNavBarItems()
        setCollectionView()
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
        searchBar.delegate = self
        
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
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension ItemController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = itemTitle.isEmpty ? 1 : itemTitle.count
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! ItemCell
        if itemTitle.isEmpty {
            cell.descriptionLabel.text = "No Such Item in Database!"
            cell.descriptionLabel.textAlignment = .center
            cell.itemImageView.isHidden = true
            cell.titleLabel.isHidden = true
        }
        else{
            cell.itemImageView.isHidden = false
            cell.titleLabel.isHidden = false
            cell.itemImageView.image = UIImage(named: itemTitle[indexPath.row])
            cell.titleLabel.text = itemTitle[indexPath.row]
            cell.descriptionLabel.text = itemText[indexPath.row]
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: (view.frame.height * 0.35))
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if itemTitle.isEmpty == false{
            let detailsController = DetailsController()
            detailsController.itemText = itemText[indexPath.row]
            detailsController.itemTitle = itemTitle[indexPath.row]
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
        
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
extension ItemController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterItems(name: searchBar.text!)
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
        
    }
    
    func filterItems(name:String){
        itemTitle = []
        itemText = []
        let itemArray : [Items] = Items.generateItemsArray()
        var searchedItemArray : [Items] = Items.generateItemsArray()
        searchedItemArray = itemArray.filter({ (item) -> Bool in
            return item.name.lowercased().contains(name.lowercased())
        })
        for item in searchedItemArray {
            itemTitle.append(item.name)
            itemText.append(item.text)
        }
        
        collectionView.reloadData()
    }
    
    
}
