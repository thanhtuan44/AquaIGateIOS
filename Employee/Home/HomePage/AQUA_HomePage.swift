//
//  AQUA_HomePage.swift
//  Employee
//
//  Created by Thanh Tuan on 3/7/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_HomePage: Base_ScrollViewController, Delegate_BaseCollectionView {

    var vwBanner : ViewHomePage_Banner!
    var vwCatogoryInfo : ViewWithText!
    var vwCategoryItem : ViewHomePage_ClvCategoryItem!
    var layoutContraintsHeightVwCategoryItem : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBanner()
        setupCategoriesItem()
        setupHeightViewCategoryItem()
        setupArrange()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setupArrange() {
        self.scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwBanner][vwCatogoryInfo(==50)][vwCategoryItem]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwBanner": vwBanner,"vwCatogoryInfo":vwCatogoryInfo,"vwCategoryItem":vwCategoryItem]))
    }

}

extension AQUA_HomePage {
    func setupBanner() {
        self.vwBanner = ViewHomePage_Banner.init(frame: CGRect.zero, superView: self.scvBase)
        self.vwBanner.clvBanner.delegate_ClvBase = self
        if let image = UIImage.init(named: "banner1") {
            self.vwBanner.clvBanner.arrDataClv?.add(image)
        }
        if let image = UIImage.init(named: "banner2") {
            self.vwBanner.clvBanner.arrDataClv?.add(image)
        }
        if let image = UIImage.init(named: "banner3") {
            self.vwBanner.clvBanner.arrDataClv?.add(image)
        }
        if let image = UIImage.init(named: "banner4") {
            self.vwBanner.clvBanner.arrDataClv?.add(image)
        }
        if let image = UIImage.init(named: "banner5") {
            self.vwBanner.clvBanner.arrDataClv?.add(image)
        }
        self.vwBanner.clvBanner.reloadData()
        vwCatogoryInfo = ViewWithText.init(frame: CGRect.zero, superView: scvBase, string: "Category Item")
        scvBase.addSubview(vwCatogoryInfo)
    }
    func setupCategoriesItem() {
        self.vwCategoryItem = ViewHomePage_ClvCategoryItem.init(frame: CGRect.zero, superView: self.scvBase)
        self.vwCategoryItem.clvCategoryItem.delegate_ClvBase = self
        layoutContraintsHeightVwCategoryItem = AutoLayoutCommon.setLayoutHeightConstraintsSuperView(vwCategoryItem, constantValue: 1)
        let category1  = ProductCategory.init(name: "Working daily", photo:"iconWorkDate")
        self.vwCategoryItem.clvCategoryItem.arrDataClv?.add(category1)
        
        let category2  = ProductCategory.init(name: "Bonus", photo:"iconBonus")
        self.vwCategoryItem.clvCategoryItem.arrDataClv?.add(category2)
        
        let category3  = ProductCategory.init(name: "Annualleave", photo: "iconFreeDate")
        self.vwCategoryItem.clvCategoryItem.arrDataClv?.add(category3)
        
        let category4  = ProductCategory.init(name: "Missing NonScan", photo: "iconNonScan")
        self.vwCategoryItem.clvCategoryItem.arrDataClv?.add(category4)
        
        self.vwCategoryItem.clvCategoryItem.reloadData()
    }
    func setupHeightViewCategoryItem() {
        self.perform(#selector(AQUA_HomePage.setHeightViewCategoryItem), with: self, afterDelay: 0.1)
    }
    @objc func setHeightViewCategoryItem() {
        layoutContraintsHeightVwCategoryItem.constant = vwCategoryItem.clvCategoryItem.collectionViewLayout.collectionViewContentSize.height
    }
    
    
}
extension AQUA_HomePage {
    //Delegate
    func didSelect_BaseClvItemAtIndexPath(_ collectionview: UICollectionView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(indexPath.row < arrData.count) {
            if(collectionview == self.vwCategoryItem.clvCategoryItem) {
                switch indexPath.row {
                case 0:
                    if let workDateVC = self.storyboard?.instantiateViewController(withIdentifier: "WorkDateVC") as? AQUA_WorkDate{
                        workDateVC.hidesBottomBarWhenPushed = true
                        self.navigationController?.pushViewController(workDateVC, animated: true)
                    }
                case 1:
                    if let bonusVC = self.storyboard?.instantiateViewController(withIdentifier: "BonusVC") as? AQUA_Bonus{
                        bonusVC.hidesBottomBarWhenPushed = true
                        self.navigationController?.pushViewController(bonusVC, animated: true)
                    }
                case 2:
                    if let annualleaveVC = self.storyboard?.instantiateViewController(withIdentifier: "AnnualleaveVC") as? AQUA_Annualleave{
                        annualleaveVC.hidesBottomBarWhenPushed = true
                        self.navigationController?.pushViewController(annualleaveVC, animated: true)
                    }
                case 3:
                    if let missingNonScanVC = self.storyboard?.instantiateViewController(withIdentifier: "MissingNonScanVC") as? AQUA_MissingNonScan{
                        missingNonScanVC.hidesBottomBarWhenPushed = true
                        self.navigationController?.pushViewController(missingNonScanVC, animated: true)
                    }
                    
                default:
                    print("")
                }
            }else if(collectionview == self.vwBanner.clvBanner) {
                if let productAllVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductAllVC") as? AQUA_ProductAll{
                    productAllVC.hidesBottomBarWhenPushed = true
                    productAllVC.indexSelect = indexPath.row
                    self.navigationController?.pushViewController(productAllVC, animated: true)
                }
            }
        }
    }
    func baseScrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView == self.vwBanner.clvBanner) {
            let indexOfPage = scrollView.contentOffset.x / scrollView.frame.size.width;
            self.vwBanner.pageControl.currentPage = Int(indexOfPage)
        }
    }
}
