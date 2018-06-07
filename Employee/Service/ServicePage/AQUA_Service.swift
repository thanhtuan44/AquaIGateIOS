//
//  AQUA_Service.swift
//  Employee
//
//  Created by Thanh Tuan on 3/15/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class AQUA_Service: Base_ScrollViewController, Delegate_BaseCollectionView {
    var clvService : ClvService!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategory()
        setupData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCategory() {
        self.clvService = ClvService.init(frame: CGRect.zero, collectionViewLayout: ClvServiceFlowLayout())
        self.view.addSubview(clvService)
        clvService.delegate_ClvBase = self
        AutoLayoutCommon.setLayoutFullWidthSuperView(self.clvService)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[clvService]-49-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["clvService":clvService]))
    }
    func setupData() {
        let category1  = ProductCategory.init(name: "Đăng kí nghỉ phép", photo:"iconDateOff")
        self.clvService.arrDataClv?.add(category1)
        
        let category2  = ProductCategory.init(name: "Đăng kí tăng ca", photo:"iconOvertime")
        self.clvService.arrDataClv?.add(category2)
        
        let category3  = ProductCategory.init(name: "Xác nhận quẹt thẻ", photo:"iconNonScan")
        self.clvService.arrDataClv?.add(category3)
        
//        let category4  = ProductCategory.init(name: "Xác nhận đi công tác", photo:"iconBussinesstrip")
//        self.clvService.arrDataClv?.add(category4)
        
        self.clvService.reloadData()
    }
    func didSelect_BaseClvItemAtIndexPath(_ collectionview: UICollectionView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(indexPath.row < arrData.count) {
            switch indexPath.row {
            case 0:
                if let dateOffVC = self.storyboard?.instantiateViewController(withIdentifier: "DateOffVC") as? AQUA_DateOff{
                    dateOffVC.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(dateOffVC, animated: true)
                }
            case 1:
                if let dateOverTimeVC = self.storyboard?.instantiateViewController(withIdentifier: "DateOverTimeVC") as? AQUA_DateOverTime{
                    dateOverTimeVC.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(dateOverTimeVC, animated: true)
                }
            case 2:
                if let nonScanVC = self.storyboard?.instantiateViewController(withIdentifier: "NonScanVC") as? AQUA_NonScan{
                    nonScanVC.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(nonScanVC, animated: true)
                }
            case 3:
                if let missingNonScanVC = self.storyboard?.instantiateViewController(withIdentifier: "MissingNonScanVC") as? AQUA_MissingNonScan{
                    missingNonScanVC.hidesBottomBarWhenPushed = true
                    self.navigationController?.pushViewController(missingNonScanVC, animated: true)
                }
            default:
                print("")
            }
        }
    }
    
}

