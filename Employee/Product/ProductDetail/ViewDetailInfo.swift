//
//  TbvProductDetailInfo.swift
//  Employee
//
//  Created by Thanh Tuan on 4/9/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
class ViewDetailInfo : UIView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect, superView: UIView) {
        super.init(frame: frame);
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        
    }
    func setupDetailInfo(_ arrTitle: NSMutableArray) {
        var viewBindingsDict = [String: AnyObject]()
        var verticalLayout : String = ""
        verticalLayout += "V:|"
        if(arrTitle.count > 0) {
            for i in 0..<(arrTitle.count) {
                let title = arrTitle[i] as? String
                let vwTitle = ViewTitleWithNoteCircle.init(frame: CGRect.zero, superView: self)
                vwTitle.tag = i
                vwTitle.lblInfo.text = title
                self.addSubview(vwTitle)
                AutoLayoutCommon.setLayoutFullWidthSuperView(vwTitle)
                viewBindingsDict[String(format: "imv%d", i)] = vwTitle
                verticalLayout += String(format: "[imv%d(>=44)]", i)
            }
        }
        verticalLayout += "|"
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalLayout, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
}
class ViewTitleWithNoteCircle : UIView {
    let lblInfo = UILabel.initUILableAutoLayout()
    let vwCircle = UIView.initUIViewAutoLayout()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect, superView: UIView) {
        super.init(frame: frame);
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(self)
        addControl(superView: self)
        setupLayout(superView: self)
    }
    func addControl(superView: UIView){
        superView.addSubview(lblInfo)
        superView.addSubview(vwCircle)
        vwCircle.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        lblInfo.numberOfLines = 0
        vwCircle.layer.cornerRadius = 5
        vwCircle.clipsToBounds = true
    }
    func setupLayout(superView: UIView){
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblInfo)
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(vwCircle)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(vwCircle)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[vwCircle(==10)]-15-[lblInfo]-(==10@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwCircle":vwCircle,"lblInfo":lblInfo]))
        
    }
}
