//
//  RequestAPI_ConfirmOvertime.swift
//  Employee
//
//  Created by Thanh Tuan on 4/13/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_ConfirmOvertime {
    func getListConfirmOvertime() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_LIST_REGISTER_OVERTIME_FORMANAGER)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            print("\(dataResponse)")
                            if let arrOvertime = dataResponse["data"].array {
                                if(arrOvertime.count > 0) {
                                    for overtimeJson in arrOvertime {
                                        if let overtimeItem = Model_Overtime.loadOverTime(overtimeJson) {
                                            self.tbvConfirmOvertime.arrDataTbv?.add(overtimeItem)
                                        }
                                    }
                                    self.tbvConfirmOvertime.reloadData()
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
