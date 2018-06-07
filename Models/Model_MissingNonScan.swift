//
//  Model_MissingNonScan.swift
//  Employee
//
//  Created by Thanh Tuan on 4/17/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model_MissingNonScan: NSObject {
    
    var employeeId: String = ""
    var missingNonscan: String = ""
    var timeIn: String = ""
    var timeOut: String = ""
    var workDate: String = ""
    var date : String = ""
    var reason : String = ""
    var statusName : String = ""
    
    class func loadMissingNonScan(_ infoData:JSON?) -> Model_MissingNonScan? {
        let object_MissingNonScan : Model_MissingNonScan = Model_MissingNonScan()
        guard let infoData = infoData else {
            return object_MissingNonScan
        }
        
        if let employeeId = infoData["employeeId"].string {
            object_MissingNonScan.employeeId = employeeId
        }
        
        if let date = infoData["date"].string {
            object_MissingNonScan.date = date
        }
        
        if let reason = infoData["reason"].string {
            object_MissingNonScan.reason = reason
        }
        
        if let missingNonscan = infoData["missingNonscan"].string {
            object_MissingNonScan.missingNonscan = missingNonscan
        }
        
        if let timeIn = infoData["timeIn"].string {
            object_MissingNonScan.timeIn = timeIn
        }
        
        if let timeOut = infoData["timeOut"].string {
            object_MissingNonScan.timeOut = timeOut
        }
        
        if let workDate = infoData["workDate"].string {
            object_MissingNonScan.workDate = workDate
        }
        
        if let statusName = infoData["statusName"].string {
            object_MissingNonScan.statusName = statusName
        }
        
        return object_MissingNonScan
    }
}
