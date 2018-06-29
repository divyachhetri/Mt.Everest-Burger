//
//  ContactUsController.swift
//  Mt.Everest-Burger
//
//  Created by Divya Pandit Chhetri on 6/20/18.
//  Copyright © 2018 Divya Pandit Chhetri. All rights reserved.
//

import UIKit
import MessageUI

class ContactUsController: UITableViewController{
    
    let sectionHeaders = ["About Us", "About Developer"]
    let icons = IconDetails()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        tableView.register(ContactUsCell.self, forCellReuseIdentifier: "CellId")
        
    }
    
    func setUpNavBar() {
        self.navigationItem.title = "CONTACT US"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .white
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let aboutUsController = AboutUsController()
            navigationController?.pushViewController(aboutUsController, animated: true)
        }
        
        if indexPath.section == 0 && indexPath.row == 1 {
            setMapController(title: "LOCATE US", lattitude: 27.689056, longituge: 86.729833, anoTitle: "Mt.Everest Burger")
        }
        if indexPath.section == 0 && indexPath.row == 2 {
            setCallOption(number: "TEL://+9779851096380")
        }
        if indexPath.section == 0 && indexPath.row == 3 {
            setCallOption(number: "TEL://+977038550050")
        }
        
        if indexPath.section == 0 && indexPath.row == 4{
            sendMail(email: "angfura@gmail.com")
        }
        if indexPath.section == 1 && indexPath.row == 0 {
             setMapController(title: "BSAI TECHNO SALES", lattitude: 27.687672, longituge: 85.340596, anoTitle: "BSAI TECHNO SALES")
            
        }
        if indexPath.section == 1 && indexPath.row == 1 {
            let webController = WebsiteController()
            navigationController?.pushViewController(webController, animated: true)
        }
        if indexPath.section == 1 && indexPath.row == 2{
            sendMail(email: "info@bsaitechnosales.com")
        }
    }
}

extension ContactUsController : MFMailComposeViewControllerDelegate {
    
    func setMapController(title : String, lattitude : Double, longituge : Double, anoTitle : String) {
        let mapController = MapController()
        mapController.navTitle = title
        mapController.lattitude = lattitude
        mapController.longitude = longituge
        mapController.anoTitle = anoTitle
        navigationController?.pushViewController(mapController, animated: true)
        
    }
    func sendMail(email: String) {
        let composeMail = MFMailComposeViewController()
        composeMail.mailComposeDelegate = self
        composeMail.setToRecipients([email])
        if MFMailComposeViewController.canSendMail() {
            self.present(composeMail, animated: true, completion: nil)
        }

    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func setCallOption(number : String) {
        let url : NSURL = URL(string: number)! as NSURL
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url as URL)
        }
        
    }


}
