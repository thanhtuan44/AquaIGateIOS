//
//  AQUA_Annualleave.swift
//  Employee
//
//  Created by Thanh Tuan on 4/17/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_Annualleave: Base_BackViewWithScrollViewController {

    var vwAnnualleaveBefore : ViewAnnualleave!
    var vwAnnualleaveCurrent : ViewAnnualleave!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vwAnnualleaveBefore = ViewAnnualleave.init(frame: CGRect.zero, superView: self.scvBase, title: "",isOpenArrow: false)
        vwAnnualleaveCurrent = ViewAnnualleave.init(frame: CGRect.zero, superView: self.scvBase, title: "",isOpenArrow: true)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwAnnualleaveBefore)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwAnnualleaveCurrent)
        
        getAnnually()
        vwAnnualleaveBefore.btnYear.setTouchActionBlock {
            if(self.vwAnnualleaveBefore.btnYear.isOpen) {
                 UIView.animate(withDuration: 0.2, animations: {
                    self.vwAnnualleaveBefore.layoutContraintsHeighViewAnnualleave.constant = 7*44 + 20
                    self.scvBase.layoutIfNeeded()
                    })
            }else{
                UIView.animate(withDuration: 0.2, animations: {
                    self.vwAnnualleaveBefore.layoutContraintsHeighViewAnnualleave.constant = 44
                    self.scvBase.layoutIfNeeded()
                })
            }
            self.vwAnnualleaveBefore.btnYear.clickOpen()
        }
        vwAnnualleaveCurrent.btnYear.setTouchActionBlock {
            if(self.vwAnnualleaveCurrent.btnYear.isOpen) {
                UIView.animate(withDuration: 0.2, animations: {
                    self.vwAnnualleaveCurrent.layoutContraintsHeighViewAnnualleave.constant = 7*44 + 20
                    self.scvBase.layoutIfNeeded()
                })
                
            }else{
                UIView.animate(withDuration: 0.2, animations: {
                    self.vwAnnualleaveCurrent.layoutContraintsHeighViewAnnualleave.constant = 44
                    self.scvBase.layoutIfNeeded()
                })
                
            }
            self.vwAnnualleaveCurrent.btnYear.clickOpen()
        }
    }
    func showHideTable( _ view:UIView, float:CGFloat) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setupArrangeWithOnlyCurrent() {
        self.scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwAnnualleaveCurrent]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwAnnualleaveCurrent":vwAnnualleaveCurrent]))
    }
    func setupArrange() {
        self.scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwAnnualleaveBefore][vwAnnualleaveCurrent]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwAnnualleaveBefore":vwAnnualleaveBefore,"vwAnnualleaveCurrent":vwAnnualleaveCurrent]))
    }
}


