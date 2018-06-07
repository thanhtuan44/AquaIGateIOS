//
//  ButtonWithArrow.swift
//  favant
//
//  Created by MinhAnh on 6/27/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit


class ButtonWithArrow: UIButtonBlock {
    var imvArrow : UIImageView! = UIImageView.initUIImageViewAutoLayout()
    var label: UILabel! = UILabel.initUILableAutoLayout()
    var isOpen : Bool = false
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, superView: UIView, string: String?) {
        super.init(frame: frame);
        superView.addSubview(self)
        setLayoutWidthViewArrow()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setBackgroundImage(Utilities.imageWithColor(UIColor.white), for: UIControlState())
        self.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_LINE)), for: .highlighted)
        self.addSubview(imvArrow);
        self.addSubview(label);
        imvArrow.image = UIImage(named: "icon_Arrow.png");
        imvArrow.contentMode = UIViewContentMode.center
        label.text = string;
        makeImageView()
    }
   
    init(frame: CGRect, superView: UIView, string: String?, isOpenArrow : Bool) {
        super.init(frame: frame);
        superView.addSubview(self)
        setLayoutWidthViewArrow()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setBackgroundImage(Utilities.imageWithColor(UIColor.white), for: UIControlState())
        self.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_LINE)), for: .highlighted)
        self.addSubview(imvArrow);
        self.addSubview(label);
        imvArrow.image = UIImage(named: "icon_Arrow.png");
        imvArrow.contentMode = UIViewContentMode.center
        label.text = string;
        makeImageView()
        self.isOpen = isOpenArrow
        clickOpen();
        self.setTouchActionBlock { () -> Void in
            self.clickOpen()
        }
    }
    init(frame: CGRect, superView: UIView, string: String?, color: UIColor, isOpenArrow : Bool) {
        super.init(frame: frame);
        superView.addSubview(self)
        setLayoutWidthViewArrow()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setBackgroundImage(Utilities.imageWithColor(UIColor.white), for: UIControlState())
        self.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_LINE)), for: .highlighted)
        self.addSubview(imvArrow);
        self.addSubview(label);
        label.textColor = color
        imvArrow.image = UIImage(named: "icon_Arrow.png");
        imvArrow.contentMode = UIViewContentMode.center
        label.text = string;
        makeImageView()
        self.isOpen = isOpenArrow
        clickOpen();
        self.setTouchActionBlock { () -> Void in
            self.clickOpen()
        }
    }
    
    func setLayoutWidthViewArrow() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(self)
    }
}


extension ButtonWithArrow{
    func makeImageView() {
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imvArrow]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvArrow" : imvArrow]));
        self.addConstraints([NSLayoutConstraint(item: imvArrow, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.height, multiplier: 0.5, constant: 0)]);
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["label" : label]));
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[label][imvArrow]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["label" : label , "imvArrow" : imvArrow]));
    }
   
    func clickOpen() {
        if(isOpen) {
            rotateDegrees(imvArrow, float: 90)
            isOpen = !isOpen;
        }else{
            rotateDegrees(imvArrow, float: -0)
            isOpen = !isOpen;
        }
    }
    func rotateDegrees( _ view:UIView, float:CGFloat) {
        let degrees = float //the value in degrees
        UIView.animate(withDuration: 0.2, animations: {
            view.transform = CGAffineTransform(rotationAngle: degrees * CGFloat(Double.pi/180));
        }) 
    }
}
