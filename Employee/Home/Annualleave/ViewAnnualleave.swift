//
//  ViewAnnualleave.swift
//  Employee
//
//  Created by Thanh Tuan on 4/17/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ViewAnnualleave: UIView {
    var btnYear : ButtonWithArrow!
    var tbvAnnualleave : TbvAnnualleave!
    var layoutContraintsHeighViewAnnualleave : NSLayoutConstraint!
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect,superView : UIView,title: String?,isOpenArrow: Bool) {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        superView.addSubview(self)
        addControl(superView, title: title,isOpenArrow: isOpenArrow)
        setupLayout(superView)
        self.clipsToBounds = true
    }
    func addControl(_ superView:UIView,title: String?,isOpenArrow: Bool) {
        btnYear = ButtonWithArrow.init(frame: CGRect.zero, superView: self, string: title, isOpenArrow: isOpenArrow)
        btnYear.label.font = UIFont(name: Constant.FONT_APP, size: 18)
        btnYear.label.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        btnYear.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_BACKGROUND)
        AddLineBorder.addBottomLine(btnYear, color: Constant.COLOR_LINE)
        self.addSubview(btnYear)
        tbvAnnualleave = TbvAnnualleave.init(frame: CGRect.zero, superView: self)
        layoutContraintsHeighViewAnnualleave = AutoLayoutCommon.setLayoutHeightConstraintsSuperView(self, constantValue: 6*44 + 44)
    }
    func setupLayout(_ superView:UIView) {
        AutoLayoutCommon.setLayoutFullWidthSuperView(tbvAnnualleave)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[btnYear(==44)][tbvAnnualleave]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["btnYear":btnYear,"tbvAnnualleave":tbvAnnualleave]))
    }
    func reloadData() {
        self.tbvAnnualleave.reloadData()
        print(tbvAnnualleave.contentSize.height)
        layoutContraintsHeighViewAnnualleave.constant = 7*44 + 20
    }
}
class TbvAnnualleave: Base_TableView {
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
        self.register(TbvAnnualleaveCell.self, forCellReuseIdentifier: "TbvAnnualleaveCell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
        self.isScrollEnabled = false
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvAnnualleaveCell", for: indexPath) as! TbvAnnualleaveCell
        cell.setupData(indexPath, arrData: self.arrDataTbv)
        return cell
    }
}

class TbvAnnualleaveCell: Base_TableViewCell {
    let vwContentInfo = UIView.initUIViewAutoLayout()
    
    let vwTotalEntitlement = UIView.initUIViewAutoLayout()
    let lblTotalEntitlement = UILabel.initUILableAutoLayout()
    let lblTotalEntitlementValue = UILabel.initUILableAutoLayout()
    
    let vwAdditionalEarned = UIView.initUIViewAutoLayout()
    let lblAdditionalEarned = UILabel.initUILableAutoLayout()
    let lblAdditionalEarnedValue = UILabel.initUILableAutoLayout()
    
    let vwLastYear = UIView.initUIViewAutoLayout()
    let lblLastYear = UILabel.initUILableAutoLayout()
    let lblLastYearValue = UILabel.initUILableAutoLayout()
    
    let vwEarnedLeave = UIView.initUIViewAutoLayout()
    let lblEarnedLeave  = UILabel.initUILableAutoLayout()
    let lblEarnedLeaveValue  = UILabel.initUILableAutoLayout()
    
    let vwLeaveTaken = UIView.initUIViewAutoLayout()
    let lblLeaveTaken = UILabel.initUILableAutoLayout()
    let lblLeaveTakenValue = UILabel.initUILableAutoLayout()
    
    let vwTotalSickLeave = UIView.initUIViewAutoLayout()
    let lblTotalSickLeave = UILabel.initUILableAutoLayout()
    let lblTotalSickLeaveValue = UILabel.initUILableAutoLayout()
    
