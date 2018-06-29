//
//  File.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/28/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import Foundation
extension ItemController : MenuDelegate {
    func menuDidSelectItem(index: Int) {
        let aboutUSController = AboutUsController()
        let contactUsController = ContactUsController()
        let homeController = HomeController()
        var text = ""
        switch index {
        case 0:
            self.navigationController?.pushViewController(homeController, animated: true)
        case 1:
            self.navigationController?.pushViewController(aboutUSController, animated: true)
        case 2:
            text = "Coffee"
            filterItems(name: text)
        case 3:
            text = "Burger"
            filterItems(name: text)
        case 4:
            text = "Sizzler"
            filterItems(name: text)
            
        case 5:
            itemText = ItemDetails.breakfastText
            itemTitle = ItemDetails.breakfastTitle
            collectionView.reloadData()
            
        case 6:
            text = "Steak"
            filterItems(name: text)
            
        case 7:
            text = "Everest"
            filterItems(name: text)
        case 8:
            self.navigationController?.pushViewController(contactUsController, animated: true)
            
        default:
            menuLauncher.dismissMenu()
        }
    }
}
