//
//  AQUA_WordDay.swift
//  Employee
//
//  Created by Thanh Tuan on 3/14/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import FSCalendar

class AQUA_WorkDate1: Base_BackViewController,FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    let gregorian: Calendar = Calendar(identifier: .gregorian)
    let vwCalendar = UIView.initUIViewAutoLayout()
    var calendar: FSCalendar! 
    var dateCompare = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        let component = NSDateComponents()
        component.setValue(-1, forComponent: NSCalendar.Unit.month)
        dateCompare = gregorian.date(byAdding: component as DateComponents, to: Date())!
        setupCalendar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension AQUA_WorkDate1 {
    func setupCalendar() {
        calendar = FSCalendar.init(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: Constant.screenWidth - 20))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.appearance.headerTitleFont = UIFont(name: Constant.FONT_APP, size: 14)
        calendar.appearance.headerTitleColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        calendar.appearance.weekdayFont = UIFont(name: Constant.FONT_APP, size: 12)
        calendar.appearance.weekdayTextColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        calendar.appearance.titleTodayColor = UIColor.white
        calendar.appearance.todayColor = UIColor.orange
        calendar.allowsMultipleSelection = true
        calendar.placeholderType = FSCalendarPlaceholderType.none
        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "Cell")
        vwCalendar.addSubview(calendar)
        self.view.addSubview(vwCalendar)
        AutoLayoutCommon.setLayoutFullSuperView(vwCalendar)
    }
    
    //Delegate Calendar
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return UIColor.orange
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        if(gregorian.compare(date, to: Date(), toGranularity: Calendar.Component.day) == ComparisonResult.orderedDescending ){
            return UIColor.lightGray
        }else if(gregorian.compare(date, to: dateCompare, toGranularity: Calendar.Component.day) == ComparisonResult.orderedAscending ){
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
        print(String(format: "%@", Utilities.getDateCalendar(date: date)))
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
        
    }
//    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
//        calendarHeightConstraint.constant = CGRectGetHeight(bounds);
//    }
    

    func calendar(_ calendar: FSCalendar, shouldSelect date: Date) -> Bool {
        if(gregorian.compare(date, to: Date(), toGranularity: Calendar.Component.day) == ComparisonResult.orderedDescending ){
            return false
        }else if(gregorian.compare(date, to: dateCompare, toGranularity: Calendar.Component.day) == ComparisonResult.orderedAscending ){
            return false
        }
        return true
    }
}
