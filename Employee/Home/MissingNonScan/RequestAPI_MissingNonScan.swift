//
//  RequestAPI_NonScan.swift
//  Employee
//
//  Created by Thanh Tuan on 4/17/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_MissingNonScan {
    func getMissingNonScan() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_LIST_MISSING_NONSCAN)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let arrMissingNonScan = dataResponse["missingNonScan"].array {
                                if(arrMissingNonScan.count > 0){
                                    for missingNonScanJson in arrMissingNonScan {
                                        let model_MissingNonScan = Model_MissingNonScan.loadMissingNonScan(missingNonScanJson)
                                        if let model_MissingNonScan = model_MissingNonScan {
                                            self.tbvMissingNonScan?.arrDataTbv?.add(model_MissingNonScan)
                                        }
                                    }
                                    self.tbvMissingNonScan.reloadData()
                                }else{
                                    self.showViewNoData(title: "Hiện chưa có dữ liệu", haveTabbar: false)
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
