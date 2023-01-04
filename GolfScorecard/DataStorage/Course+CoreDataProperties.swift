//
//  Course+CoreDataProperties.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2023-01-03.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var teeInfo: [String: TeeData]?
    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var state_province: String?
    @NSManaged public var country: String?
    @NSManaged public var courseID: UUID?

}

extension Course : Identifiable {

}
