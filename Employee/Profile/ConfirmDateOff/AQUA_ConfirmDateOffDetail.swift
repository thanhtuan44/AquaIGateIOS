//
//  AQUA_ConfirmDateOffDetail.swift
//  Employee
//
//  Created by Thanh Tuan on 4/12/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import GrowingTextView
import SwiftyJSON

class AQUA_ConfirmDateOffDetail: Base_BackViewWithScrollViewController, GrowingTextViewDelegate {

    let vwContentAvatar = UIView.initUIViewAutoLayout()
    let imvAvatar = UIImageView.initUIImageViewAutoLayout()
    var vwNameEmployee : ViewWithInfo!
    var vwIdOfEmployee : ViewWithInfo!
    var vwBeginDate : ViewWithInfo!
    var vwEndDate : ViewWithInfo!
    var vwBeginTime : ViewWithInfo!
    var vwEndTime : ViewWithInfo!
    var vwReason : ViewWithInfo!
    let lblNote = UILabel.initUILableAutoLayout()
    let txvNote : GrowingTextView = GrowingTextView()
    let btnConfirm = UIButtonBlock.initUIButtonBlockAutoLayout()
    let btnDenied = UIButtonBlock.initUIButtonBlockAutoLayout()
    var absentItem : Model_Absent?
    let vwConfirmButton = UIView.initUIViewAutoLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        addControl()
        setupArrange()
        setupAction()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addControl() {
        guard let absentItemValue = absentItem else {
            return
        }
        self.scvBase.addSubview(vwContentAvatar)
        vwContentAvatar.addSubview(imvAvatar)
        self.vwNameEmployee = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Tên nhân viên")
        self.scvBase.addSubview(vwNameEmployee)
        self.vwIdOfEmployee = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Mã nhân viên")
        self.scvBase.addSubview(vwIdOfEmployee)
        self.vwBeginDate = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Ngày bắt đầu")
        self.scvBase.addSubview(vwBeginDate)
        self.vwEndDate = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Ngày kết thúc")
        self.scvBase.addSubview(vwEndDate)
        self.vwBeginTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Thời gian bắt đầu")
        self.scvBase.addSubview(vwBeginTime)
        self.vwEndTime = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Thời gian kết thúc")
        self.scvBase.addSubview(vwEndTime)
        self.vwReason = ViewWithInfo.init(frame: CGRect.init(), superView: self.scvBase, title: "Lý do")
        self.scvBase.addSubview(vwReason)
        vwNameEmployee.lblValue.text = absentItemValue.employeeName
        vwIdOfEmployee.lblValue.text = absentItemValue.employeeId
        vwBeginDate.lblValue.text = absentItemValue.fromDate
        vwEndDate.lblValue.text = absentItemValue.toDate
        vwBeginTime.lblValue.text = Utilities.convertDateFormater(absentItemValue.fromTime)
        vwEndTime.lblValue.text = Utilities.convertDateFormater(absentItemValue.toTime)
        vwReason.lblValue.text = absentItemValue.reason
        
        btnConfirm.clipsToBounds = true
        btnConfirm.layer.cornerRadius = 4.0
        btnConfirm.setTitleColor(UIColor.white, for: UIControlState())
        btnConfirm.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA)), for: UIControlState())
        btnConfirm.setTitle("ĐỒNG Ý", for: UIControlState())
        btnDenied.clipsToBounds = true
        btnDenied.layer.cornerRadius = 4.0
        btnDenied.setTitleColor(UIColor.white, for: UIControlState())
        btnDenied.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA)), for: UIControlState())
        btnConfirm.setTitle("ĐỒNG Ý", for: UIControlState())
        btnDenied.setTitle("TỪ CHỐI", for: UIControlState())
        lblNote.text = "Ghi chú : "
        self.scvBase.addSubview(lblNote)
        self.txvNote.translatesAutoresizingMaskIntoConstraints = false
        self.txvNote.delegate = self
        self.scvBase.addSubview(self.txvNote)
        txvNote.placeholder = "Ghi chú cho nhân sự"
        txvNote.autocorrectionType = .no
        txvNote.layer.cornerRadius = 4.0
        txvNote.layer.borderWidth = 1
        txvNote.font = UIFont(name: Constant.FONT_APP, size: 16)
        txvNote.layer.borderColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE).cgColor
        txvNote.minHeight = 44
        vwConfirmButton.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_BACKGROUND)
        scvBase.addSubview(vwConfirmButton)
        vwConfirmButton.addSubview(btnConfirm)
        vwConfirmButton.addSubview(btnDenied)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwContentAvatar)
        AutoLayoutCommon.setLayoutHeightApartWidthItSelf(vwContentAvatar, part: 0.4)
        AutoLayoutCommon.setLayoutWidthView(imvAvatar, kWidth: 64)
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(imvAvatar)
        AutoLayoutCommon.setLayoutCenterSuperView(imvAvatar)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwConfirmButton)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblNote, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(txvNote, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(btnConfirm, kTop: 10, kBottom: 10)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(btnDenied, kTop: 10, kBottom: 10)
        vwConfirmButton.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[btnConfirm(==btnDenied)]-10-[btnDenied]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["btnConfirm":btnConfirm,"btnDenied":btnDenied]))
        if(absentItemValue.avatar == ""){
            self.imvAvatar.image = Utilities.imageWithImage(UIImage(named:"icon_avatar"), scaledToSize: CGSize(width: 64, height: 64))
        }else{
            self.imvAvatar.sd_setImage(with: URL(string: String(format: "%@",absentItemValue.avatar)), placeholderImage:UIImage(named: "icon_avatar"))
        }
    }
    func setupArrange() {
        scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwContentAvatar][vwNameEmployee]-5-[vwIdOfEmployee]-5-[vwBeginDate]-5-[vwEndDate]-5-[vwBeginTime]-5-[vwEndTime]-5-[vwReason]-20-[lblNote]-10-[txvNote(>=44)]-20-[vwConfirmButton(==64)]-(>=20)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwContentAvatar":vwContentAvatar,"vwNameEmployee":vwNameEmployee,"vwIdOfEmployee":vwIdOfEmployee,"vwBeginDate":vwBeginDate,"vwEndDate":vwEndDate,"vwBeginTime":vwBeginTime,"vwEndTime":vwEndTime,"vwReason":vwReason,"lblNote":lblNote,"txvNote":txvNote,"vwConfirmButton":vwConfirmButton]))
    }
    func setupAction () {
        self.btnConfirm.setTouchActionBlock {
            UIAlertController.showAlert(in: self,
                                        withTitle: "",
                                        message: "Bạn đồng ý duyệt ngày nghỉ cho nhân viên?",
                                        cancelButtonTitle: "Cancel",
                                        destructiveButtonTitle: "OK",
                                        otherButtonTitles: nil,
                                        tap: {(controller, action, buttonIndex) in
                                            switch buttonIndex {
                                            case controller.cancelButtonIndex:
                                                print("")
                                            case controller.destructiveButtonIndex:
                                                self.postApproved(isConfirm: "1")
                                            default :
                                                print("")
                                            }
            })
        }
        
        
        self.btnDenied.setTouchActionBlock {
            UIAlertController.showAlert(in: self,
                                        withTitle: "",
                                        message: "Bạn từ chối duyệt ngày nghỉ cho nhân viên?",
                                        cancelButtonTitle: "Cancel",
                                        destructiveButtonTitle: "OK",
                                        otherButtonTitles: nil,
                                        tap: {(controller, action, buttonIndex) in
                                            switch buttonIndex {
                                            case controller.cancelButtonIndex:
                                                print("")
                                            case controller.destructiveButtonIndex:
                                                self.postApproved(isConfirm: "0")
                                            default :
                                                print("")
                                            }
            })
        }
    }
    func postApproved(isConfirm: String) {
        guard let absentItemValue = absentItem else {
            return
        }
        self.showCircleLoadingInVC()
        let paramApproved = ["id": String(format:"%@",absentItemValue.id),
                             "flat": String(format:"%@",isConfirm),
                             "note": String(format:"%@",txvNote.text)] as [String: AnyObject]
        let url = String(format: "%@%@", Constant.DOMAIN,API.POST_DATEOFF_APPROVED)
        self.showCircleLoadingInVC()
        AQUA_Request.sharedRequest.postDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: paramApproved) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    print("\(dataResponse)")
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            Utilities.showAlert(viewController: self, message: "Đã gửi đơn xin nghỉ thành công")
                        }else{
                            if let message = dataResponse["message"].string {
                                Utilities.showAlert(viewController: self, message: message)
                            }
                        }
                    }
                }
            }
        }
    }
}
extension AQUA_ConfirmDateOffDetail {
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}
