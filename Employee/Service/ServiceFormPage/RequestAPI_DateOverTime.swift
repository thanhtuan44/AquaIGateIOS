//
//  RequestAPI_DateOverTime.swift
//  Employee
//
//  Created by Thanh Tuan on 4/10/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation

extension AQUA_DateOverTime {
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
    func postRegisterOvertime() {
        if(self.idOverTimeType == "") {
            Utilities.showAlert(viewController: self, message: "Vui lòng chọn loại tăng ca")
            return
        }
        if(self.txvNote.text == "") {
            Utilities.showAlert(viewController: self, message: "Vui lòng nhập mục đích tăng ca")
            return
        }
        if(self.idManagerSelect == "") {
            Utilities.showAlert(viewController: self, message: "Vui lòng chọn người nhận")
            return
        }
        let paramRegisterOvertime = ["overtimeType": Int(String(format:"%@",self.idOverTimeType)) ?? 1,
                                    "overtimeDate": String(format:"%@",Utilities.getDateCalendar(date: Date())),
                                    "purpose":String(format:"%@",self.txvNote.text),
                                    "frmTime":String(format:"%@:00",self.vwBeginTime.lblValue.text!),
                                    "toTime":String(format:"%@:00",self.vwEndTime.lblValue.text!),
                                    "requestBy":String(format:"%@",self.idManagerSelect)] as [String: AnyObject]
        let url = String(format: "%@%@", Constant.DOMAIN,API.POST_REGISTER_OVERTIME)
        self.showCircleLoadingInVC()
        AQUA_Request.sharedRequest.postDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: paramRegisterOvertime) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    print("\(dataResponse)")
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            Utilities.showAlert(viewController: self, message: "Đã gửi đơn xin tăng ca thành công")
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
