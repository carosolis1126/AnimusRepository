//
//  Journal.swift
//  Peace
//
//  Created by Carolina Solis on 07/19/21.
//

import CoreData

@objc(Journal)
class Note: NSManagedObject
{
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var desc: String!
    @NSManaged var deletedDate: Date?
    
}
