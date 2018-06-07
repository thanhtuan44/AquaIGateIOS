//
//  TbvMissingNonScan.swift
//  Employee
//
//  Created by Thanh Tuan on 4/17/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//


import UIKit
import MGSwipeTableCell

protocol Delegate_TbvMissingNonScan: class {
    func didSelectButton(_ type : String, missingNonScanData : Model_MissingNonScan)
}
class TbvMissingNonScan: Base_TableView, MGSwipeTableCellDelegate {
    weak var delegate_TbvMissingNonScan:Delegate_TbvMissingNonScan?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect,superView:UIView) {
        super.init(frame: frame, style: UITableViewStyle.plain)
        superView.addSubview(self);
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = UIColor.clear
        self.register(TbvMissingNonScanCell.self, forCellReuseIdentifier: "TbvMissingNonScanCell")
        self.register(TbvMissingNonScan_Header.self, forHeaderFooterViewReuseIdentifier: "TbvMissingNonScan_Header")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TbvMissingNonScan_Header") as! TbvMissingNonScan_Header
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvMissingNonScanCell", for: indexPath) as! TbvMissingNonScanCell
        cell.rightButtons = [MGSwipeButton(title: "",icon: Utilities.imageWithImage(UIImage(named:"iconDateOff"), scaledToSize: CGSize(width: 36, height: 36)), backgroundColor: UIColor.white)
            ,MGSwipeButton(title: "",icon: Utilities.imageWithImage(UIImage(named:"iconNonScan"), scaledToSize: CGSize(width: 36, height: 36)), backgroundColor: UIColor.white)]
        cell.rightSwipeSettings.transition = MGSwipeTransition.drag
        cell.delegate = self
        cell.setupData(indexPath, arrData: self.arrDataTbv)
        cell.setupUI(indexPath, arrData: self.arrDataTbv)
        return cell
    }
    
    func swipeTableCell(_ cell: MGSwipeTableCell, tappedButtonAt index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        if(direction == MGSwipeDirection.rightToLeft) {
            guard let arrData = arrDataTbv else {
                return false
            }
            if let indexPath = self.indexPath(for: cell) as IndexPath? {
                if let nonScanItem = arrData.object(at: indexPath.row) as? Model_MissingNonScan {
                    switch index {
                    case 0:
                        self.delegate_TbvMissingNonScan?.didSelectButton("RegisterDateOff", missingNonScanData: nonScanItem)
                    case 1:
                        self.delegate_TbvMissingNonScan?.didSelectButton("RegisterScan", missingNonScanData: nonScanItem)
                    default:
                        print("")
                    }
                }
            }
        }
        return true
    }
}

class TbvMissingNonScanCell: MGSwipeTableCell {
    
    let lblDate = UILabel.initUILableAutoLayout()
    let line1 = UIView.initUIViewAutoLayout()
    let lblIn = UILabel.initUILableAutoLayout()
    let line2 = UIView.initUIViewAutoLayout()
    let lblOut = UILabel.initUILableAutoLayout()
    let line3 = UIView.initUIViewAutoLayout()
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
        lblDate.textAlignment = .left
        lblIn.textAlignment = .center
        lblOut.textAlignment = .center
        self.contentView.addSubview(lblDate)
        self.contentView.addSubview(line1)
        self.contentView.addSubview(lblIn)
        self.contentView.addSubview(line2)
        self.contentView.addSubview(lblOut)
        self.contentView.addSubview(line3)
        line1.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        line2.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        line3.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        AddLineBorder.addBottomLine(contentView, color: Constant.COLOR_LINE)
    }
    
    func setupLayout() {
        AutoLayoutCommon.setLayoutHeightView(contentView, kHeight: 64)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblDate)
        AutoLayoutCommon.setLayoutFullHeightSuperView(line1)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblIn)
        AutoLayoutCommon.setLayoutFullHeightSuperView(line2)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblOut)
        AutoLayoutCommon.setLayoutFullHeightSuperView(line3)
        self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==20@999)-[lblDate][line1(==1)][lblIn(==84)][line2(==line1)][lblOut(==lblIn)][line3(==1)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblDate": lblDate,"line1":line1,"lblIn":lblIn,"line2":line2,"lblOut":lblOut,"line3":line3]))
    }
    
    func setupLayoutViewInfo() {
        
    }
    
    func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrData = arrData else {
            return
        }
        if let nonScanItem = arrData.object(at: indexPath.row) as? Model_MissingNonScan {
            self.lblDate.text = nonScanItem.workDate
            if(nonScanItem.timeIn == ""){
                self.lblIn.text = nonScanItem.missingNonscan
            }else{
                self.lblIn.text = nonScanItem.timeIn
            }
            if(nonScanItem.timeOut == ""){
                self.lblOut.text = nonScanItem.missingNonscan
            }else{
                self.lblOut.text = nonScanItem.timeOut
            }
        }
    }
    func setupUI(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        if(indexPath.row % 2 == 0){
            self.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA).withAlphaComponent(0.2)
            
        }else {
            self.backgroundColor = UIColor.white
        }
        AddLineBorder.addBottomLine(self.rightButtons[0], color: Constant.COLOR_LINE)
        AddLineBorder.addBottomLine(self.rightButtons[1], color: Constant.COLOR_LINE)
        AddLineBorder.addLeftLine(self.rightButtons[0], color: Constant.COLOR_LINE)
        AddLineBorder.addLeftLine(self.rightButtons[1], color: Constant.COLOR_LINE)
    }
}
class TbvMissingNonScan_Header: UITableViewHeaderFooterView {
    
    let vwContent = UIView.initUIViewAutoLayout()
    let lblDate = UILabel.initUILableAutoLayout()
    let line1 = UIView.initUIViewAutoLayout()
    let lblIn = UILabel.initUILableAutoLayout()
    let line2 = UIView.initUIViewAutoLayout()
    let lblOut = UILabel.initUILableAutoLayout()
    
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
        lblOut.numberOfLines = 0
        lblIn.numberOfLines = 0
        lblDate.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        lblIn.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        lblOut.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        line1.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        line2.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        
        lblDate.textAlignment = .left
        lblIn.textAlignment = .center
        lblOut.textAlignment = .center
        self.contentView.addSubview(vwContent)
        self.vwContent.addSubview(lblDate)
        self.vwContent.addSubview(line1)
        self.vwContent.addSubview(lblIn)
        self.vwContent.addSubview(line2)
        self.vwContent.addSubview(lblOut)
        AddLineBorder.addBottomLine(vwContent, color: Constant.COLOR_AQUA, kWidth: 1)
    }
    
    func setupLayout() {
        AutoLayoutCommon.setLayoutFullSuperView(vwContent)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblDate)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(line1, kTop: 10, kBottom: 10)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblIn)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(line2, kTop: 10, kBottom: 10)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblOut)
        self.vwContent.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==20@999)-[lblDate][line1(==1)][lblIn(==84)][line2(==line1)][lblOut(==lblIn)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblDate": lblDate,"line1":line1,"lblIn":lblIn,"line2":line2,"lblOut":lblOut]))
    }
    
}

