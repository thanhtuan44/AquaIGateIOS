//
//  Model_Annualleave.swift
//  Employee
//
//  Created by Thanh Tuan on 4/17/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model_Annualleave: NSObject {
    var employeeId: String = ""
    var fullName: String = ""
    var company: String = ""
    var location: String = ""
    var department: String = ""
    var section: String = ""
    var currentYear: String = ""
    var joinDate: String = ""
    var totalEntitlement: String = ""
    var additionalEarn: String = ""
    var lastYear: String = ""
    var earnedLeave: String = ""
    var leaveTaken: String = ""
    var totalSickLeave: String = ""
    var balance: String = ""
    
    
    class func loadAnnualleave(_ infoData:JSON?) -> Model_Annualleave? {
        let object_Annualleave : Model_Annualleave = Model_Annualleave()
        guard let infoData = infoData else {
            return object_Annualleave
        }
        
        if let employeeId = infoData["employeeId"].string {
            object_Annualleave.employeeId = employeeId
        }
        
        if let fullName = infoData["fullName"].string {
            object_Annualleave.fullName = fullName
        }
        
        if let company = infoData["company"].string {
            object_Annualleave.company = company
        }
        
        if let location = infoData["location"].string {
            object_Annualleave.location = location
        }
        
        if let department = infoData["department"].string {
            object_Annualleave.department = department
        }
        
        if let section = infoData["section"].string {
            object_Annualleave.section = section
        }
        
        if let currentYear = infoData["currentYear"].string {
            object_Annualleave.currentYear = currentYear
        }
        
        if let joinDate = infoData["joinDate"].string {
            object_Annualleave.joinDate = joinDate
        }
        
        if let totalEntitlement = infoData["totalEntitlement"].string {
            object_Annualleave.totalEntitlement = totalEntitlement
        }
        
        if let additionalEarn = infoData["additionalEarn"].string {
            object_Annualleave.additionalEarn = additionalEarn
        }
        
        if let lastYear = infoData["lastYear"].string {
            object_Annualleave.lastYear = lastYear
        }
        
        if let earnedLeave = infoData["earnedLeave"].string {
            object_Annualleave.earnedLeave = earnedLeave
        }
        
        if let leaveTaken = infoData["leaveTaken"].string {
            object_Annualleave.leaveTaken = leaveTaken
        }
        
        if let totalSickLeave = infoData["totalSickLeave"].string {
            object_Annualleave.totalSickLeave = totalSickLeave
        }
        
        if let balance = infoData["balance"].string {
            object_Annualleave.balance = balance
        }
        
        return object_Annualleave
    }
}
