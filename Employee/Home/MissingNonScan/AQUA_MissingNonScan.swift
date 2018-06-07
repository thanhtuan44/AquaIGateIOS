//
//  AQUA_MissingNonScan.swift
//  Employee
//
//  Created by Thanh Tuan on 4/17/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_MissingNonScan: Base_BackViewController, Delegate_TbvMissingNonScan {

    var tbvMissingNonScan : TbvMissingNonScan!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTbvMissingNonScan()
        self.getMissingNonScan()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTbvMissingNonScan() {
        self.tbvMissingNonScan = TbvMissingNonScan.init(frame: CGRect.zero, superView: self.view)
        self.tbvMissingNonScan.delegate_TbvMissingNonScan = self
        AutoLayoutCommon.setLayoutFullSuperView(tbvMissingNonScan)
    }
    
    
    func didSelectButton(_ type: String, missingNonScanData: Model_MissingNonScan) {
        switch type {
        case "RegisterDateOff":
            if let dateOffVC = self.storyboard?.instantiateViewController(withIdentifier: "DateOffVC") as? AQUA_DateOff{
                dateOffVC.hidesBottomBarWhenPushed = true
                dateOffVC.dateFromMissingNoScan = missingNonScanData.workDate
                self.navigationController?.pushViewController(dateOffVC, animated: true)
            }
        case "RegisterScan":
            if let nonScanVC = self.storyboard?.instantiateViewController(withIdentifier: "NonScanVC") as? AQUA_NonScan{
                nonScanVC.hidesBottomBarWhenPushed = true
                nonScanVC.dateFromMissingNoScan = missingNonScanData.workDate
                if(!(missingNonScanData.timeIn == "Missing" || missingNonScanData.timeIn == "NonScan")){
                    nonScanVC.timeInFromMissingNoScan = missingNonScanData.timeIn
                }
                if(!(missingNonScanData.timeOut == "Missing" || missingNonScanData.timeOut == "NonScan")){
                    nonScanVC.timeOutFromMissingNoScan = missingNonScanData.timeOut
                }
                self.navigationController?.pushViewController(nonScanVC, animated: true)
            }
        default:
            print("")
        }
    }
}
