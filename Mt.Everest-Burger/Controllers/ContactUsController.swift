//
//  ContactUsController.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/20/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit

class ContactUsController: UITableViewController {
    
    let sectionHeaders = ["About Us", "About Developer"]
    let icons = IconDetails()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "CONTACT US"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        tableView.register(ContactUsCell.self, forCellReuseIdentifier: "CellId")
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
   override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }

 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return icons.contactsText[section].count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! ContactUsCell
        cell.textLabel?.text = icons.contactsText[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont(name: "Futura", size: 18)
        cell.detailTextLabel?.text = icons.contactsDetailText[indexPath.section][indexPath.row]
        cell.detailTextLabel?.textColor = .gray
        cell.iconImageView.image = UIImage(named: icons.contactsIconImage[indexPath.section][indexPath.row])
        return cell
    }


}
