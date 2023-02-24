import UIKit

class ViewController: UIViewController {

    
//MARK: - Outlet
    @IBOutlet weak var contactTable: UITableView!

    
//MARK: - OBJECTS
    var objcontact = contactArray.contactArrayInstance
    
    
    
    
    
    
    
//MARK: - function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let ac = UIAlertController(title: "DELETE", message: "You sure you want to delete", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                   (action : UIAlertAction!) -> Void in })
            
            let doneAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: {
                       (action : UIAlertAction!) -> Void in
                
                var objCrud = CRUD()
//                let country = self.newcontactDict[self.newsectionTitle[indexPath.section]]?[indexPath.row]
//                objCrud.deleteContact(country?.0 ?? "")
                objCrud.deleteContact(indexPath: indexPath)
                
                tableView.deleteRows(at: [indexPath], with: .none)
                
                tableView.reloadData()
                
               
                
            })
            
            ac.addAction(doneAction)
            ac.addAction(cancelAction)
            present(ac, animated: true)

        } 
    }
    
    
    
    @objc func addTapped(){

        let alertController = UIAlertController(title: "Add Contact", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
               textField.placeholder = "Enter Name"
           }
       
           alertController.addTextField { (textField : UITextField!) -> Void in
               textField.placeholder = "Enter Phone Number"
           }
           
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0].text
            let secondTextField = alertController.textFields![1].text
            let tempTuple = (firstTextField!,secondTextField!)
            self.objcontact.newcontact.append(tempTuple)
            self.loadData()
            let ac = UIAlertController(title: "Success", message: "Contact added successfully", preferredStyle: .alert)
            let doneAction = UIAlertAction(title: "Okay", style: .cancel)
            ac.addAction(doneAction)
            self.present(ac, animated: true)
           })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
               (action : UIAlertAction!) -> Void in })
        
           alertController.addAction(saveAction)
           alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
override func viewDidLoad() {
        super.viewDidLoad()
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
      loadData()
}
    
    
   
//MARK: - prepare function for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ContactDetailVC
        destVC.data = sender as? (String,String)    //send data in tuple form

    }
    

}





