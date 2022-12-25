//
//  RetreivalError.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-23.
//

import Foundation
/**
 Error for incorrect calls
 */
public enum RetreivalError: Error{
    case CourseNotFound
    case NoTeeExists
    case NoHoleExists
}
