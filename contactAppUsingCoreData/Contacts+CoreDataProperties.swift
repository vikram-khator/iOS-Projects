//
//  Contacts+CoreDataProperties.swift
//  contactAppUsingCoreData
//
//  Created by ChicMic on 16/03/23.
//
//

import Foundation
import CoreData


extension Contacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contacts> {
        return NSFetchRequest<Contacts>(entityName: "Contacts")
    }

    @NSManaged public var company: String?
    @NSManaged public var fname: String?
    @NSManaged public var lname: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var uid: UUID?

}

extension Contacts : Identifiable {

}
