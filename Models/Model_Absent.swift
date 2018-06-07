//
//  Model_Absent.swift
//  Employee
//
//  Created by Thanh Tuan on 4/10/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model_Absent: NSObject {
    var id: String = ""
    var employeeId: String = ""
    var employeeType: String = ""
    var employeeName: String = ""
    var avatar: String = ""
    var date: String = ""
    var reason: String = ""
    var contents: String = ""
    var fromTime: String = ""
    var fromDate: String = ""
    var toTime: String = ""
    var toDate: String = ""
    var totalAbsentDays: String = ""
    var decision: String = ""
    var status: String = ""
    var note: String = ""
    var isRequest: String = ""
    var requestBy: String = ""
    
    class func loadAbsent(_ infoData:JSON?) -> Model_Absent? {
        let object_Absent : Model_Absent = Model_Absent()
        guard let infoData = infoData else {
            return object_Absent
        }
        if let id = infoData["id"].string {
            object_Absent.id = id
        }
        
        if let employeeType = infoData["employeeType"].string {
            object_Absent.employeeType = employeeType
        }
        
        if let employeeId = infoData["employeeId"].string {
            object_Absent.employeeId = employeeId
        }
        
        if let employeeName = infoData["employeeName"].string {
            object_Absent.employeeName = employeeName
        }
        
        if let avatar = infoData["avatar"].string {
            object_Absent.avatar = avatar
        }
        
        if let date = infoData["date"].string {
            object_Absent.date = date
        }
        
        if let reason = infoData["reason"].string {
            object_Absent.reason = reason
        }
        
        if let contents = infoData["contents"].string {
            object_Absent.contents = contents
        }
        
        if let fromTime = infoData["fromTime"].string {
            object_Absent.fromTime = fromTime
        }
        
        if let fromDate = infoData["fromDate"].string {
            object_Absent.fromDate = fromDate
        }
        
        if let toTime = infoData["toTime"].string {
            object_Absent.toTime = toTime
        }
        
        if let toDate = infoData["toDate"].string {
            object_Absent.toDate = toDate
        }
        
        if let totalAbsentDays = infoData["totalAbsentDays"].string {
            object_Absent.totalAbsentDays = totalAbsentDays
        }
        
        if let decision = infoData["decision"].string {
            object_Absent.decision = decision
        }
        
        if let status = infoData["status"].string {
            object_Absent.status = status
        }
        
        if let note = infoData["note"].string {
            object_Absent.note = note
        }
        
        if let isRequest = infoData["isRequest"].string {
            object_Absent.isRequest = isRequest
        }
        
        if let requestBy = infoData["requestBy"].string {
            object_Absent.requestBy = requestBy
        }
        
        return object_Absent
    }
}
