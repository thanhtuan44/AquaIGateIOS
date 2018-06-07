//
//  AQUA_DateOverTime.swift
//  Employee
//
//  Created by Thanh Tuan on 4/5/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import GrowingTextView

class AQUA_DateOverTime: Base_BackViewWithScrollViewController, GrowingTextViewDelegate {
    
    let lblTitle = UILabel.initUILableAutoLayout()
    var vwNameEmployee : ViewWithInfo!
    var vwIdOfEmployee : ViewWithInfo!
    var vwTypeOfOverTime : ViewWithInfo!
    var vwDateOverTime : ViewWithInfo!
    var vwBeginTime : ViewWithInfo!
    var vwEndTime : ViewWithInfo!
    var vwManager : ViewWithInfo!
    let txvNote : GrowingTextView = GrowingTextView()
    let lblNote = UILabel.initUILableAutoLayout()
    let btnRegister = UIButtonBlock.initUIButtonBlockAutoLayout()
    var idManagerSelect = ""
    var idOverTimeType = ""
    
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
        self.vwTypeOfOverTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Loại tăng ca")
        self.scvBase.addSubview(vwTypeOfOverTime)
        self.vwDateOverTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Ngày tăng ca")
        self.scvBase.addSubview(vwDateOverTime)
        self.vwBeginTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Thời gian bắt đầu")
        self.scvBase.addSubview(vwBeginTime)
        self.vwEndTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Thời gian kết thúc")
        self.scvBase.addSubview(vwEndTime)
        self.vwManager = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Người nhận")
        self.scvBase.addSubview(vwManager)
        lblTitle.text = "ĐĂNG KÝ TĂNG CA"
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: Constant.FONT_APP, size: 20)
        lblTitle.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        vwNameEmployee.lblValue.text = "Tên nhân viên"
        vwIdOfEmployee.lblValue.text = "Mã nhân viên"
        vwTypeOfOverTime.lblValue.text = "Chọn loại tăng ca"
        vwDateOverTime.lblValue.text = Utilities.getDateCalendar(date: Date())
        vwBeginTime.lblValue.text = "07:30"
        vwEndTime.lblValue.text = "16:10"
        vwManager.lblValue.text = "Người nhận"
        self.scvBase.addSubview(btnRegister)
        btnRegister.clipsToBounds = true
        btnRegister.layer.cornerRadius = 4.0
        btnRegister.setTitleColor(UIColor.white, for: UIControlState())
        btnRegister.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA)), for: UIControlState())
        btnRegister.setTitle("ĐĂNG KÝ TĂNG CA", for: UIControlState())
        lblNote.text = "Ghi chú : "
        self.scvBase.addSubview(lblNote)
        self.txvNote.translatesAutoresizingMaskIntoConstraints = false
        self.txvNote.delegate = self
        self.scvBase.addSubview(self.txvNote)
        txvNote.placeholder = "Nhập mục đích tăng ca"
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
        scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[lblTitle(==44)]-20-[vwNameEmployee]-5-[vwIdOfEmployee]-5-[vwTypeOfOverTime]-5-[vwDateOverTime]-5-[vwBeginTime]-5-[vwEndTime]-5-[vwManager]-20-[lblNote]-10-[txvNote(>=44)]-20-[btnRegister(==44)]-(>=20)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblTitle":lblTitle,"vwNameEmployee":vwNameEmployee,"vwIdOfEmployee":vwIdOfEmployee,"vwTypeOfOverTime":vwTypeOfOverTime,"vwDateOverTime":vwDateOverTime,"vwBeginTime":vwBeginTime,"vwEndTime":vwEndTime,"vwManager":vwManager,"lblNote":lblNote,"txvNote":txvNote,"btnRegister":btnRegister]))
    }
    func setupAction () {
        self.vwTypeOfOverTime.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let arrData = [IdValueObject.init(id: "1", value: "Day-shift of normal day"),IdValueObject.init(id: "2", value: "Night-shift of normal day"),IdValueObject.init(id: "3", value: "Overtime with compensated day"),IdValueObject.init(id: "4", value: "Day-shift of holiday"),IdValueObject.init(id: "5", value: "Night-shift of holiday")]
                let vwType = ViewWithMaskTableView.init(frame: CGRect.zero, superView: window, arrData:  NSMutableArray.init(array: arrData),title: "Loại tăng ca")
                vwType.reloadData()
                vwType.completionBlock =  {(response) -> Void in
                    self.vwTypeOfOverTime.lblValue.text = String(format: "%@", response.value)
                    self.idOverTimeType = String(format:"%@",response.id)
                }
            }
        }
        self.vwDateOverTime.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let vwDate = ViewWithMaskCalendar.init(frame: CGRect.zero, superView: window,title: "Ngày tăng ca")
                vwDate.reloadData()
                vwDate.completionBlock =  {(response) -> Void in
                    self.vwDateOverTime.lblValue.text = String(format: "%@", response)
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
            self.postRegisterOvertime()
        }
    }
}
extension AQUA_DateOverTime {
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
