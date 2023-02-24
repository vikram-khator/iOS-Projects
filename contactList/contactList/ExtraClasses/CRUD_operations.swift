//
//  deleteContact.swift
//  contactList
//
//  Created by ChicMic on 22/02/23.
//

import Foundation

class CRUD: ViewController{
    var objContactCrud = contactArray.contactArrayInstance

//    func deleteContact(_ name : String){
//
//        if let index = objContactCrud.newcontact.firstIndex(where: {$0.0 == name}) {
//            objContactCrud.newcontact.remove(at: index)
//        }
//    }
    
    func deleteContact(indexPath: IndexPath) {
        let contact = objcontact.newcontactDict[
            objcontact.newsectionTitle[indexPath.section]
                    ]?.remove(at: indexPath.row)
        
        //removing elements from the static data
        //so no element is regenerated when a new value
        //is added
        
        //TODO: add unique id to identify contacts
        // because phone numbers or names can be duplicate
        for i in 0..<objcontact.newcontact.count {
                    if (contact?.1 == objcontact.newcontact[i].1) {
                        objcontact.newcontact.remove(at: i)
                        break
                    }
                }
    }
}

