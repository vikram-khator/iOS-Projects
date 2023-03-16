//
//  ViewController.swift
//  contactApplication
//
//  Created by ChicMic on 13/03/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
     
    @IBOutlet weak var contactTable: UITableView!
//    var staticData = StaticContacts()
    var sectionTitle : [String] = []   //for sorted and unique entries
    var section = [String]()          //for unsorted and duplicate entries
    var filteredData = [Contact]()   //for searched contact results
    var contactArray = [Contact]()  //for all contacts
    var contactDict = [String:[Contact]]()
    
    var name : [String] = []
    
    func fetchRecord(){
        do {
            let result = try PersistentStorage.shared.context.fetch(Contacts.fetchRequest())
            result.forEach({
                let instance = Contact(uid: $0.uid ?? UUID(), firstName: $0.fname!, secondName: $0.lname!, mobile: [$0.phoneNumber ?? ""])
                contactArray.append(instance)
            })
        }catch{
            print("Error")
        }
    }

    
    
    func makeDict(in contact: [Contact]){
        for i in contact{
            if i.getFullName() != ""{
                section.append(String(i.getFullName().prefix(1).uppercased()))
            }
        }
        
        sectionTitle = Array(Set(section))
        sectionTitle.sort()
        sectionTitle.append("#")
        
        //creating empty array for each section
        for stitle in sectionTitle{
            contactDict[stitle] = [Contact]()
        }
        
        for cont in contact{
            if cont.getFullName() != ""{
                contactDict[String(cont.getFullName().prefix(1).uppercased())]?.append(cont)
            }
            else{
                contactDict["#"]?.append(cont)
            }
            
        }
        
        //sorting each key's corresponding array 
        for (key, _) in contactDict {
            contactDict[key] = contactDict[key]?.sorted(by: {
                $0.getFullName().uppercased() < $1.getFullName().uppercased()
            })
        }
        
    }
    
    var context = PersistentStorage.shared.context
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
//        staticData.makeArray()
//        contactArray = staticData.contactsArray
        self.navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
        contactTable.delegate = self
        contactTable.dataSource = self
    }
    @objc func addContact(){
        performSegue(withIdentifier: "addContactSegue", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchRecord()
        makeDict(in: contactArray)
        contactTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactDetail"{
            let destVC = segue.destination as! ContactDetailVC
            destVC.data = sender as? Contact
            destVC.instanceView = self  //sending self for access fetchrecord()
        }
        
        else if segue.identifier == "addContactSegue" {
            let destVC = segue.destination as! AddContactVC
            destVC.viewController = self
        }
    }

    func addContactToFilteredDataArray(contact: Contact) {
        contactArray.append(contact)
        makeDict(in: contactArray)
    }
    
}



//MARK: - Extensions

extension ViewController : UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactDict[sectionTitle[section]]?.count ?? 0
//        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactTable.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
//        cell.textLabel?.text = name[indexPath.row]
        cell.textLabel?.text = contactDict[sectionTitle[indexPath.section]]?[indexPath.row].getFullName()
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitle
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.trimmingCharacters(in: .whitespaces) != ""{
            filteredData = contactArray.filter{$0.getFullName().uppercased().contains(searchText.uppercased())}
            makeDict(in: filteredData)
            contactTable.reloadData()
        }
        else{
            filteredData = contactArray
            makeDict(in: filteredData)
            contactTable.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = contactDict[sectionTitle[indexPath.section]]?[indexPath.row]
        
        self.performSegue(withIdentifier: "contactDetail", sender: data)
       
    }
    
}


