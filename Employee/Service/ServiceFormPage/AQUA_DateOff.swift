//
//  AQUA_DateOff.swift
//  Employee
//
//  Created by Thanh Tuan on 3/15/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import GrowingTextView

class AQUA_DateOff: Base_BackViewWithScrollViewController, GrowingTextViewDelegate {

    let lblTitle = UILabel.initUILableAutoLayout()
    var vwNameEmployee : ViewWithInfo!
    var vwIdOfEmployee : ViewWithInfo!
    var vwTypeOfEmployee : ViewWithInfo!
    var vwReason : ViewWithInfo!
    var vwBeginDate : ViewWithInfo!
    var vwEndDate : ViewWithInfo!
    var vwBeginTime : ViewWithInfo!
    var vwEndTime : ViewWithInfo!
    var vwManager : ViewWithInfo!
    let txvNote : GrowingTextView = GrowingTextView()
    let lblNote = UILabel.initUILableAutoLayout()
    let btnRegister = UIButtonBlock.initUIButtonBlockAutoLayout()
    var idManagerSelect = ""
    var idEmployeeType = ""
    var idReasonType = ""
    var dateFromMissingNoScan = ""
    
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
        self.vwTypeOfEmployee = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Loại nhân viên")
        self.scvBase.addSubview(vwTypeOfEmployee)
        self.vwReason = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Lý do nghỉ")
        self.scvBase.addSubview(vwReason)
        self.vwBeginDate = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Ngày bắt đầu")
        self.scvBase.addSubview(vwBeginDate)
        self.vwEndDate = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Ngày kết thúc")
        self.scvBase.addSubview(vwEndDate)
        self.vwBeginTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Thời gian bắt đầu")
        self.scvBase.addSubview(vwBeginTime)
        self.vwEndTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Thời gian kết thúc")
        self.scvBase.addSubview(vwEndTime)
        self.vwManager = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Người nhận")
        self.scvBase.addSubview(vwManager)
        lblTitle.text = "ĐĂNG KÝ NGHỈ PHÉP"
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: Constant.FONT_APP, size: 20)
        lblTitle.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        vwNameEmployee.lblValue.text = "Tên nhân viên"
        vwIdOfEmployee.lblValue.text = "Mã nhân viên"
        vwTypeOfEmployee.lblValue.text = "Chọn loại nhân viên"
        vwReason.lblValue.text = "Chọn lý do nghỉ"
        vwManager.lblValue.text = "Người nhận"
        vwBeginDate.lblValue.text = Utilities.getDateCalendar(date: Date())
        vwEndDate.lblValue.text = Utilities.getDateCalendar(date: Date())
        vwBeginTime.lblValue.text = "07:30"
        vwEndTime.lblValue.text = "16:10"
        if(dateFromMissingNoScan == ""){
            vwBeginDate.lblValue.text = Utilities.getDateCalendar(date: Date())
            vwEndDate.lblValue.text = Utilities.getDateCalendar(date: Date())
        }else{
            vwBeginDate.lblValue.text = dateFromMissingNoScan
            vwEndDate.lblValue.text = dateFromMissingNoScan
        }
        
        self.scvBase.addSubview(btnRegister)
        btnRegister.clipsToBounds = true
        btnRegister.layer.cornerRadius = 4.0
        btnRegister.setTitleColor(UIColor.white, for: UIControlState())
        btnRegister.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA)), for: UIControlState())
        btnRegister.setTitle("ĐĂNG KÝ NGHỈ PHÉP", for: UIControlState())
        lblNote.text = "Ghi chú : "
        self.scvBase.addSubview(lblNote)
        self.txvNote.translatesAutoresizingMaskIntoConstraints = false
        self.txvNote.delegate = self
        self.scvBase.addSubview(self.txvNote)
        txvNote.placeholder = "Nhập ghi chú"
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
        scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[lblTitle(==44)]-20-[vwNameEmployee]-5-[vwIdOfEmployee]-5-[vwTypeOfEmployee]-5-[vwReason]-5-[vwBeginDate]-5-[vwEndDate]-5-[vwBeginTime]-5-[vwEndTime]-5-[vwManager]-20-[lblNote]-10-[txvNote(>=44)]-20-[btnRegister(==44)]-(>=20)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblTitle":lblTitle,"vwNameEmployee":vwNameEmployee,"vwIdOfEmployee":vwIdOfEmployee,"vwTypeOfEmployee":vwTypeOfEmployee,"vwReason":vwReason,"vwBeginDate":vwBeginDate,"vwEndDate":vwEndDate,"vwBeginTime":vwBeginTime,"vwEndTime":vwEndTime,"vwManager":vwManager,"lblNote":lblNote,"txvNote":txvNote,"btnRegister":btnRegister]))
    }
    func setupAction () {
        self.vwTypeOfEmployee.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let arrData = [IdValueObject.init(id: "1", value: "Nhân viên chính thức"),IdValueObject.init(id: "2", value: "Nhân viên thử việc")]
                let vwType = ViewWithMaskTableView.init(frame: CGRect.zero, superView: window, arrData:  NSMutableArray.init(array: arrData),title: "Loại nhân viên")
                vwType.reloadData()
                vwType.completionBlock =  {(response) -> Void in
                    self.vwTypeOfEmployee.lblValue.text = String(format: "%@", response.value)
                    self.idEmployeeType = String(format:"%@",response.id)
                }
            }
        }
        self.vwReason.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let arrData = [IdValueObject.init(id: "1", value: "Vắng không phép"),IdValueObject.init(id: "2", value: "Nghỉ bù"),IdValueObject.init(id: "3", value: "Nghỉ chuẩn bị đổi việc"),IdValueObject.init(id: "4", value: "Nghỉ do tai nạn lao động"),IdValueObject.init(id: "5", value: "Nghỉ khám thai, hộ sản"),IdValueObject.init(id: "6", value: "Nghỉ bệnh (Có giấy hưởng BHXH)"),IdValueObject.init(id: "7", value: "Nghỉ bệnh (Không có giấy hưởng BHXH)"),IdValueObject.init(id: "8", value: "Nghỉ việc riêng không lương"),IdValueObject.init(id: "9", value: "Nghỉ bệnh quá thời hạn quy định"),IdValueObject.init(id: "10", value: "Nghỉ việc riêng có lương (kết hôn, ma chay,...)"),IdValueObject.init(id: "11", value: "Nghỉ phép"),IdValueObject.init(id: "12", value: "Lý do khác")]
                let vwReason = ViewWithMaskTableView.init(frame: CGRect.zero, superView: window, arrData: NSMutableArray.init(array: arrData),title: "Lý do nghỉ")
                vwReason.reloadData()
                vwReason.completionBlock =  {(response) -> Void in
                    self.vwReason.lblValue.text = String(format: "%@", response.value)
                    self.idReasonType = String(format:"%@",response.id)
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

        self.vwBeginDate.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let vwDate = ViewWithMaskCalendar.init(frame: CGRect.zero, superView: window,title: "Ngày bắt đầu")
                vwDate.reloadData()
                vwDate.completionBlock =  {(response) -> Void in
                    self.vwBeginDate.lblValue.text = String(format: "%@", response)
                    self.vwEndDate.lblValue.text = String(format: "%@", response)
                }
            }
        }
        self.vwEndDate.setTouchActionBlock {
            if let window = Constant.Aqua_AppDelegate?.window {
                let vwDate = ViewWithMaskCalendar.init(frame: CGRect.zero, superView: window,title: "Ngày kết thúc")
                vwDate.reloadData()
                vwDate.completionBlock =  {(response) -> Void in
                    self.vwEndDate.lblValue.text = String(format: "%@", response)
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
        self.btnRegister.setTouchActionBlock {
            self.postRegisterDateOff()
        }
    }
}
extension AQUA_DateOff {
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
