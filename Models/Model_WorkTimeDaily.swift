//
//  Model_WorkTimeDaily.swift
//  Employee
//
//  Created by Thanh Tuan on 4/3/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model_WorkTimeDaily: NSObject {
    var employee: String = ""
    var workDate: String = ""
    var timeOut: String = ""
    var timeIn: String = ""
    var shift: String = ""
    var actualTime: String = ""
    var ns: String = ""
    var ns15: String = ""
    var ns20: String = ""
    var ot15: String = ""
    var otm: String = ""
    var ot20: String = ""
    var lt: String = ""
    var et: String = ""
    var ut: String = ""
    var meal: String = ""
    var totalWorkTime: String = ""
    
    class func loadWorkingDaily(_ infoData:JSON?) -> Model_WorkTimeDaily? {
        let object_WorkingTime : Model_WorkTimeDaily = Model_WorkTimeDaily()
        guard let infoData = infoData else {
            return object_WorkingTime
        }
        if let employee = infoData["employee"].string {
            object_WorkingTime.employee = employee
        }
        
        if let workDate = infoData["workDate"].string {
            object_WorkingTime.workDate = workDate
        }
        
        if let timeOut = infoData["timeOut"].string {
            object_WorkingTime.timeOut = timeOut
        }
        
        if let timeIn = infoData["timeIn"].string {
            object_WorkingTime.timeIn = timeIn
        }
        
        if let Shift = infoData["Shift"].string {
            object_WorkingTime.shift = Shift
        }

        if let ActualTime = infoData["ActualTime"].string {
            object_WorkingTime.actualTime = ActualTime
        }

        if let NS = infoData["NS"].string {
            object_WorkingTime.ns = NS
        }
        
        if let NS15 = infoData["NS15"].string {
            object_WorkingTime.ns15 = NS15
        }
        
        if let NS20 = infoData["NS20"].string {
            object_WorkingTime.ns20 = NS20
        }
        
        if let OT15 = infoData["OT15"].string {
            object_WorkingTime.ot15 = OT15
        }
        
        if let OTM = infoData["OTM"].string {
            object_WorkingTime.otm = OTM
        }
        
        if let OT20 = infoData["OT20"].string {
            object_WorkingTime.ot20 = OT20
        }
        
        if let LT = infoData["LT"].string {
            object_WorkingTime.lt = LT
        }
        
        if let ET = infoData["ET"].string {
            object_WorkingTime.et = ET
        }

        if let UT = infoData["UT"].string {
            object_WorkingTime.ut = UT
        }
        
        if let MEAL = infoData["MEAL"].string {
            object_WorkingTime.meal = MEAL
        }
        
        if let TotalWorkTime = infoData["TotalWorkTime"].string {
            object_WorkingTime.totalWorkTime = TotalWorkTime
        }
        
        return object_WorkingTime
    }
}
