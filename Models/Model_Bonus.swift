//
//  Model_Bonus.swift
//  Employee
//
//  Created by Thanh Tuan on 4/6/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model_Bonus: NSObject {
    
    var bonus: String = ""
    var inLate: String = ""
    var outEarly: String = ""
    var UnpaidTime: String = ""
    var NoneScan: String = ""
    var LeaveNoBonus: String = ""
    var DayOff: String = ""
    var ChangeShift: String = ""
    
    class func loadBonus(_ infoData:JSON?) -> Model_Bonus? {
        let object_Bonus : Model_Bonus = Model_Bonus()
        guard let infoData = infoData else {
            return object_Bonus
        }
        if let bonus = infoData["bonus"].string {
            object_Bonus.bonus = bonus
        }
        
        if let inLate = infoData["inLate"].string {
            object_Bonus.inLate = inLate
        }
        
        if let outEarly = infoData["outEarly"].string {
            object_Bonus.outEarly = outEarly
        }
        
        if let UnpaidTime = infoData["UnpaidTime"].string {
            object_Bonus.UnpaidTime = UnpaidTime
        }
        
        if let NoneScan = infoData["NoneScan"].string {
            object_Bonus.NoneScan = NoneScan
        }
        
        if let LeaveNoBonus = infoData["LeaveNoBonus"].string {
            object_Bonus.LeaveNoBonus = LeaveNoBonus
        }
        
        if let DayOff = infoData["DayOff"].string {
            object_Bonus.DayOff = DayOff
        }
        
        if let ChangeShift = infoData["ChangeShift"].string {
            object_Bonus.ChangeShift = ChangeShift
        }
        
        return object_Bonus
    }
}
