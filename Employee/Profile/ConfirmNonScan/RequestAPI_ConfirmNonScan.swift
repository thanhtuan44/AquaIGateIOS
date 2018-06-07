//
//  RequestAPI_ConfirmNonScan.swift
//  Employee
//
//  Created by Thanh Tuan on 6/4/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_ConfirmNonScan {
    func getListConfirmNonScan() {
        if((self.tbvNonScan.arrDataTbv?.count)! > 0){
            self.tbvNonScan.arrDataTbv?.removeAllObjects()
        }
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_LIST_REGISTER_NONSCAN_FORMANAGER)
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
                            if let arrNonScan = dataResponse["data"].array {
                                if(arrNonScan.count > 0) {
                                    for nonscanJson in arrNonScan {
                                        if let nonscanItem = Model_MissingNonScan.loadMissingNonScan(nonscanJson) {
                                            self.tbvNonScan.arrDataTbv?.add(nonscanItem)
                                        }
                                    }
                                    self.tbvNonScan.reloadData()
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
