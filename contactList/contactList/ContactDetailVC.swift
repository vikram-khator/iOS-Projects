//
//  ContactDetailVC.swift
//  contactList
//
//  Created by ChicMic on 21/02/23.
//

import UIKit


 
class ContactDetailVC: UIViewController {
    var data:(String,String)?
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBAction func openMessageApp(_ sender: UIButton) {
        let sms = "sms:\(String(describing: phoneNumber.text))&body=Hello, How are You"
        let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactName.text = data?.0 ?? "unknown"
        phoneNumber.text = data?.1 ?? "xxxxxxxxxxx"

    }
    
}
