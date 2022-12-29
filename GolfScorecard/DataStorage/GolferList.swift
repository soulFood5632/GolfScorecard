//
//  GolferList.swift
//  GolfScorecard
//
//  Created by Logan Underwood on 2022-12-24.
//

import Foundation

class GolferList {
    /**
     Golfer list from their username to password and golfer
     */
    private var passwordList:[String: (String, Golfer)]

    
    private var golfers: Set<String>
    
    init(){
        passwordList = [String: (String, Golfer)]()
        golfers = Set<String>()
    }
    
    
    /**
     Adds a golfer to the list with a password
     */
    public func addGolfer(userID: String, password: String) -> Bool{
        if golfers.contains(userID) {
            return false
        }
        
        golfers.insert(userID)
        passwordList[userID] = (password, Golfer())
        return true
    }
    
    /**
     Gets a golfer if the given password is correct. Throws a noGolferExists error if no user of
     that ID exists. Throws incorrect password error if the password is incorrect.
     */
    public func getGolfer(userID: String, password: String) throws -> Golfer {
        do {
            if try checkPassword(userID: userID, passwordEntry: password) {
                return passwordList[userID]!.1
            }
            throw RetreivalError.IncorrectPassword
        } catch RetreivalError.NoGolferExists {
            throw RetreivalError.NoGolferExists
        }
        
        
    }
    
    
    public func addRound(userID: String, password: String, roundToAdd: Round) throws {
        do {
            if try checkPassword(userID: userID, passwordEntry: password) {
                passwordList[userID]!.1.addRound(roundToAdd: roundToAdd)
            } else {
                throw RetreivalError.IncorrectPassword
            }
        } catch RetreivalError.NoGolferExists {
            throw RetreivalError.NoGolferExists
        }
    }
    
    
    /**
     Checks the password of the userID provided. returns false password is incorrect, throws
     noGolferFound error if no golfer of that name exists.
     */
    private func checkPassword(userID: String, passwordEntry: String) throws -> Bool {
        if golfers.contains(userID) {
            if let userPassword = passwordList[userID]?.0 {
                return userPassword == passwordEntry
            }
            return false
        }
        throw RetreivalError.NoGolferExists
        
    }
    
    /**
     Removes a golfer from the database. If the user does not exist throws NoGolferExists error
     and if the passowrd is incorrect it throws Incorrect password error.
     */
    public func removeGolfer(userID: String, password: String) throws {
        do {
            if try checkPassword(userID: userID, passwordEntry: password) {
                golfers.remove(userID)
                passwordList.removeValue(forKey: userID)
                
            }
            throw RetreivalError.IncorrectPassword
        } catch RetreivalError.NoGolferExists {
            throw RetreivalError.NoGolferExists
        }
        
    }
    
    /**
     Changes the name of a golfer in the database. If the user does not exist throws NoGolferExists error
     and if the passowrd is incorrect it throws Incorrect password error.
     */
    public func changeUserID(currentUserID: String, newUserID: String, password: String) throws {
        do {
            if try checkPassword(userID: currentUserID, passwordEntry: password) {
                passwordList[newUserID] = passwordList[currentUserID]
                golfers.remove(currentUserID)
                passwordList.removeValue(forKey: currentUserID)
                golfers.insert(newUserID)
                
            } else {
                throw RetreivalError.IncorrectPassword
            }
        } catch RetreivalError.NoGolferExists {
            throw RetreivalError.NoGolferExists
        }
        
    }
    
    /**
     Changes the password of a golfer in the database. If the user does not exist throws NoGolferExists error
     and if the passowrd is incorrect it throws Incorrect password error.
     */
    public func changePassword(userID: String, currentPassword: String, newPassword: String) throws {
        do {
            if try checkPassword(userID: userID, passwordEntry: currentPassword) {
                passwordList[userID]!.0 = newPassword
            } else {
                throw RetreivalError.IncorrectPassword
            }
        } catch RetreivalError.NoGolferExists {
            throw RetreivalError.NoGolferExists
        }
        
    }
    
    
}

extension GolferList {
    
    struct GolferInfo {
        var userID: String = ""
        var password: String = ""
    
    }
    
    var golferData: GolferInfo {
        GolferInfo()
    }
}
