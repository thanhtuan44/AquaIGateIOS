//
//  AQUA_RegisterDateOff.swift
//  Employee
//
//  Created by Thanh Tuan on 4/10/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_RegisterDateOff: Base_BackViewController {

    var tbvRegisterDateOff: TbvRegisterDateOff!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvRegisterDateOff = TbvRegisterDateOff.init(frame: CGRect.zero, superView: self.view)
        AutoLayoutCommon.setLayoutFullSuperView(tbvRegisterDateOff)
        self.getListRegisterDateOff()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
class TbvRegisterDateOff: Base_TableView {
    
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
        self.register(TbvRegisterDateOffCell.self, forCellReuseIdentifier: "TbvRegisterDateOffCell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvRegisterDateOffCell", for: indexPath) as! TbvRegisterDateOffCell
        cell.setupData(indexPath, arrData: self.arrDataTbv)
        return cell
    }
    
}


class TbvRegisterDateOffCell: Base_TableViewCell {
    
    let imvStatus = UIImageView.initUIImageViewAutoLayout()
    let vwInfo = UIView.initUIViewAutoLayout()
    let lblDateBegin = UILabel.initUILableAutoLayout()
    let lblDateEnd = UILabel.initUILableAutoLayout()
    let lblTimeBegin = UILabel.initUILableAutoLayout()
    let lblTimeEnd = UILabel.initUILableAutoLayout()
    let lblTotalDay = UILabel.initUILableAutoLayout()
    let lblReason = UILabel.initUILableAutoLayout()
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func addControl() {
        self.vwContentCell.addSubview(imvStatus)
        self.vwContentCell.addSubview(vwInfo)
        self.vwInfo.addSubview(lblDateBegin)
        self.vwInfo.addSubview(lblDateEnd)
        self.vwInfo.addSubview(lblTimeBegin)
        self.vwInfo.addSubview(lblTimeEnd)
        self.vwInfo.addSubview(lblTotalDay)
        self.vwInfo.addSubview(lblReason)
        lblReason.numberOfLines = 0
    }
    
    override func setupLayout() {
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(imvStatus)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(imvStatus)
        AutoLayoutCommon.setLayoutFullHeightSuperView(vwInfo)
        vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[imvStatus(40)]-20-[vwInfo]-(==10@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvStatus":imvStatus,"vwInfo":vwInfo]))
        
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblDateBegin)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblDateEnd)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTimeBegin)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTimeEnd)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTotalDay)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblReason)
        vwInfo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[lblDateBegin][lblDateEnd][lblTimeBegin][lblTimeEnd][lblTotalDay][lblReason]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblDateBegin":lblDateBegin,"lblDateEnd":lblDateEnd,"lblTimeBegin":lblTimeBegin,"lblTimeEnd":lblTimeEnd,"lblTotalDay":lblTotalDay,"lblReason":lblReason]))
    }
    
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrData = arrData else {
            return
        }
        if(arrData.count > indexPath.row) {
            if let absentItem = arrData.object(at: indexPath.row) as? Model_Absent {
                self.lblDateBegin.text = String(format:"Từ ngày : %@",absentItem.fromDate)
                self.lblDateEnd.text = String(format:"Đến ngày : %@",absentItem.toDate)
                self.lblTimeBegin.text = String(format:"Thời gian bắt đầu : %@",Utilities.convertDateFormater(absentItem.fromTime))
                self.lblTimeEnd.text = String(format:"Thời gian kết thúc : %@",Utilities.convertDateFormater(absentItem.toTime))
                self.lblTotalDay.text = String(format:"Số ngày : %@",absentItem.totalAbsentDays)
                self.lblReason.text = String(format:"Lý do : %@",absentItem.reason)
                switch absentItem.status {
                case "Tạo mới":
                    self.imvStatus.image = Utilities.imageWithImage(UIImage(named:"iconPending"), scaledToSize: CGSize(width: 40, height: 40))
                case "Chờ duyệt":
                    self.imvStatus.image = Utilities.imageWithImage(UIImage(named:"iconPending"), scaledToSize: CGSize(width: 40, height: 40))
                case "Đã duyệt":
                    self.imvStatus.image = Utilities.imageWithImage(UIImage(named:"iconSuccess"), scaledToSize: CGSize(width: 40, height: 40))
                case "Từ chối":
                    self.imvStatus.image = Utilities.imageWithImage(UIImage(named:"iconDenied"), scaledToSize: CGSize(width: 40, height: 40))
                default:
                    self.imvStatus.image = Utilities.imageWithImage(UIImage(named:"iconPending"), scaledToSize: CGSize(width: 40, height: 40))
                }
            }
        }
    }
}
