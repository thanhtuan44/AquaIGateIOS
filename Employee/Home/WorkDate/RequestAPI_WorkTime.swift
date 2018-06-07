//
//  RequestAPI_WorkTimeVC.swift
//  Employee
//
//  Created by Thanh Tuan on 4/3/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_WorkDate {
    func getWorkTimeDaily() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_WORKTIMEDAILY)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let arrWorkTime = dataResponse["daily"].array {
                                if(arrWorkTime.count > 0) {
                                    for workTimeJson in arrWorkTime {
                                        if let dataWorkTime = Model_WorkTimeDaily.loadWorkingDaily(workTimeJson) {
                                            self.tbvWorkDate.arrDataTbv?.add(dataWorkTime)
                                        }
                                    }
                                    self.tbvWorkDate.reloadData()
                                } else {self.showViewNoData(title: "Chưa có dữ liệu", haveTabbar: false)}
                            } else {self.showViewNoData(title: "Chưa có dữ liệu", haveTabbar: false)}
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
