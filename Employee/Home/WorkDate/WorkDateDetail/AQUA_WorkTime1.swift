//
//  AQUA_WorkTime1.swift
//  Employee
//
//  Created by Thanh Tuan on 3/14/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit


class AQUA_WorkTime1: Base_ScrollViewController {
    
    var tbvWorkDateDetail : TbvWorkDateDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddLineBorder.addTopLine(self.view, color: Constant.COLOR_LINE)
        self.tbvWorkDateDetail = TbvWorkDateDetail.init(frame: CGRect.zero, superView: self.view)
        AutoLayoutCommon.setLayoutFullWidthSuperView(tbvWorkDateDetail)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[tbvWorkDateDetail]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["tbvWorkDateDetail":tbvWorkDateDetail]))
        self.showCircleLoadingInVC()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func reloadData(_ workTimeDaily: Model_WorkTimeDaily) {
        self.stopCircleLoadingVC()
        self.tbvWorkDateDetail.arrDataTbv?.add(workTimeDaily)
        self.tbvWorkDateDetail.reloadData()
    }

}
class TbvWorkDateDetail: Base_TableView {
    
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
        self.register(TbvWorkDateDetailCell.self, forCellReuseIdentifier: "TbvWorkDateDetailCell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvWorkDateDetailCell", for: indexPath) as! TbvWorkDateDetailCell
        cell.setupData(indexPath, arrData: self.arrDataTbv)
        return cell
    }
    
}


class TbvWorkDateDetailCell: Base_TableViewCell {
    
    let lblWorkDateInfo = UILabel.initUILableAutoLayout()
    let lblWordDateValue = UILabel.initUILableAutoLayout()
    
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
        lblWorkDateInfo.textAlignment = .left
        lblWordDateValue.textAlignment = .right
        lblWorkDateInfo.numberOfLines = 0
        lblWordDateValue.numberOfLines = 0
        
        self.vwContentCell.addSubview(lblWorkDateInfo)
        self.vwContentCell.addSubview(lblWordDateValue)
        
    }
    
    override func setupLayout() {
        
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblWorkDateInfo)
        self.vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblWorkDateInfo(>=50)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblWorkDateInfo": lblWorkDateInfo]))
        self.vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblWordDateValue(>=50)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblWordDateValue": lblWordDateValue]))
        
        self.vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(==10@999)-[lblWorkDateInfo]-(>=10)-[lblWordDateValue]-(==10@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblWorkDateInfo": lblWorkDateInfo,"lblWordDateValue":lblWordDateValue]))
    }
    
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrWorkDate = arrData else {
            return
        }
        if(arrWorkDate.count > 0) {
            if let workdateItem = arrWorkDate.object(at: 0) as? Model_WorkTimeDaily {
                switch indexPath.row {
                case 0:
                    lblWorkDateInfo.text = "Ngày làm việc :"
                    lblWordDateValue.text = workdateItem.workDate
                case 1:
                    lblWorkDateInfo.text = "Quẹt thẻ vô :"
                    lblWordDateValue.text = Utilities.convertDateFormater(workdateItem.timeIn.replacingOccurrences(of: workdateItem.workDate, with: "", options: NSString.CompareOptions.literal, range: nil))
                case 2:
                    lblWorkDateInfo.text = "Quẹt thẻ về :"
                    lblWordDateValue.text = Utilities.convertDateFormater(workdateItem.timeOut.replacingOccurrences(of: workdateItem.workDate, with: "", options: NSString.CompareOptions.literal, range: nil))
                case 3:
                    lblWorkDateInfo.text = "Công việc :"
                    lblWordDateValue.text = workdateItem.shift
                case 4:
                    lblWorkDateInfo.text = "Thời gian làm việc :"
                    lblWordDateValue.text = workdateItem.actualTime
                    
                default:
                    print("")
                }
            }
        }
    }
}

