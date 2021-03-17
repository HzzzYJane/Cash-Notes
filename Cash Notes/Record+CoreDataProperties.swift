//
//  Record+CoreDataProperties.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/10/21.
//
//

import Foundation
import CoreData


extension Record {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "Record")
    }

    @NSManaged public var price: Double
    @NSManaged public var title: String
    @NSManaged public var type: String
    @NSManaged public var id: UUID?
    @NSManaged public var date: Date
    @NSManaged public var day: String
    @NSManaged public var month: String
    @NSManaged public var year: String


}

enum type {
    case earned, spent
}

func getType(recordType: type) -> String {
    if recordType == type.earned {
        return "Earned"
    } else {
        return "Spent"
    }
}
extension Record : Identifiable {

}
