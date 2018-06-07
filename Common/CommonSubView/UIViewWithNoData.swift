//
//  UIViewWithNoData.swift
//  Employee
//
//  Created by Thanh Tuan on 4/6/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class UIViewWithNoData: UIView {
    let vwInfo = UIView.initUIViewAutoLayout()
    let imvNotice = UIImageView.initUIImageViewAutoLayout()
    let lblInfo = UILabel.initUILableAutoLayout()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect,superview: UIView,title: String, haveTabbar: Bool) {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        superview.addSubview(self)
        addControl()
        setupLayout(superview, haveTabbar: haveTabbar)
        self.lblInfo.text = title
    }
    func addControl() {
        self.addSubview(vwInfo)
        vwInfo.addSubview(imvNotice)
        vwInfo.addSubview(lblInfo)
        lblInfo.numberOfLines = 0
        imvNotice.image = Utilities.imageWithImage(UIImage(named: "iconLogo"), scaledToSize: CGSize(width: 88, height: 88))
        lblInfo.textAlignment = .center
    }
    func setupLayout(_ superview:UIView,haveTabbar: Bool) {
        AutoLayoutCommon.setLayoutCenterSuperView(vwInfo)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[vwInfo]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwInfo":vwInfo]))
        AutoLayoutCommon.setLayoutWidthEqualHeightItSelf(imvNotice)
        AutoLayoutCommon.setLayoutCenterHorizontalSuperView(imvNotice)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblInfo)
        vwInfo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imvNotice(==88)][lblInfo(>=44)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvNotice":imvNotice,"lblInfo":lblInfo]))
        AutoLayoutCommon.setLayoutFullWidthSuperView(self)
        let kBottom = haveTabbar ? 49 : 0
        let metrics = Dictionary(dictionaryLiteral: ("kBottom",kBottom))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[self]-kBottom-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: ["self":self]))
    }
    
}
