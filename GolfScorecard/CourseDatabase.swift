//
//  CourseDatabase.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-17.
//

import Foundation


public class CourseDatabase {
    
    private var listOfCourses: [String: CourseInfo]
    
    init(){
        self.listOfCourses = [String: CourseInfo]()
    }
    
    /**
     Finds if a course of that name exists.
     */
    public func isCourse(name: String) -> Bool {
        if listOfCourses[name] != nil {
            return true
        }
        
        return false
    }
    
    
    /**
     Adds a course of that name. if the course already exists it overrides it.
     */
    public func addCourse(name: String, courseData: CourseInfo) {
        listOfCourses[name] = courseData
    }
    
    /**
     Gets a course of the name given. If no course exists then it will throw a coursenotfound exception
     */
    public func getCourse(name: String) throws -> CourseInfo {
        if let course = listOfCourses[name] {
            return course
        }
        throw RetreivalError.CourseNotFound
    }
    
    
}

