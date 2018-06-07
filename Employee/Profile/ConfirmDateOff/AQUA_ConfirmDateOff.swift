//
//  AQUA_ConfirmDateOff.swift
//  Employee
//
//  Created by Thanh Tuan on 4/12/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class AQUA_ConfirmDateOff: Base_BackViewController, Delegate_BaseTableView {

    var tbvConfirmDateOff: TbvConfirmDateOff!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvConfirmDateOff = TbvConfirmDateOff.init(frame: CGRect.zero, superView: self.view)
        tbvConfirmDateOff.delegate_BaseTableView = self
        tbvConfirmDateOff.selectButtonSwipe = {(type,absent) -> () in
            self.postConfirm(type: type, absent: absent)
        }
        AutoLayoutCommon.setLayoutFullSuperView(tbvConfirmDateOff)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getListConfirmDateOff()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func postConfirm (type:String, absent: Model_Absent) {
        switch type {
        case "Confirm":
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
                                                self.postApproved(isConfirm: "1", absentItem: absent)
                                            default :
                                                print("")
                                            }
            })
        case "Denide":
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
                                                self.postApproved(isConfirm: "0", absentItem: absent)
                                            default :
                                                print("")
                                            }
            })
        default:
            print("")
        }
    }
    func postApproved(isConfirm: String,absentItem: Model_Absent?) {
        guard let absentItemValue = absentItem else {
            return
        }
        self.showCircleLoadingInVC()
        let paramApproved = ["id": String(format:"%@",absentItemValue.id),
                             "flat": String(format:"%@",isConfirm),
                             "note": ""] as [String: AnyObject]
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
import MGSwipeTableCell

class TbvConfirmDateOff: Base_TableView, MGSwipeTableCellDelegate {
    
    var selectButtonSwipe: ((String,Model_Absent) -> ())?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect,superView:UIView) {
        super.init(frame: CGRect.zero, style: .plain)
        superView.addSubview(self);
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = UIColor.clear
        self.register(TbvConfirmDateOffCell.self, forCellReuseIdentifier: "TbvConfirmDateOffCell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvConfirmDateOffCell", for: indexPath) as! TbvConfirmDateOffCell
        cell.rightButtons = [MGSwipeButton(title: "",icon: Utilities.imageWithImage(UIImage(named:"iconSuccess"), scaledToSize: CGSize(width: 36, height: 36)), backgroundColor: UIColor.white)
            ,MGSwipeButton(title: "",icon: Utilities.imageWithImage(UIImage(named:"iconDenied"), scaledToSize: CGSize(width: 36, height: 36)), backgroundColor: UIColor.white)]
        cell.rightSwipeSettings.transition = MGSwipeTransition.drag
        cell.delegate = self
        cell.setupData(indexPath, arrData: self.arrDataTbv)
        cell.setupUI()
        return cell
    }
    func swipeTableCell(_ cell: MGSwipeTableCell, tappedButtonAt index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        if(direction == MGSwipeDirection.rightToLeft) {
            guard let arrData = arrDataTbv else {
                return false
            }
            if let indexPath = self.indexPath(for: cell) as IndexPath? {
                if let absent = arrData.object(at: indexPath.row) as? Model_Absent {
                    switch index {
                    case 0:
                        selectButtonSwipe?("Confirm",absent)
                    case 1:
                        selectButtonSwipe?("Denide",absent)
                    default:
                        print("")
                    }
                }
            }
        }
        return true
    }
    
}


class TbvConfirmDateOffCell: MGSwipeTableCell {
    
    let imvAvatar = UIImageView.initUIImageViewAutoLayout()
    let vwInfo = UIView.initUIViewAutoLayout()
    let lblName = UILabel.initUILableAutoLayout()
    let lblId = UILabel.initUILableAutoLayout()
    let lblDate = UILabel.initUILableAutoLayout()
    let lblReason = UILabel.initUILableAutoLayout()
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addControl()
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func addControl() {
        self.contentView.addSubview(imvAvatar)
        self.contentView.addSubview(vwInfo)
        self.vwInfo.addSubview(lblName)
        self.vwInfo.addSubview(lblId)
        self.vwInfo.addSubview(lblDate)
        self.vwInfo.addSubview(lblReason)
        lblReason.numberOfLines = 0
        AddLineBorder.addBottomLine(contentView, color: Constant.COLOR_LINE)
    }
    
    func setupLayout() {
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(imvAvatar)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(imvAvatar)
        AutoLayoutCommon.setLayoutFullHeightSuperView(vwInfo)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[imvAvatar(40)]-20-[vwInfo]-(==10@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvAvatar":imvAvatar,"vwInfo":vwInfo]))
        
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblName)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblId)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblDate)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblReason)
        vwInfo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[lblName][lblId][lblDate][lblReason]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblName":lblName,"lblId":lblId,"lblDate":lblDate,"lblReason":lblReason]))
    }
    func setupUI() {
        AddLineBorder.addBottomLine(self.rightButtons[0], color: Constant.COLOR_LINE)
        AddLineBorder.addBottomLine(self.rightButtons[1], color: Constant.COLOR_LINE)
        AddLineBorder.addLeftLine(self.rightButtons[0], color: Constant.COLOR_LINE)
        AddLineBorder.addLeftLine(self.rightButtons[1], color: Constant.COLOR_LINE)
    }
    func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrData = arrData else {
            return
        }
        if(arrData.count > indexPath.row) {
            if let absentItem = arrData.object(at: indexPath.row) as? Model_Absent {
                self.lblName.text = String(format:"Tên : %@",absentItem.employeeName)
                self.lblId.text = String(format:"Mã nhân viên : %@",absentItem.employeeId)
                self.lblDate.text = String(format:"Ngày làm đơn : %@",absentItem.date)
                self.lblReason.text = String(format:"Lý do : %@",absentItem.reason)
                if(absentItem.avatar == ""){
                    self.imvAvatar.image = Utilities.imageWithImage(UIImage(named:"icon_avatar"), scaledToSize: CGSize(width: 40, height: 40))
                }else{
                    self.imvAvatar.sd_setImage(with: URL(string: String(format: "%@",absentItem.avatar)), placeholderImage:UIImage(named: "icon_avatar"))
                }
                
            }
        }
    }
}
