//
//  ViewWithMaskView.swift
//  Employee
//
//  Created by Thanh Tuan on 3/15/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ViewWithMaskView: UIView {
    let vwTop = UIViewBlock.initUIViewBlockAutoLayout()
    let vwBottom = UIViewBlock.initUIViewBlockAutoLayout()
    let vwCenter = UIView.initUIViewAutoLayout()
    let btnClose = UIButtonBlock.initUIButtonBlockAutoLayout()
    let lblTitle = UILabel.initUILableAutoLayout()
    let btnDone = UIButtonBlock.initUIButtonBlockAutoLayout()
    let vwHeaderCenter = UIView.initUIViewAutoLayout()
    var layoutContraintsHeightSubView : NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect, superView: UIView, title: String) {
        super.init(frame: frame);
        superView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_BACKGROUND)
        AutoLayoutCommon.setLayoutFullSuperView(self)
        self.backgroundColor = UIColor.clear
        self.vwTop.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.addSubview(vwTop)
        self.vwCenter.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.addSubview(vwCenter)
        self.vwBottom.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.addSubview(vwBottom)
        setupLayout(superView: superView)
        vwHeaderCenter.backgroundColor = UIColor.white
        lblTitle.text = title
        lblTitle.textAlignment = .center
        btnClose.setImage(UIImage.init(named: "iconCloseButton"), for: .normal)
        btnClose.tintColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        btnDone.setTitle("Done", for: .normal)
        btnDone.setTitleColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA), for: .normal)
        self.vwTop.setTouchActionBlock {
            self.closeView()
        }
        self.vwBottom.setTouchActionBlock {
            self.closeView()
        }
        self.btnClose.setTouchActionBlock {
            self.closeView()
        }
    }

    func setupLayout(superView: UIView) {
        layoutContraintsHeightSubView = AutoLayoutCommon.setLayoutHeightConstraintsSuperView(vwCenter, constantValue: 44)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwTop)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwCenter)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwBottom)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwTop(==vwBottom)][vwCenter][vwBottom]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwTop":vwTop,"vwCenter":vwCenter,"vwBottom":vwBottom]))
        
        AddLineBorder.addBottomLine(vwHeaderCenter, color: Constant.COLOR_LINE)
        vwCenter.addSubview(vwHeaderCenter)
        vwHeaderCenter.addSubview(btnDone)
        vwHeaderCenter.addSubview(lblTitle)
        vwHeaderCenter.addSubview(btnClose)
        AutoLayoutCommon.setLayoutFullHeightSuperView(btnClose)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblTitle)
        AutoLayoutCommon.setLayoutFullHeightSuperView(btnDone)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(vwHeaderCenter, kLeft: 20, kRight: 20)
        vwHeaderCenter.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==0@999)-[btnClose(==44)][lblTitle][btnDone]-(==10@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["btnClose":btnClose,"lblTitle":lblTitle,"btnDone":btnDone]))
        
    }
    func closeView() {
        self.removeFromSuperview()
    }
    func reloadData() {
        layoutContraintsHeightSubView.constant = Constant.screenWidth - 20 - 44
    }
}


