//
//  ViewWithTextField.swift
//  Hasaki
//
//  Created by MinhAnh on 9/19/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class ViewWithTextField: UIView {
    let txtInView = UITextFieldBlock.initUITextFieldBlockAutoLayout()
    let imvInView = UIImageView.initUIImageViewAutoLayout()
    let line = UIView.initUIViewAutoLayout()
    let lblInfo = UILabel.initUILableAutoLayout()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect,withSuperView superView:UIView,stringPlaceHolder: String, withUnderLine : Bool, withInfo: String) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        txtInView.placeholder = String(format: "%@", stringPlaceHolder)
        txtInView.autocorrectionType = UITextAutocorrectionType.no
        txtInView.textAlignment = .right
        self.clipsToBounds = true
        line.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        superView.addSubview(self);
        self.addSubview(line)
        self.addSubview(txtInView)
        self.addSubview(lblInfo)
        AutoLayoutCommon.setLayoutHeightView(line, kHeight: 1)
        self.addConstraints([NSLayoutConstraint(item: line, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -10)]);
        AutoLayoutCommon.setLayoutFullWidthSuperView(line)
        lblInfo.textColor = UIColor.darkGray
        lblInfo.text = withInfo
        lblInfo.textAlignment = .left
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[txtInView]-(<=10)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["txtInView":txtInView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblInfo]-(<=10)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblInfo":lblInfo]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[lblInfo(<=70@750)]-(==10@999)-[txtInView]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblInfo":lblInfo,"txtInView":txtInView]))
    }
    init(frame: CGRect,withSuperView superView:UIView,stringPlaceHolder: String) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4.0
        self.layer.borderColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE).cgColor
        self.layer.borderWidth = 1.0
        txtInView.placeholder = String(format: "%@", stringPlaceHolder)
        txtInView.autocorrectionType = UITextAutocorrectionType.no
        superView.addSubview(self);
        self.addSubview(txtInView)
        self.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)]);
        self.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 10)]);
        self.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)]);

        self.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -10)]);
    }
    
    init(frame: CGRect,withSuperView superView:UIView,stringPlaceHolder: String,imvLogo: String) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4.0
        self.layer.borderColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE).cgColor
        self.layer.borderWidth = 1.0
        txtInView.placeholder = String(format: "%@", stringPlaceHolder)
        txtInView.autocorrectionType = UITextAutocorrectionType.no
        superView.addSubview(self);
        self.addSubview(txtInView)
        self.addSubview(imvInView)
        imvInView.image = UIImage(named: imvLogo)
        imvInView.contentMode = UIViewContentMode.scaleAspectFit
        self.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)]);
        self.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 10)]);
        self.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)]);
        self.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -44)]);
        
        superView.addConstraints([NSLayoutConstraint(item: imvInView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)]);
        superView.addConstraints([NSLayoutConstraint(item: imvInView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -44)]);
        superView.addConstraints([NSLayoutConstraint(item: imvInView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -5)]);
        superView.addConstraints([NSLayoutConstraint(item: imvInView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -10)]);
    }
    init(frame: CGRect,withSuperView superView:UIView,stringPlaceHolder: String,imvLogo: String, topHomePage: Bool) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4.0
        self.layer.borderColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA).cgColor
        self.layer.borderWidth = 1.0
        txtInView.placeholder = String(format: "%@", stringPlaceHolder)
        txtInView.autocorrectionType = UITextAutocorrectionType.no
        superView.addSubview(self);
        superView.addSubview(txtInView)
        superView.addSubview(imvInView)
        
        imvInView.image = UIImage(named: imvLogo)
        imvInView.contentMode = UIViewContentMode.center
        imvInView.tintColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        superView.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)]);
        superView.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 10)]);
        superView.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)]);
        superView.addConstraints([NSLayoutConstraint(item: txtInView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -44)]);
        
        superView.addConstraints([NSLayoutConstraint(item: imvInView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)]);
        superView.addConstraints([NSLayoutConstraint(item: imvInView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -44)]);
        superView.addConstraints([NSLayoutConstraint(item: imvInView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -5)]);
        superView.addConstraints([NSLayoutConstraint(item: imvInView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -10)]);
    }
}