    let vwBalance = UIView.initUIViewAutoLayout()
    let lblBalance = UILabel.initUILableAutoLayout()
    let lblBalanceValue = UILabel.initUILableAutoLayout()
    
    
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
        contentView.addSubview(vwContentInfo)
        vwContentInfo.addSubview(vwTotalEntitlement)
        vwContentInfo.addSubview(vwAdditionalEarned)
        vwContentInfo.addSubview(vwLastYear)
        vwContentInfo.addSubview(vwEarnedLeave)
        vwContentInfo.addSubview(vwLeaveTaken)
        vwContentInfo.addSubview(vwTotalSickLeave)
        vwContentInfo.addSubview(vwBalance)
        
    }
    
    override func setupLayout() {
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(vwContentInfo, kLeft: 10, kRight: 10)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[vwContentInfo]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwContentInfo":vwContentInfo]))
        self.setupLayoutSubView(superView: vwTotalEntitlement, lblInfo: lblTotalEntitlement, lblValue: lblTotalEntitlementValue)
        self.setupLayoutSubView(superView: vwAdditionalEarned, lblInfo: lblAdditionalEarned, lblValue: lblAdditionalEarnedValue)
        self.setupLayoutSubView(superView: vwLastYear, lblInfo: lblLastYear, lblValue: lblLastYearValue)
        self.setupLayoutSubView(superView: vwEarnedLeave, lblInfo: lblEarnedLeave, lblValue: lblEarnedLeaveValue)
        self.setupLayoutSubView(superView: vwLeaveTaken, lblInfo: lblLeaveTaken, lblValue: lblLeaveTakenValue)
        self.setupLayoutSubView(superView: vwBalance, lblInfo: lblBalance, lblValue: lblBalanceValue)
        vwContentInfo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwTotalEntitlement(==44)][vwAdditionalEarned(==vwTotalEntitlement)][vwLastYear(==vwTotalEntitlement)][vwEarnedLeave(==vwTotalEntitlement)][vwLeaveTaken(==vwTotalEntitlement)][vwBalance(==vwTotalEntitlement)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwTotalEntitlement":vwTotalEntitlement,"vwAdditionalEarned":vwAdditionalEarned,"vwLastYear":vwLastYear,"vwEarnedLeave":vwEarnedLeave,"vwLeaveTaken":vwLeaveTaken,"vwBalance":vwBalance]))
        
    }
    func setupLayoutSubView(superView: UIView, lblInfo: UILabel, lblValue: UILabel) {
        AutoLayoutCommon.setLayoutFullWidthSuperView(superView)
        superView.addSubview(lblInfo)
        superView.addSubview(lblValue)
        lblValue.textAlignment = .right
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblInfo)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblValue)
        superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==10@999)-[lblInfo][lblValue]-(==0@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblInfo":lblInfo,"lblValue":lblValue]))
    }
    
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrData = arrData else {
            return
        }
        if let annualleaveItem = arrData.object(at: indexPath.row) as? Model_Annualleave {
            self.lblTotalEntitlement.text = String(format:"Tổng ngày phép trong năm:")
            self.lblAdditionalEarned.text = String(format:"Ngày phép thêm:")
            self.lblLastYear.text = String(format:"Năm trước:")
            self.lblEarnedLeave.text = String(format:"Ngày phép trong năm hiện có:")
            self.lblLeaveTaken.text = String(format:"Ngày phép trong năm hiện có")
            self.lblBalance.text = String(format:"Ngày phép còn lại trong năm:")
            self.lblTotalEntitlementValue.text = String(format:"%@",annualleaveItem.totalEntitlement)
            self.lblAdditionalEarnedValue.text = String(format:"%@",annualleaveItem.additionalEarn)
            self.lblLastYearValue.text = String(format:"%@",annualleaveItem.lastYear)
            self.lblEarnedLeaveValue.text = String(format:"%@",annualleaveItem.earnedLeave)
            self.lblLeaveTakenValue.text = String(format:"%@",annualleaveItem.leaveTaken)
            self.lblBalanceValue.text = String(format:"%@",annualleaveItem.balance)
        }
    }
    
}
