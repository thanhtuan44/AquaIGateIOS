//
//  ViewConfirm.swift
//  Employee
//
//  Created by Thanh Tuan on 4/23/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ViewConfirm: UIView {

    var vwInfoTransaction : ViewWithText!
    var btnConfirmDateOff : ButtonWithArrow!
    var btnConfirmOvertime : ButtonWithArrow!
    var btnConfirmNonScan : ButtonWithArrow!
    var layoutContraintsHeightViewConfirm : [NSLayoutConstraint]?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect, superView: UIView) {
        super.init(frame: frame);
        superView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_BACKGROUND)
        addControl()
        setupLayout()
    }
    func addControl() {
        vwInfoTransaction = ViewWithText.init(frame: CGRect.zero, superView: self, string: "Xét duyệt")
        self.addSubview(vwInfoTransaction)
        btnConfirmDateOff = ButtonWithArrow.init(frame: CGRect.zero, superView: self, string: "Xét duyệt nghỉ phép")
        self.addSubview(btnConfirmDateOff)
        btnConfirmOvertime = ButtonWithArrow.init(frame: CGRect.zero, superView: self, string: "Xét duyệt tăng ca")
        self.addSubview(btnConfirmOvertime)
        btnConfirmNonScan = ButtonWithArrow.init(frame: CGRect.zero, superView: self, string: "Xét duyệt quên quẹt thẻ")
        self.addSubview(btnConfirmNonScan)
        vwInfoTransaction.isHidden = true
        btnConfirmDateOff.isHidden = true
        btnConfirmOvertime.isHidden = true
        btnConfirmNonScan.isHidden = true
        
    }
    func setupLayout() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(self)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwInfoTransaction)
        
    }
    func reloadDataManager() {
        vwInfoTransaction.isHidden = false
        btnConfirmDateOff.isHidden = false
        btnConfirmOvertime.isHidden = false
        btnConfirmNonScan.isHidden = false
        AddLineBorder.addBottomLine(self.btnConfirmDateOff, color: Constant.COLOR_LINE)
        AddLineBorder.addBottomLine(self.btnConfirmOvertime, color: Constant.COLOR_LINE)
        if(layoutContraintsHeightViewConfirm != nil) {
            self.removeConstraints(layoutContraintsHeightViewConfirm!)
        }
        layoutContraintsHeightViewConfirm =  NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwInfoTransaction(==50)][btnConfirmDateOff(==44)][btnConfirmOvertime(==44)][btnConfirmNonScan(==44)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwInfoTransaction":vwInfoTransaction,"btnConfirmDateOff":btnConfirmDateOff,"btnConfirmOvertime":btnConfirmOvertime,"btnConfirmNonScan":btnConfirmNonScan])
        self.addConstraints(layoutContraintsHeightViewConfirm!)
    }
    func reloadUser() {
        vwInfoTransaction.isHidden = true
        btnConfirmDateOff.isHidden = true
        btnConfirmOvertime.isHidden = true
        btnConfirmNonScan.isHidden = true
        if(layoutContraintsHeightViewConfirm != nil) {
            self.removeConstraints(layoutContraintsHeightViewConfirm!)
        }
        layoutContraintsHeightViewConfirm =  NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwInfoTransaction(==0)][btnConfirmDateOff(==0)][btnConfirmOvertime(==0)][btnConfirmNonScan(==0)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwInfoTransaction":vwInfoTransaction,"btnConfirmDateOff":btnConfirmDateOff,"btnConfirmOvertime":btnConfirmOvertime,"btnConfirmNonScan":btnConfirmNonScan])
        self.addConstraints(layoutContraintsHeightViewConfirm!)
    }
}

