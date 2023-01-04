//
//  HoleInfo+CoreDataProperties.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2023-01-03.
//
//

import Foundation
import CoreData


extension HoleInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HoleInfo> {
        return NSFetchRequest<HoleInfo>(entityName: "HoleInfo")
    }

    @NSManaged public var par: Int64
    @NSManaged public var yardage: Int64

}

extension HoleInfo : Identifiable {

}
