//
//  ViewWithInfo.swift
//  Employee
//
//  Created by Thanh Tuan on 3/15/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ViewWithInfo: UIViewBlock {

    let lblTitle = UILabel.initUILableAutoLayout()
    let lblValue = UILabel.initUILableAutoLayout()
    let line = UIView.initUIViewAutoLayout()
    
    
    init(frame: CGRect, superView: UIView, title: String) {
        super.init(frame: frame);
        superView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        addControl()
        setupLayout()
        lblTitle.text = String(format: "%@ : ", title)
        lblTitle.font = UIFont(name: Constant.FONT_APP, size: 14)
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addControl() {
        self.addSubview(lblTitle)
        self.addSubview(lblValue)
        self.addSubview(line)
        lblTitle.textColor = UIColor.gray
        line.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        lblValue.numberOfLines = 0
        lblTitle.textAlignment = .left
        lblValue.textAlignment = .right
    }
    
    func setupLayout() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(self)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblTitle(>=44)]-(>=5@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblTitle":lblTitle]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblValue(>=44)]-(>=5@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblValue":lblValue]))
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(line, kLeft: 10, kRight: 10)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[lblTitle]-20-[lblValue]-(10)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblTitle":lblTitle,"lblValue":lblValue]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(==1)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["line":line]))
    }
}
