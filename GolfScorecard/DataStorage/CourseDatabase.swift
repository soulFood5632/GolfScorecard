//
//  CourseDatabase.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-17.
//

import Foundation


public class CourseDatabase {
    
    private var listOfCourses: [String: Course]
    
    private var courseSet: Set<String>
    
    init(){
        self.listOfCourses = [String: Course]()
        self.courseSet = Set<String>()
    }
    
    /**
     Finds if a course of that name exists.
     */
    public func isCourse(name: String) -> Bool {
        if courseSet.contains(name) {
            return true
        }

        return false
    }
    
    
    /**
     Adds a course of that name. if the course already exists it overrides it.
     */
    public func addCourse(name: String, courseData: Course) {
        listOfCourses[name] = courseData
        courseSet.insert(name)
    }
    
    /**
     Gets a course of the name given. If no course exists then it will throw a coursenotfound exception
     */
    public func getCourse(name: String) throws -> Course {
        if let course = listOfCourses[name] {
            return course
        }
        throw RetreivalError.CourseNotFound
    }
    
    /**
     Gets a set of all courses in the database
     */
    
    public func getCourseList() -> Set<String> {
        return courseSet
    }
    
    
}

