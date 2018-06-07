//
//  TbvWorkDate.swift
//  Employee
//
//  Created by Thanh Tuan on 3/14/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class TbvWorkDate: Base_TableView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect,superView:UIView) {
        super.init(frame: CGRect.zero, style: .grouped)
        superView.addSubview(self);
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = UIColor.clear
        self.register(TbvWorkDateCell.self, forCellReuseIdentifier: "TbvWorkDateCell")
        self.register(TbvWorkDate_Header.self, forHeaderFooterViewReuseIdentifier: "TbvWorkDate_Header")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
        self.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TbvWorkDate_Header") as! TbvWorkDate_Header
        return header;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvWorkDateCell", for: indexPath) as! TbvWorkDateCell
        cell.setupData(indexPath, arrData: self.arrDataTbv)
        cell.setupUI(indexPath, arrData: self.arrDataTbv)
        return cell
    }
    
}


class TbvWorkDateCell: Base_TableViewCell {
    
    let lblDate = UILabel.initUILableAutoLayout()
    let line1 = UIView.initUIViewAutoLayout()
    let lblIn = UILabel.initUILableAutoLayout()
    let line2 = UIView.initUIViewAutoLayout()
    let lblOut = UILabel.initUILableAutoLayout()
    let line3 = UIView.initUIViewAutoLayout()
    let lblType = UILabel.initUILableAutoLayout()
    
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
        lblDate.textAlignment = .left
        lblIn.textAlignment = .center
        lblOut.textAlignment = .center
        lblType.textAlignment = .center
        self.vwContentCell.addSubview(lblDate)
        self.vwContentCell.addSubview(line1)
        self.vwContentCell.addSubview(lblIn)
        self.vwContentCell.addSubview(line2)
        self.vwContentCell.addSubview(lblOut)
        self.vwContentCell.addSubview(line3)
        self.vwContentCell.addSubview(lblType)
        line1.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        line2.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        line3.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        line.backgroundColor = UIColor.clear
    }
    
    override func setupLayout() {
        AutoLayoutCommon.setLayoutHeightView(vwContentCell, kHeight: 54)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblDate)
        AutoLayoutCommon.setLayoutFullHeightSuperView(line1)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblIn)
        AutoLayoutCommon.setLayoutFullHeightSuperView(line2)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblOut)
        AutoLayoutCommon.setLayoutFullHeightSuperView(line3)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblType)
        self.vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==20@999)-[lblDate][line1(==1)][lblIn(==64)][line2(==line1)][lblOut(==lblIn)][line3(==line1)][lblType(==lblIn)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblDate": lblDate,"line1":line1,"lblIn":lblIn,"line2":line2,"lblOut":lblOut,"line3":line3,"lblType":lblType]))
    }
    
    func setupLayoutViewInfo() {
        
    }
    
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrWorkDate = arrData else {
            return
        }
        if let workdateItem = arrWorkDate.object(at: indexPath.row) as? Model_WorkTimeDaily {
            self.lblDate.text = workdateItem.workDate
            self.lblIn.text = Utilities.convertDateFormater(workdateItem.timeIn.replacingOccurrences(of: workdateItem.workDate, with: "", options: NSString.CompareOptions.literal, range: nil))
            self.lblOut.text = Utilities.convertDateFormater(workdateItem.timeOut.replacingOccurrences(of: workdateItem.workDate, with: "", options: NSString.CompareOptions.literal, range: nil))
            self.lblType.text = workdateItem.shift
        }
    }
    override func setupUI(_ indexPath: IndexPath, arrData: NSMutableArray?) {
//        guard let arrWorkDate = arrData else {
//            return
//        }
        if(indexPath.row % 2 == 0){
            self.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA).withAlphaComponent(0.2)
            
        }else {
            self.backgroundColor = UIColor.white
        }
        
    }
    
//    func compareDateFormater(_ date: String,date2: String) -> Bool{
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
//        let dateA = dateFormatter.date(from: date)
//        let dateB = dateFormatter.date(from: date2)
//        if(dateA?.compare(dateB!) == ComparisonResult.orderedAscending) {
//            return true
//        }else{
//            return false
//        }
//    }
}

class TbvWorkDate_Header: UITableViewHeaderFooterView {

    let vwContent = UIView.initUIViewAutoLayout()
    let lblDate = UILabel.initUILableAutoLayout()
    let line1 = UIView.initUIViewAutoLayout()
    let lblIn = UILabel.initUILableAutoLayout()
    let line2 = UIView.initUIViewAutoLayout()
    let lblOut = UILabel.initUILableAutoLayout()
    let line3 = UIView.initUIViewAutoLayout()
    let lblType = UILabel.initUILableAutoLayout()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        addControl()
        setupLayout()
    }
    
    func addControl() {
        lblDate.text = "Date"
        lblOut.text = "Time Out"
        lblIn.text = "Time In"
        lblType.text = "Type"
        lblOut.numberOfLines = 0
        lblIn.numberOfLines = 0
        lblDate.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        lblIn.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        lblOut.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        lblType.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        line1.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        line2.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        line3.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        
        lblDate.textAlignment = .left
        lblIn.textAlignment = .center
        lblOut.textAlignment = .center
        lblType.textAlignment = .center
        self.contentView.addSubview(vwContent)
        self.vwContent.addSubview(lblDate)
        self.vwContent.addSubview(line1)
        self.vwContent.addSubview(lblIn)
        self.vwContent.addSubview(line2)
        self.vwContent.addSubview(lblOut)
        self.vwContent.addSubview(line3)
        self.vwContent.addSubview(lblType)
        AddLineBorder.addBottomLine(vwContent, color: Constant.COLOR_AQUA, kWidth: 1)
    }
    
    func setupLayout() {
        AutoLayoutCommon.setLayoutFullSuperView(vwContent)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblDate)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(line1, kTop: 10, kBottom: 10)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblIn)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(line2, kTop: 10, kBottom: 10)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblOut)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(line3, kTop: 10, kBottom: 10)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblType)
        self.vwContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==20@999)-[lblDate][line1(==1)][lblIn(==64)][line2(==line1)][lblOut(==lblIn)][line3(==line1)][lblType(==lblIn)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblDate": lblDate,"line1":line1,"lblIn":lblIn,"line2":line2,"lblOut":lblOut,"line3":line3,"lblType":lblType]))
    }
    
}



