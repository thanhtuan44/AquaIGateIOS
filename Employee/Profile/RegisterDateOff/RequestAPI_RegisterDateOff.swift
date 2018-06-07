//
//  RequestAPI_RegisterDateOff.swift
//  Employee
//
//  Created by Thanh Tuan on 4/10/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_RegisterDateOff {
    
    func getListRegisterDateOff() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_LIST_REGISTER_DATEOFF)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let arrAbsents = dataResponse["absents"].array {
                                if(arrAbsents.count > 0) {
                                    for absentJson in arrAbsents {
                                        if let absentsItem = Model_Absent.loadAbsent(absentJson) {
                                            self.tbvRegisterDateOff.arrDataTbv?.add(absentsItem)
                                        }
                                    }
                                    self.tbvRegisterDateOff.reloadData()
                                }
                            }
                        }else{
                            if let message = dataResponse["message"].string {
                                self.showViewNoData(title: message, haveTabbar: false)
                            }
                        }
                    }
                }
            }
        }
    }

}
