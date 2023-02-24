
import UIKit

//MARK: - Extensions

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objcontact.newcontactDict[objcontact.newsectionTitle[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = objcontact.newcontactDict[objcontact.newsectionTitle[indexPath.section]]?[indexPath.row].0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = objcontact.newcontactDict[objcontact.newsectionTitle[indexPath.section]]?[indexPath.row]
        performSegue(withIdentifier: "contactDetail", sender: country)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objcontact.newsectionTitle.count
    }
    
    //right side index title
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        tableView.sectionIndexColor = .systemBrown
        return objcontact.newsectionTitle
    }
    
    //show header for each section A,B,C
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objcontact.newsectionTitle[section]
    }
    
    func loadData(){
        objcontact.newsectionTitle = Array(Set(objcontact.newcontact.compactMap({(String($0.0.prefix(1)))})))
        objcontact.newsectionTitle.sort()
            
        for stitle in objcontact.newsectionTitle {
                //Creating blank array for each character
            objcontact.newcontactDict[stitle] = [(String,String)]()
            }
                
            
            for name in objcontact.newcontact{
                objcontact.newcontactDict[String(name.0.prefix(1))]?.append(name)
            }
        contactTable.reloadData()
        }
}
