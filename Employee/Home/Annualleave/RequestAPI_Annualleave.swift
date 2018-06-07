//
//  RequestAPI_Annualleave.swift
//  Employee
//
//  Created by Thanh Tuan on 4/17/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

extension AQUA_Annualleave {
    func getAnnually() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_LIST_ANNUALLEAVE)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let annualleave = dataResponse["annualleave"].array {
                                if(annualleave.count > 0){
                                    if(annualleave.count == 1) {
                                        if let annualleaveJson = annualleave[0] as JSON?{
                                            let model_Annualleave = Model_Annualleave.loadAnnualleave(annualleaveJson)
                                            if let model_Annualleave = model_Annualleave {
                                                self.vwAnnualleaveCurrent.tbvAnnualleave.arrDataTbv?.add(model_Annualleave)
                                                self.vwAnnualleaveCurrent.reloadData()
                                                self.vwAnnualleaveCurrent.btnYear.label.text = String(format:"Năm %@ :",model_Annualleave.currentYear)
                                                
                                            }
                                        }
                                        self.setupArrangeWithOnlyCurrent()
                                    }
                                    if(annualleave.count == 2) {
                                        if let annualleaveJson = annualleave[0] as JSON?{
                                            let model_Annualleave = Model_Annualleave.loadAnnualleave(annualleaveJson)
                                            if let model_Annualleave = model_Annualleave {
                                                self.vwAnnualleaveBefore.tbvAnnualleave.arrDataTbv?.add(model_Annualleave)
                                                self.vwAnnualleaveBefore.reloadData()
                                                self.vwAnnualleaveBefore.btnYear.label.text = String(format:"Năm %@",model_Annualleave.currentYear)
                                                self.vwAnnualleaveBefore.layoutContraintsHeighViewAnnualleave.constant = 44
                                            }
                                        }
                                        if let annualleaveJson = annualleave[1] as JSON?{
                                            let model_Annualleave = Model_Annualleave.loadAnnualleave(annualleaveJson)
                                            if let model_Annualleave = model_Annualleave {
                                                self.vwAnnualleaveCurrent.tbvAnnualleave.arrDataTbv?.add(model_Annualleave)
                                                self.vwAnnualleaveCurrent.reloadData()
                                                self.vwAnnualleaveCurrent.btnYear.label.text = String(format:"Năm %@",model_Annualleave.currentYear)
                                            }
                                        }
                                        self.setupArrange()
                                    }
                                }else{
                                    self.showViewNoData(title: "Bạn chưa có ngày phép trong năm", haveTabbar: false)
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
