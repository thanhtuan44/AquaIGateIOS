//
//  AQUA_ProductList.swift
//  Employee
//
//  Created by Thanh Tuan on 3/13/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class AQUA_ProductDetail: Base_BackViewWithScrollViewController, Delegate_BaseCollectionView {
    
    var vwBanner : ViewDetail_Banner!
    let lblProductTile = UILabel.initUILableAutoLayout()
    let lblProductInfo = UILabel.initUILableAutoLayout()
    var vwInfo : ViewDetailInfo!
    var idProduct = ""
    var arrInfo : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewInfo()
        setupBanner()
        self.scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwBanner]-20-[lblProductTile]-5-[lblProductInfo]-10-[vwInfo]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwBanner":vwBanner,"lblProductTile":lblProductTile,"lblProductInfo":lblProductInfo,"vwInfo":vwInfo]))
        self.getProductDetail()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    func setupViewInfo() {
        vwInfo = ViewDetailInfo.init(frame: CGRect.zero, superView: self.scvBase)
        lblProductTile.font = UIFont.init(name: Constant.FONT_APP, size: 24)
        lblProductTile.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        lblProductTile.text = "AQR-IG585AS"
        lblProductTile.numberOfLines = 0
        lblProductInfo.font = UIFont.init(name: Constant.FONT_APP, size: 18)
        lblProductInfo.numberOfLines = 0
        lblProductInfo.text = String(format:"Màu Bạc (GS), màu Đen (GB), màu Vàng (SG)\n565 Lít")
        self.scvBase.addSubview(lblProductTile)
        self.scvBase.addSubview(lblProductInfo)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblProductTile, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblProductInfo, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwInfo)
    }
    func setupBanner() {
        self.vwBanner = ViewDetail_Banner.init(frame: CGRect.zero, superView: self.scvBase)
        self.vwBanner.clvBanner.delegate_ClvBase = self
    }
    func getProductDetail() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@%@", Constant.DOMAIN,API.GET_PRODUCT_DETAIL,idProduct)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            if let dataValue = dataResponse["data"].dictionary {
                                if let arrImageData = dataValue["Images"]?.array {
                                    if(arrImageData.count > 0) {
                                        for i in 0..<(arrImageData.count) {
                                            if let image = arrImageData[i] as JSON?{
                                                if let imageItem = image.rawString() as String? {
                                                    self.vwBanner.clvBanner.arrDataClv?.add(imageItem)
                                                }
                                            }
                                        }
                                        self.vwBanner.reloadData()
                                    }
                                }
                                if let arrFeaturesData = dataValue["Features"]?.array {
                                    if(arrFeaturesData.count > 0) {
                                        for i in 0..<(arrFeaturesData.count) {
                                            if let feature = arrFeaturesData[i] as JSON?{
                                                if let featureItem = feature.rawString() as String? {
                                                    self.arrInfo.add(featureItem)
                                                }
                                            }
                                        }
                                        self.vwInfo.setupDetailInfo(NSMutableArray.init(array: self.arrInfo))
                                    }
                                }
                            }
                            
                        }else{
                            if let message = dataResponse["message"].string {
                                Utilities.showAlert(viewController: self, message: message)
                            }
                        }
                    }
                }
            }
        }
    }
}
extension AQUA_ProductDetail {
    
    func baseScrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView == self.vwBanner.clvBanner) {
            let indexOfPage = scrollView.contentOffset.x / scrollView.frame.size.width;
            self.vwBanner.pageControl.currentPage = Int(indexOfPage)
        }
    }
}
