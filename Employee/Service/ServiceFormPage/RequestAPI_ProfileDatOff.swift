//
//  RequestAPI_ProfileDatOff.swift
//  Employee
//
//  Created by Thanh Tuan on 4/5/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_DateOff {
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
    func postRegisterDateOff() {
        if(self.idEmployeeType == "") {
            Utilities.showAlert(viewController: self, message: "Vui lòng chọn loại nhân viên")
            return
        }
        if(self.vwReason.lblValue.text == "Chọn lý do nghỉ") {
            Utilities.showAlert(viewController: self, message: "Vui lòng chọn lý do nghỉ")
            return
        }
        if(self.idManagerSelect == "") {
            Utilities.showAlert(viewController: self, message: "Vui lòng chọn người nhận")
            return
        }
        let paramRegisterDateOff = ["employeeType": Int(String(format:"%@",self.idEmployeeType)) ?? 1,
                                    "date": String(format:"%@",Utilities.getDateCalendar(date: Date())),
                                    "reason": Int(String(format:"%@",self.idReasonType)) ?? 1,
                                    "contents":String(format:"%@",self.txvNote.text),
                                    "fromTime":String(format:"%@:00",self.vwBeginTime.lblValue.text!),
                                    "fromDate":String(format:"%@",self.vwBeginDate.lblValue.text!),
                                    "toTime":String(format:"%@:00",self.vwEndTime.lblValue.text!),
                                    "toDate":String(format:"%@",self.vwEndDate.lblValue.text!),
                                    "totalAbsentDays":"1",
                                    "decision":"",
                                    "requestBy":String(format:"%@",self.idManagerSelect)] as [String: AnyObject]
        let url = String(format: "%@%@", Constant.DOMAIN,API.POST_REGISTER_DATEOFF)
        self.showCircleLoadingInVC()
        AQUA_Request.sharedRequest.postDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: paramRegisterDateOff) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    print("\(dataResponse)")
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            Utilities.showAlert(viewController: self, message: "Đã gửi đơn xin nghỉ thành công")
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
