//
//  AQUA_NonScan.swift
//  Employee
//
//  Created by Thanh Tuan on 4/23/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import GrowingTextView

class AQUA_NonScan: Base_BackViewWithScrollViewController, GrowingTextViewDelegate {
    
    let lblTitle = UILabel.initUILableAutoLayout()
    var vwNameEmployee : ViewWithInfo!
    var vwIdOfEmployee : ViewWithInfo!
    var vwDateNonScan : ViewWithInfo!
    var vwBeginTime : ViewWithInfo!
    var vwEndTime : ViewWithInfo!
    var vwManager : ViewWithInfo!
    let txvNote : GrowingTextView = GrowingTextView()
    let lblNote = UILabel.initUILableAutoLayout()
    let btnRegister = UIButtonBlock.initUIButtonBlockAutoLayout()
    var idManagerSelect = ""
    var dateFromMissingNoScan = ""
    var timeInFromMissingNoScan = ""
    var timeOutFromMissingNoScan = ""
    var layoutContraintsHeightViewTimeIn : NSLayoutConstraint!
    var layoutContraintsHeightViewTimeOut : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addControl()
        setupArrange()
        setupAction()
        self.getProfile()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addControl() {
        self.scvBase.addSubview(lblTitle)
        self.vwNameEmployee = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Nhân viên")
        self.scvBase.addSubview(vwNameEmployee)
        self.vwIdOfEmployee = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Mã nhân viên")
        self.scvBase.addSubview(vwIdOfEmployee)
        self.vwDateNonScan = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Ngày không quẹt thẻ")
        self.scvBase.addSubview(vwDateNonScan)
        self.vwBeginTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Thời gian bắt đầu")
        self.scvBase.addSubview(vwBeginTime)
        self.vwEndTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Thời gian kết thúc")
        self.scvBase.addSubview(vwEndTime)
        self.vwManager = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Người nhận")
        self.scvBase.addSubview(vwManager)
        
        lblTitle.text = "XÁC NHẬN QUẸT THẺ"
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: Constant.FONT_APP, size: 20)
        lblTitle.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        vwNameEmployee.lblValue.text = "Tên nhân viên"
        vwIdOfEmployee.lblValue.text = "Mã nhân viên"
        vwDateNonScan.lblValue.text = Utilities.getDateCalendar(date: Date())
        if(dateFromMissingNoScan == ""){
            vwDateNonScan.lblValue.text = Utilities.getDateCalendar(date: Date())
        }else{
            vwDateNonScan.lblValue.text = dateFromMissingNoScan
        }
        if(timeInFromMissingNoScan == ""){
            vwBeginTime.lblValue.text = "07:30"
            layoutContraintsHeightViewTimeIn = AutoLayoutCommon.setLayoutHeightConstraintsSuperView(vwBeginTime, constantValue: 44)
        }else{
            vwBeginTime.lblValue.text = ""
            layoutContraintsHeightViewTimeIn = AutoLayoutCommon.setLayoutHeightConstraintsSuperView(vwBeginTime, constantValue: 0.1)
        }
        if(timeOutFromMissingNoScan == ""){
            vwEndTime.lblValue.text = "16:10"
            layoutContraintsHeightViewTimeOut = AutoLayoutCommon.setLayoutHeightConstraintsSuperView(vwEndTime, constantValue: 44)
        }else{
            vwEndTime.lblValue.text = ""
            layoutContraintsHeightViewTimeOut = AutoLayoutCommon.setLayoutHeightConstraintsSuperView(vwEndTime, constantValue: 0.1)
        }
        
        vwManager.lblValue.text = "Người nhận"
        self.scvBase.addSubview(btnRegister)
        btnRegister.clipsToBounds = true
        btnRegister.layer.cornerRadius = 4.0
        btnRegister.setTitleColor(UIColor.white, for: UIControlState())
        btnRegister.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA)), for: UIControlState())
        btnRegister.setTitle("XÁC NHẬN QUẸT THẺ", for: UIControlState())
        lblNote.text = "Ghi chú : "
        self.scvBase.addSubview(lblNote)
        self.txvNote.translatesAutoresizingMaskIntoConstraints = false
        self.txvNote.delegate = self
        self.scvBase.addSubview(self.txvNote)
        txvNote.placeholder = "Lý do quên quẹt thẻ"
        txvNote.autocorrectionType = .no
        txvNote.layer.cornerRadius = 4.0
        txvNote.layer.borderWidth = 1
        txvNote.font = UIFont(name: Constant.FONT_APP, size: 16)
        txvNote.layer.borderColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE).cgColor
        txvNote.minHeight = 44
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(btnRegister, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblNote, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(txvNote, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblTitle, kLeft: 10, kRight: 10)
    }
    func setupArrange() {
        scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[lblTitle(==44)]-20-[vwNameEmployee]-5-[vwIdOfEmployee]-5-[vwDateNonScan]-5-[vwBeginTime]-5-[vwEndTime]-5-[vwManager]-20-[lblNote]-10-[txvNote(>=44)]-20-[btnRegister(==44)]-(>=20)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblTitle":lblTitle,"vwNameEmployee":vwNameEmployee,"vwIdOfEmployee":vwIdOfEmployee,"vwDateNonScan":vwDateNonScan,"vwBeginTime":vwBeginTime,"vwEndTime":vwEndTime,"vwManager":vwManager,"lblNote":lblNote,"txvNote":txvNote,"btnRegister":btnRegister]))
    }
    func setupAction () {
        self.vwDateNonScan.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let vwDate = ViewWithMaskCalendar.init(frame: CGRect.zero, superView: window,title: "Ngày không quẹt thẻ")
                vwDate.reloadData()
                vwDate.completionBlock =  {(response) -> Void in
                    self.vwDateNonScan.lblValue.text = String(format: "%@", response)
                }
            }
        }
        self.vwBeginTime.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let vwDate = ViewWithMaskPickerView.init(frame: CGRect.zero, superView: window,title: "Giờ bắt đầu")
                vwDate.reloadData()
                vwDate.completionBlock =  {(response) -> Void in
                    self.vwBeginTime.lblValue.text = String(format: "%@", response)
                }
            }
        }
        self.vwEndTime.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let vwDate = ViewWithMaskPickerView.init(frame: CGRect.zero, superView: window,title: "Giờ kết thúc")
                vwDate.reloadData()
                vwDate.completionBlock =  {(response) -> Void in
                    self.vwEndTime.lblValue.text = String(format: "%@", response)
                }
            }
        }
        self.vwManager.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let vwListManager = ViewListManager.init(frame: CGRect.zero, superView: window, arrData:  NSMutableArray.init(array: []),title: "Người nhận")
                vwListManager.reloadData()
                vwListManager.completionBlock =  {(response) -> Void in
                    self.vwManager.lblValue.text = String(format: "%@", response.value)
                    self.idManagerSelect = String(format:"%@",response.id)
                }
            }
        }
        self.btnRegister.setTouchActionBlock {
            self.postRegisterMissingNonScan()
        }
    }
}
extension AQUA_NonScan {
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
