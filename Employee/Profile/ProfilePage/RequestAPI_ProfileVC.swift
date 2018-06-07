//
//  RequestAPI_ProfileVC.swift
//  Employee
//
//  Created by Thanh Tuan on 3/12/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_Profile {
    func getProfile() {
        self.showCircleLoadingInVC()
        print(AQUA_User.shared.userAqua.userToken)
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_PROFILE)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            if(success){
                self.stopCircleLoadingVC()
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let userDic = dataResponse["user"].dictionary {
                                if let userName = userDic["fullName"]?.string {
                                    self.lblUserName.text = userName
                                }
                                if let pos_id = userDic["posId"]?.string {
                                    if(pos_id == "MA_" || pos_id == "SM_") {
                                        self.vwConfirm.reloadDataManager()
                                        if(AQUA_User.shared.userPushNotificationInfo.isReceivePush == true) {
                                            AQUA_User.shared.userPushNotificationInfo.isReceivePush = false
                                            if(AQUA_User.shared.userPushNotificationInfo.pushInfo == "Go ConfirmDateOffVC") {
                                                if let confirmDateOffVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmDateOffVC") as? AQUA_ConfirmDateOff {
                                                    confirmDateOffVC.hidesBottomBarWhenPushed = true
                                                    self.navigationController?.pushViewController(confirmDateOffVC, animated: true)
                                                }
                                            }else if(AQUA_User.shared.userPushNotificationInfo.pushInfo == "Go ConfirmOvertimeVC"){
                                                if let ConfirmOvertimeVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmOvertimeVC") as? AQUA_ConfirmOvertime {
                                                    ConfirmOvertimeVC.hidesBottomBarWhenPushed = true
                                                    self.navigationController?.pushViewController(ConfirmOvertimeVC, animated: true)
                                                }
                                            }
                                            
                                        }
                                    }else{
                                        self.vwConfirm.reloadUser()
                                    }
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
    func setupAction() {
        self.btnRegisDateOff.setTouchActionBlock {
            
//            if let image = UIImage(named: "1.jpeg") {
//                AQUA_Request.sharedRequest.uploadDataWithHeader("http://webapi.aquavietnam.vn/HRMS/api/employee/avatar", image: image, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], completion: {(success, responseObject) in
//                    if(success){
//                        print(responseObject)
//                    }
//                })
//            }
            
            if let registerDateOffVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterDateOffVC") as? AQUA_RegisterDateOff {
                registerDateOffVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(registerDateOffVC, animated: true)
            }
            
        }
        self.btnRegisOvertime.setTouchActionBlock {
            if let registerOverTimeVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterOverTimeVC") as? AQUA_RegisterOverTime {
                registerOverTimeVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(registerOverTimeVC, animated: true)
            }
            
        }
        self.btnRegisNonScan.setTouchActionBlock {
            if let registerNonScanVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterNonScanVC") as? AQUA_RegisterNonScan {
                registerNonScanVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(registerNonScanVC, animated: true)
            }
            
        }
        
        self.vwConfirm.btnConfirmDateOff.setTouchActionBlock {
            if let confirmDateOffVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmDateOffVC") as? AQUA_ConfirmDateOff {
                confirmDateOffVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(confirmDateOffVC, animated: true)
            }
            
        }
        self.vwConfirm.btnConfirmOvertime.setTouchActionBlock {
            if let confirmOvertimeVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmOvertimeVC") as? AQUA_ConfirmOvertime {
                confirmOvertimeVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(confirmOvertimeVC, animated: true)
            }
            
        }
        self.vwConfirm.btnConfirmNonScan.setTouchActionBlock {
            if let confirmNonScanVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmNonScanVC") as? AQUA_ConfirmNonScan {
                confirmNonScanVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(confirmNonScanVC, animated: true)
            }
            
        }
        self.btnSignOut.setTouchActionBlock {
            UIAlertController.showAlert(in: self,
                                        withTitle: "",
                                        message: "Bạn có muốn đăng xuất?",
                                        cancelButtonTitle: "Cancel",
                                        destructiveButtonTitle: "OK",
                                        otherButtonTitles: nil,
                                        tap: {(controller, action, buttonIndex) in
                                            switch buttonIndex {
                                            case controller.cancelButtonIndex:
                                                print("")
                                            case controller.destructiveButtonIndex:
                                                self.logOut()
                                            default :
                                                print("")
                                            }
            })
        }
    }
    func logOut() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.LOGOUT)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let window = Constant.Aqua_AppDelegate?.window {
                                if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? AQUA_LoginVC{
                                    AQUA_User.shared.logoutUser()
                                    window.rootViewController = loginVC
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
}
