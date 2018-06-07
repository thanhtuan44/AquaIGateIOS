//
//  AQUA_ResigterOverTime.swift
//  Employee
//
//  Created by Thanh Tuan on 4/12/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_RegisterOverTime: Base_BackViewController {

    var tbvRegisterOvertime: TbvRegisterOvertime!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvRegisterOvertime = TbvRegisterOvertime.init(frame: CGRect.zero, superView: self.view)
        AutoLayoutCommon.setLayoutFullSuperView(tbvRegisterOvertime)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getListRegisterOvertime()
    }
}
class TbvRegisterOvertime: Base_TableView {
    
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
        self.register(TbvRegisterOvertimeCell.self, forCellReuseIdentifier: "TbvRegisterOvertimeCell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvRegisterOvertimeCell", for: indexPath) as! TbvRegisterOvertimeCell
        cell.setupData(indexPath, arrData: self.arrDataTbv)
        return cell
    }
    
}


class TbvRegisterOvertimeCell: Base_TableViewCell {
    
    let imvStatus = UIImageView.initUIImageViewAutoLayout()
    let vwInfo = UIView.initUIViewAutoLayout()
    let lblDateOvertime = UILabel.initUILableAutoLayout()
    let lblTimeBegin = UILabel.initUILableAutoLayout()
    let lblTimeEnd = UILabel.initUILableAutoLayout()
    let lblTotalHour = UILabel.initUILableAutoLayout()
    let lblType = UILabel.initUILableAutoLayout()
    let lblPurpose = UILabel.initUILableAutoLayout()
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
        self.vwInfo.addSubview(lblDateOvertime)
        self.vwInfo.addSubview(lblTimeBegin)
        self.vwInfo.addSubview(lblTimeEnd)
        self.vwInfo.addSubview(lblTotalHour)
        self.vwInfo.addSubview(lblType)
        self.vwInfo.addSubview(lblPurpose)
        lblPurpose.numberOfLines = 0
    }
    
    override func setupLayout() {
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(imvStatus)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(imvStatus)
        AutoLayoutCommon.setLayoutFullHeightSuperView(vwInfo)
        vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[imvStatus(40)]-20-[vwInfo]-(==10@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvStatus":imvStatus,"vwInfo":vwInfo]))
        
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblDateOvertime)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTimeBegin)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTimeEnd)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTotalHour)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblType)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblPurpose)
        vwInfo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[lblDateOvertime][lblTimeBegin][lblTimeEnd][lblTotalHour][lblType][lblPurpose]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblDateOvertime":lblDateOvertime,"lblTimeBegin":lblTimeBegin,"lblTimeEnd":lblTimeEnd,"lblTotalHour":lblTotalHour,"lblType":lblType,"lblPurpose":lblPurpose]))
    }
    
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrData = arrData else {
            return
        }
        if(arrData.count > indexPath.row) {
            if let overtimeItem = arrData.object(at: indexPath.row) as? Model_Overtime {
                self.lblDateOvertime.text = String(format:"Ngày tăng ca : %@",overtimeItem.overtimeDate)
                self.lblTimeBegin.text = String(format:"Thời gian bắt đầu : %@",Utilities.convertDateFormater(overtimeItem.frmTime))
                self.lblTimeEnd.text = String(format:"Thời gian kết thúc : %@",Utilities.convertDateFormater(overtimeItem.toTime))
                self.lblTotalHour.text = String(format:"Thời gian tăng ca : %@",Utilities.convertDateFormater(overtimeItem.frmTime))
                self.lblType.text = String(format:"Loại tăng ca : %@",overtimeItem.purpose)
                self.lblPurpose.text = String(format:"Mục đích tăng ca : %@",overtimeItem.purpose)
                switch overtimeItem.status {
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
