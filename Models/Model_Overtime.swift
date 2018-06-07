//
//  Model_Overtime.swift
//  Employee
//
//  Created by Thanh Tuan on 4/12/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model_Overtime: NSObject {
    var employeeId: String = ""
    var frmTime: String = ""
    var fullName: String = ""
    var id: String = ""
    var overtimeDate: String = ""
    var overtimeType: String = ""
    var position: String = ""
    var purpose: String = ""
    var requestBy: String = ""
    var status: String = ""
    var toTime: String = ""
    
    class func loadOverTime(_ infoData:JSON?) -> Model_Overtime? {
        let object_Overtime : Model_Overtime = Model_Overtime()
        guard let infoData = infoData else {
            return object_Overtime
        }
        if let id = infoData["id"].string {
            object_Overtime.id = id
        }
        
        if let employeeId = infoData["employeeId"].string {
            object_Overtime.employeeId = employeeId
        }
        
        if let frmTime = infoData["frmTime"].string {
            object_Overtime.frmTime = frmTime
        }
        
        if let fullName = infoData["fullName"].string {
            object_Overtime.fullName = fullName
        }
        
        if let overtimeDate = infoData["overtimeDate"].string {
            object_Overtime.overtimeDate = overtimeDate
        }
        
        if let overtimeType = infoData["overtimeType"].string {
            object_Overtime.overtimeType = overtimeType
        }
        
        if let position = infoData["position"].string {
            object_Overtime.position = position
        }
        
        if let purpose = infoData["purpose"].string {
            object_Overtime.purpose = purpose
        }
        
        if let requestBy = infoData["requestBy"].string {
            object_Overtime.requestBy = requestBy
        }
        
        if let status = infoData["status"].string {
            object_Overtime.status = status
        }
        
        if let toTime = infoData["toTime"].string {
            object_Overtime.toTime = toTime
        }
        
        return object_Overtime
    }
}
class Model_ConfirmOvertime: NSObject {
    
    var model_OvertimeEmployee : Model_OvertimeEmployee? = Model_OvertimeEmployee()
    var array_OvertimeInfo : NSMutableArray? = []
    
    class func loadOverTime(_ infoData:JSON?) -> Model_ConfirmOvertime? {
        let object_Overtime : Model_ConfirmOvertime = Model_ConfirmOvertime()
        guard let infoData = infoData else {
            return object_Overtime
        }
        if let employee = infoData["employee"] as JSON? {
            object_Overtime.model_OvertimeEmployee = Model_OvertimeEmployee.load_OvertimeEmployee(employee)
        }
        
        if let overtime = infoData["overtime"].array {
            if(overtime.count > 0){
                for overtimeJson in overtime {
                    let model_OvertimeInfo = Model_OvertimeInfo.loadOverTimeInfo(overtimeJson)
                    if let model_OvertimeInfo = model_OvertimeInfo {
                        object_Overtime.array_OvertimeInfo?.add(model_OvertimeInfo)
                    }
                }
            }
        }
        return object_Overtime
    }
}
class Model_OvertimeEmployee: NSObject {
    var section: String = ""
    var avatar: String = ""
    var department: String = ""
    var fullName: String = ""
    var employeeId: String = ""
    
    class func load_OvertimeEmployee(_ infoData:JSON?) -> Model_OvertimeEmployee? {
        let object_OvertimeEmployee : Model_OvertimeEmployee = Model_OvertimeEmployee()
        guard let infoData = infoData else {
            return object_OvertimeEmployee
        }
        if let section = infoData["section"].string {
            object_OvertimeEmployee.section = section
        }
        
        if let avatar = infoData["avatar"].string {
            object_OvertimeEmployee.avatar = avatar
        }
        
        if let department = infoData["department"].string {
            object_OvertimeEmployee.department = department
        }
        
        if let fullName = infoData["fullName"].string {
            object_OvertimeEmployee.fullName = fullName
        }
        
        if let employeeId = infoData["employeeId"].string {
            object_OvertimeEmployee.employeeId = employeeId
        }
        
        return object_OvertimeEmployee
    }
}
class Model_OvertimeInfo: NSObject {
    
    var status: String = ""
    var overtimeType: String = ""
    var toTime: String = ""
    var id: String = ""
    var purpose: String = ""
    var overtimeDate: String = ""
    var frmTime: String = ""
    
    class func loadOverTimeInfo(_ infoData:JSON?) -> Model_OvertimeInfo? {
        let object_OvertimeInfo : Model_OvertimeInfo = Model_OvertimeInfo()
        guard let infoData = infoData else {
            return object_OvertimeInfo
        }
        if let status = infoData["status"].string {
            object_OvertimeInfo.status = status
        }
        
        if let overtimeType = infoData["overtimeType"].string {
            object_OvertimeInfo.overtimeType = overtimeType
        }
        
        if let toTime = infoData["toTime"].string {
            object_OvertimeInfo.toTime = toTime
        }
        
        if let id = infoData["id"].string {
            object_OvertimeInfo.id = id
        }
        
        if let overtimeDate = infoData["overtimeDate"].string {
            object_OvertimeInfo.overtimeDate = overtimeDate
        }
        
        if let purpose = infoData["purpose"].string {
            object_OvertimeInfo.purpose = purpose
        }
        
        if let frmTime = infoData["frmTime"].string {
            object_OvertimeInfo.frmTime = frmTime
        }
        return object_OvertimeInfo
    }
}
