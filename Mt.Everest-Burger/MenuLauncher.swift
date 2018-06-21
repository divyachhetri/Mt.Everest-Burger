//
//  MenuLauncher.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/20/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit
class MenuLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let blackView = UIView()
    let menuView = UIView()
    let icons = HomeScreenIcons()
    
    let burgerImageView : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Menu Burger"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
        
    }()
    
    func launchMenu() {
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.8)
            menuView.backgroundColor = .white
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissMenu)))
            window.addSubview(blackView)
            window.addSubview(menuView)
            menuView.addSubview(burgerImageView)
            window.addSubview(collectionView)
            
            menuView.frame = CGRect(x: 0, y: 0, width: 0, height: window.frame.height)
            burgerImageView.frame = CGRect(x: 0, y: 0, width: 0, height: (window.frame.height*0.3))
            collectionView.frame = CGRect(x: 0, y: (window.frame.height*0.3), width: 0, height: (window.frame.height*0.7))
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5) {
                self.blackView.alpha = 1
                self.menuView.frame = CGRect(x: 0, y: 0, width: 250, height: window.frame.height)
                self.burgerImageView.frame = CGRect(x: 0, y: 0, width: 250, height: (window.frame.height*0.3))
                self.collectionView.frame = CGRect(x: 0, y: (window.frame.height*0.31), width: 250, height: (window.frame.height*0.7))
            }
        }
    }
    
    @objc func dismissMenu() {
        UIView.animate(withDuration: 0.0) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.menuView.frame = CGRect(x: 0, y: 0, width: 0, height: window.frame.height)
                self.burgerImageView.frame = CGRect(x: 0, y: 0, width: 0, height: window.frame.height * 0.4)
                self.collectionView.frame = CGRect(x: 0, y: (window.frame.height*0.31), width: 0, height: (window.frame.height*0.7))
                
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.menuIconName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! MenuCell
        cell.iconImageView.image = UIImage(named: icons.menuIconImage[indexPath.row])
        cell.iconLabel.text = icons.menuIconName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.2, delay: 0.2, options: UIViewAnimationOptions.allowUserInteraction, animations: {cell?.contentView.backgroundColor = .green}, completion: nil)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.2, delay: 0.2, options: UIViewAnimationOptions.allowUserInteraction, animations: {cell?.contentView.backgroundColor = nil}, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
    
    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "CellId")
    }
    
    
}
