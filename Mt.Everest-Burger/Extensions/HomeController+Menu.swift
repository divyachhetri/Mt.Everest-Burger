//
//  HomeController+Menu.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/27/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import Foundation
extension HomeController: MenuDelegate {
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
        var text = ""
        switch index {
        case 0:
            self.navigationController?.pushViewController(aboutUSController, animated: true)
        case 1:
            text = "Coffee"
            filterItems(name: text)
        case 2:
           text = "Burger"
            filterItems(name: text)
        case 3:
            text = "Sizzler"
            filterItems(name: text)
        case 4:
            itemController.itemText = ItemDetails.breakfastText
            itemController.itemTitle = ItemDetails.breakfastTitle
            navigationController?.pushViewController(itemController, animated: true)
        case 5:
            text = "Steak"
            filterItems(name: text)
        case 6:
            text = "Everest"
            filterItems(name: text)
            
        case 7:
            self.navigationController?.pushViewController(contactUsController, animated: true)
            
        default:
            print("Error")
        }
    }
    
}
