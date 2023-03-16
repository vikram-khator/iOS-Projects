//
//  labelVC.swift
//  contactAppUsingCoreData
//
//  Created by ChicMic on 15/03/23.
//

import UIKit


class labelVC: UIViewController {

    
    var labels : [String] = ["Mobile","Home","Work","School","iPhone","Apple Watch","main","home fax","work fax","pager","other"]
    
    @IBOutlet weak var lableTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var addcontactvc: AddContactVC?

}

extension labelVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lableCell", for: indexPath)
        cell.textLabel?.text = labels[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let value = labels[indexPath.row]
        addcontactvc?.setButtonLabel(title: value)
        dismiss(animated: true)
    }
    
}
