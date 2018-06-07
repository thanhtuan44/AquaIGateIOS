//
//  RequestAPI_RegisterOvertime.swift
//  Employee
//
//  Created by Thanh Tuan on 4/12/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_RegisterOverTime {
    func getListRegisterOvertime() {
        if((self.tbvRegisterOvertime.arrDataTbv?.count)! > 0){
            self.tbvRegisterOvertime.arrDataTbv?.removeAllObjects()
        }
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_LIST_REGISTER_OVERTIME)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let arrOvertime = dataResponse["data"].array {
                                if(arrOvertime.count > 0) {
                                    for overtimeJson in arrOvertime {
                                        if let overtimeItem = Model_Overtime.loadOverTime(overtimeJson) {
                                            self.tbvRegisterOvertime.arrDataTbv?.add(overtimeItem)
                                        }
                                    }
                                    self.tbvRegisterOvertime.reloadData()
                                }else{self.showViewNoData(title: "Chưa có dữ liệu", haveTabbar: false)}
                            }else{self.showViewNoData(title: "Chưa có dữ liệu", haveTabbar: false)}
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
