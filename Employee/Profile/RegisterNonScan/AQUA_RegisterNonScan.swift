//
//  AQUA_RegisterNonScan.swift
//  Employee
//
//  Created by Thanh Tuan on 4/23/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_RegisterNonScan: Base_BackViewController {

    var tbvRegisterNonScan: TbvRegisterNonScan!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbvRegisterNonScan = TbvRegisterNonScan.init(frame: CGRect.zero, superView: self.view)
        AutoLayoutCommon.setLayoutFullSuperView(tbvRegisterNonScan)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getListRegisterNonScan()
    }
}
class TbvRegisterNonScan: Base_TableView {
    
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
        self.register(TbvRegisterNonScanCell.self, forCellReuseIdentifier: "TbvRegisterNonScanCell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvRegisterNonScanCell", for: indexPath) as! TbvRegisterNonScanCell
        cell.setupData(indexPath, arrData: self.arrDataTbv)
        return cell
    }
    
}


class TbvRegisterNonScanCell: Base_TableViewCell {
    
    let imvStatus = UIImageView.initUIImageViewAutoLayout()
    let vwInfo = UIView.initUIViewAutoLayout()
    let lblDateNonScan = UILabel.initUILableAutoLayout()
    let lblTimeBegin = UILabel.initUILableAutoLayout()
    let lblTimeEnd = UILabel.initUILableAutoLayout()
    let lblTotalHour = UILabel.initUILableAutoLayout()
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
        self.vwInfo.addSubview(lblDateNonScan)
        self.vwInfo.addSubview(lblTimeBegin)
        self.vwInfo.addSubview(lblTimeEnd)
        self.vwInfo.addSubview(lblTotalHour)
        self.vwInfo.addSubview(lblReason)
        lblReason.numberOfLines = 0
    }
    
    override func setupLayout() {
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(imvStatus)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(imvStatus)
        AutoLayoutCommon.setLayoutFullHeightSuperView(vwInfo)
        vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[imvStatus(40)]-20-[vwInfo]-(==10@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvStatus":imvStatus,"vwInfo":vwInfo]))
        
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblDateNonScan)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTimeBegin)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTimeEnd)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblTotalHour)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblReason)
        vwInfo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[lblDateNonScan][lblTimeBegin][lblTimeEnd][lblTotalHour][lblReason]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblDateNonScan":lblDateNonScan,"lblTimeBegin":lblTimeBegin,"lblTimeEnd":lblTimeEnd,"lblTotalHour":lblTotalHour,"lblReason":lblReason]))
    }
    
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrData = arrData else {
            return
        }
        if(arrData.count > indexPath.row) {
            if let missingNonScanItem = arrData.object(at: indexPath.row) as? Model_MissingNonScan {
                self.lblDateNonScan.text = String(format:"Ngày tăng ca : %@",missingNonScanItem.date)
                self.lblTimeBegin.text = String(format:"Thời gian bắt đầu : %@",Utilities.convertDateFormater(missingNonScanItem.timeIn))
                self.lblTimeEnd.text = String(format:"Thời gian kết thúc : %@",Utilities.convertDateFormater(missingNonScanItem.timeOut))
                self.lblReason.text = String(format:"Mục đích tăng ca : %@",missingNonScanItem.reason)
                switch missingNonScanItem.statusName {
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

