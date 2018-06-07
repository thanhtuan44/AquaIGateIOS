//
//  RequestAPI_NonScan.swift
//  Employee
//
//  Created by Thanh Tuan on 4/23/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation

extension AQUA_NonScan {
    func getProfile() {
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_PROFILE)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let userDic = dataResponse["user"].dictionary {
                                if let fullName = userDic["fullName"]?.string {
                                    self.vwNameEmployee.lblValue.text = fullName
                                }
                                if let employeeId = userDic["employeeId"]?.string {
                                    self.vwIdOfEmployee.lblValue.text = employeeId
                                }
                            }
                        }else{
                            if let message = dataResponse["message"].string {
                                Utilities.showAlert(viewController: self, message: message)
                            }
                        }
                    }
                }
            }
        }
    }
    func postRegisterMissingNonScan() {
        if(self.txvNote.text == "") {
            Utilities.showAlert(viewController: self, message: "Vui lòng nhập lý do quên quẹt thẻ")
            return
        }
        if(self.idManagerSelect == "") {
            Utilities.showAlert(viewController: self, message: "Vui lòng chọn người nhận")
            return
        }
        guard var timeIn = self.vwBeginTime.lblValue.text else {
            return
        }
        guard var timeOut = self.vwEndTime.lblValue.text else {
            return
        }
        if(timeIn != ""){
            timeIn = String(format:"%@:00",timeIn)
        }
        
        if(timeOut != ""){
            timeOut = String(format:"%@:00",timeOut)
        }
        
        let paramRegisterMissingNonScan = ["date": String(format:"%@",Utilities.getDateCalendar(date: Date())),
                                           "reason":String(format:"%@",self.txvNote.text),
                                           "timeIn":timeIn,
                                           "timeOut":timeOut,
                                           "requestBy":String(format:"%@",self.idManagerSelect)] as [String: AnyObject]
        let url = String(format: "%@%@", Constant.DOMAIN,API.POST_REGISTER_MISSING_NONSCAN)
        self.showCircleLoadingInVC()
        AQUA_Request.sharedRequest.postDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: paramRegisterMissingNonScan) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    print("\(dataResponse)")
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            Utilities.showAlert(viewController: self, message: "Đã gửi xét duyệt quên quẹt thẻ")
                        }else{
                            if let message = dataResponse["message"].string {
                                Utilities.showAlert(viewController: self, message: message)
                            }
                        }
                    }
                }
            }
        }
    }
}
