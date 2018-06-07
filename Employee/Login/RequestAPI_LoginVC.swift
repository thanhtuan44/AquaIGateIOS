//
//  RequestAPI_LoginVC.swift
//  Employee
//
//  Created by Thanh Tuan on 3/10/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_LoginVC {
    func setupAction() {
        btnCheckRememberPass.setTouchActionBlock {
            self.isRememberPass = !self.isRememberPass
            self.btnCheckRememberPass.setBackgroundImage(Utilities.imageWithImage(UIImage(named: String(format: "%@",self.isRememberPass ? "iconSelected" : "iconUnSelect")), scaledToSize: CGSize(width: 20, height: 20)), for: UIControlState())
        }
        btnRememberPass.setTouchActionBlock {
            self.isRememberPass = !self.isRememberPass
            self.btnCheckRememberPass.setBackgroundImage(Utilities.imageWithImage(UIImage(named: String(format: "%@",self.isRememberPass ? "iconSelected" : "iconUnSelect")), scaledToSize: CGSize(width: 20, height: 20)), for: UIControlState())
        }
        btnSignIn.setTouchActionBlock {
            self.showCircleLoadingInVC()
            self.login()
        }
    }
    func login() {
        let param = ["employeeId": self.vwEmail.txtInView.text,
                     "password": self.vwPassWord.txtInView.text] as [String: AnyObject]
        let url = String(format: "%@%@", Constant.DOMAIN,API.LOGIN)
        AQUA_Request.sharedRequest.postData(url, parameters:param) { (success, responseObject) in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let userDic = dataResponse["user"].dictionary {
                                if let employeeId = userDic["employeeId"]?.string {
                                    if let accessToken = userDic["accessToken"]?.string {
                                        let user = User.init(userID: employeeId, userToken: accessToken, isRememberID: self.isRememberPass, isLogin: true)
                                        AQUA_User.shared.saveUser(user: user)
                                        if let window = Constant.Aqua_AppDelegate?.window {
                                            if let tabbarController = Constant.Aqua_AppDelegate?.tabbarController {
                                                tabbarController.selectedIndex = 0
                                                window.rootViewController = tabbarController
                                                self.registerDeviceToken()
                                            }
                                        }
                                    }else{
                                        if let message = dataResponse["message"].string {
                                            Utilities.showAlert(viewController: self, message: message)
                                        }
                                    }
                                }else{
                                    if let message = dataResponse["message"].string {
                                        Utilities.showAlert(viewController: self, message: message)
                                    }
                                }
                            }else{
                                if let message = dataResponse["message"].string {
                                    Utilities.showAlert(viewController: self, message: message)
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
    func registerDeviceToken(){
        if let data = UserDefaults.standard.data(forKey: "DeviceTokenUser"),
            let token = NSKeyedUnarchiver.unarchiveObject(with: data) as? String {
            let paramToken = ["deviceToken": String(format:"%@",token)] as [String: AnyObject]
            let url = String(format: "%@%@", Constant.DOMAIN,API.POST_DEVICE_TOKEN)
            self.showCircleLoadingInVC()
            AQUA_Request.sharedRequest.postDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: paramToken) { (success, responseObject)  in
                self.stopCircleLoadingVC()
                if(success){
                    guard let dataResponse = responseObject else {
                        return
                    }
                    if let dataResponse = dataResponse as? JSON {
                        print("\(dataResponse)")
                        if let status = dataResponse["status"].string {
                            if(status == "1") {
                                print("OK")
                            }
                        }
                    }
                }
            }
        }
    }
}
