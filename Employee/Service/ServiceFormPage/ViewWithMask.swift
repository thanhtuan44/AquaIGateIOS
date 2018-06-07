//
//  View.swift
//  Employee
//
//  Created by Thanh Tuan on 3/15/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewListManager : ViewWithMaskTableView {
    override func reloadData() {
        self.layoutContraintsHeightSubView.constant = Constant.screenWidth - 20 - 44
        self.tbvSelect.showCircleLoadingView()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_LIST_MANAGER)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.tbvSelect.stopCircleLoadingView()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            guard let arrManager = dataResponse["data"].array else {
                                return
                            }
                            if(arrManager.count > 0){
                                for magager in arrManager {
                                    if let idManager = magager["id"].string {
                                        if let nameManager = magager["text"].string {
                                            let manager = IdValueObject.init(id: idManager, value: nameManager)
                                            self.tbvSelect.arrDataTbv?.add(manager)
                                        }
                                    }
                                }
                                self.tbvSelect.reloadData()
                            }
                        }
                    }
                }
            }
        }

    }
}
class ViewWithMaskTableView: ViewWithMaskView, Delegate_BaseTableView_Select {
    var tbvSelect : Base_TableView_KeyValue_Select!
    var completionBlock: ((IdValueObject) -> Void)? = nil
    var valueSelect : IdValueObject?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect, superView: UIView, arrData: NSMutableArray?, title: String) {
        super.init(frame: CGRect.zero, superView: superView, title: title)
        self.translatesAutoresizingMaskIntoConstraints = false
        tbvSelect = Base_TableView_KeyValue_Select.init(frame: CGRect.zero, superView: self.vwCenter, data: arrData, indexSelect: -1, style: .plain)
        tbvSelect.delegate_BaseTableView_Select = self
        setupViewCenter()
        
        self.btnDone.setTouchActionBlock {
            if let completionBlock = self.completionBlock {
                if(self.valueSelect != nil) {
                    completionBlock(self.valueSelect!)
                }
            }
            self.closeView()
        }
    }
    
    func setupViewCenter() {
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(tbvSelect, kLeft: 20, kRight: 20)
        vwCenter.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwHeaderCenter(==44)][tbvSelect]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwHeaderCenter":vwHeaderCenter,"tbvSelect":tbvSelect]))
    }
    
    override func reloadData() {
        self.tbvSelect.reloadData()
        layoutContraintsHeightSubView.constant = Constant.screenWidth - 20 - 44
    }
    func didSelect_BaseTbvSelectItemAtIndexPath(_ tableView: UITableView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(tableView == self.tbvSelect) {
            if let arrValue = arrData as? NSMutableArray {
                if(indexPath.row < arrValue.count) {
                    if let selectValue = arrValue.object(at: indexPath.row) as? IdValueObject {
                        self.valueSelect = selectValue
                    }
                }
            }
        }
    }
}
class ViewWithMaskPickerView: ViewWithMaskView  {
    var vwTimer : UIDatePicker!
    var completionBlock: ((String) -> Void)? = nil
    var valueSelect = ""
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect, superView: UIView, title: String) {
        super.init(frame: CGRect.zero, superView: superView, title: title)
        self.translatesAutoresizingMaskIntoConstraints = false
        vwTimer = UIDatePicker.init(frame: CGRect.zero)
        vwTimer.translatesAutoresizingMaskIntoConstraints = false
        self.vwTimer.backgroundColor = UIColor.white
        self.vwTimer.datePickerMode = UIDatePickerMode.time
        self.vwTimer.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        vwCenter.addSubview(vwTimer)
        setupViewCenter()
        self.btnDone.setTouchActionBlock {
            if let completionBlock = self.completionBlock {
                if(self.valueSelect != "") {
                    completionBlock(self.valueSelect)
                }
            }
            self.closeView()
        }
    }
    
    func setupViewCenter() {
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(vwTimer, kLeft: 20, kRight: 20)
        vwCenter.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwHeaderCenter(==44)][vwTimer]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwHeaderCenter":vwHeaderCenter,"vwTimer":vwTimer]))
    }
    
    override func reloadData() {
        layoutContraintsHeightSubView.constant = Constant.screenWidth
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
        let componenets = Calendar.current.dateComponents([.hour, .minute], from: sender.date)
        if let hour = componenets.hour, let minute = componenets.minute {
            self.valueSelect = String(format:"%02d:%02d",hour,minute)
        }
    }
}

import FSCalendar
class ViewWithMaskCalendar: ViewWithMaskView,FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    let gregorian: Calendar = Calendar(identifier: .gregorian)
    let vwCalendar = UIView.initUIViewAutoLayout()
    var calendar: FSCalendar!
    var completionBlock: ((String) -> Void)? = nil
    var valueSelect = ""

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect, superView: UIView, title: String) {
        super.init(frame: CGRect.zero, superView: superView, title: title)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupCalendar()
        setupViewCenter()
        self.btnDone.setTouchActionBlock {
            if let completionBlock = self.completionBlock {
                if(self.valueSelect != "") {
                    completionBlock(self.valueSelect)
                }
            }
            self.closeView()
        }
    }
    func setupCalendar() {
        calendar = FSCalendar.init(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth - 40, height: Constant.screenWidth - 40))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.appearance.headerTitleFont = UIFont(name: Constant.FONT_APP, size: 14)
        calendar.appearance.headerTitleColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        calendar.appearance.weekdayFont = UIFont(name: Constant.FONT_APP, size: 12)
        calendar.appearance.weekdayTextColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        calendar.appearance.titleTodayColor = UIColor.white
        calendar.appearance.todayColor = UIColor.orange
        calendar.placeholderType = FSCalendarPlaceholderType.none
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "Cell")
        vwCalendar.addSubview(calendar)
        self.vwCenter.addSubview(vwCalendar)
        vwCalendar.backgroundColor = UIColor.white
    }
    func setupViewCenter() {
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(vwCalendar, kLeft: 20, kRight: 20)
        vwCenter.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwHeaderCenter(==44)][vwCalendar]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwHeaderCenter":vwHeaderCenter,"vwCalendar":vwCalendar]))
    }
    
    override func reloadData() {
        
        layoutContraintsHeightSubView.constant = Constant.screenWidth
    }
    //Delegate Calendar
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return UIColor.orange
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        if(gregorian.compare(date, to: Date(), toGranularity: Calendar.Component.day) == ComparisonResult.orderedAscending ){
            return UIColor.lightGray
        }else {
            return UIColor.black
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        calendar.appearance.titleTodayColor = UIColor.orange
        calendar.appearance.todayColor = UIColor.clear
        if(gregorian.compare(date, to: Date(), toGranularity: Calendar.Component.day) == ComparisonResult.orderedSame ){
            calendar.appearance.titleTodayColor = UIColor.white
            calendar.appearance.todayColor = UIColor.orange
        }
        self.valueSelect = String(format: "%@", Utilities.getDateCalendar(date: date))
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
        
    }

    func calendar(_ calendar: FSCalendar, shouldSelect date: Date) -> Bool {
        if(gregorian.compare(date, to: Date(), toGranularity: Calendar.Component.day) == ComparisonResult.orderedAscending ){
            return false
        }
        return true
    }
}
