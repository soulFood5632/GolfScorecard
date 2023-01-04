//
//  TeeData+CoreDataProperties.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2023-01-03.
//
//

import Foundation
import CoreData


extension TeeData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TeeData> {
        return NSFetchRequest<TeeData>(entityName: "TeeData")
    }

    @NSManaged public var slope: Int64
    @NSManaged public var rating: Float
    @NSManaged public var holeData: [HoleInfo]?

}

extension TeeData : Identifiable {

}
