//
//  AQUA_WorkTime2.swift
//  Employee
//
//  Created by Thanh Tuan on 3/14/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_WorkTime2: Base_ScrollViewController {
    
    var tbvWorkDateDetail : TbvWorkDateDetail2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddLineBorder.addTopLine(self.view, color: Constant.COLOR_LINE)
        self.tbvWorkDateDetail = TbvWorkDateDetail2.init(frame: CGRect.zero, superView: self.view)
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
class TbvWorkDateDetail2: TbvWorkDateDetail {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect,superView:UIView) {
        super.init(frame: frame, superView: superView)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 9
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvWorkDateDetailCell", for: indexPath) as! TbvWorkDateDetailCell
        if let arrWorkDate = self.arrDataTbv {
            if(arrWorkDate.count > 0) {
                if let workdateItem = arrWorkDate.object(at: 0) as? Model_WorkTimeDaily {
                    switch indexPath.row {
                    case 0:
                        cell.lblWorkDateInfo.text = "ns :"
                        cell.lblWordDateValue.text = workdateItem.ns
                    case 1:
                        cell.lblWorkDateInfo.text = "ns20 :"
                        cell.lblWordDateValue.text = workdateItem.ns20
                    case 2:
                        cell.lblWorkDateInfo.text = "Tăng ca 1.5 :"
                        cell.lblWordDateValue.text = workdateItem.ot15
                    case 3:
                        cell.lblWorkDateInfo.text = "Tăng ca sáng :"
                        cell.lblWordDateValue.text = workdateItem.otm
                    case 4:
                        cell.lblWorkDateInfo.text = "Tăng ca 2.0 :"
                        cell.lblWordDateValue.text = workdateItem.ot20
                    case 5:
                        cell.lblWorkDateInfo.text = "Đi trễ :"
                        cell.lblWordDateValue.text = workdateItem.lt
                    case 6:
                        cell.lblWorkDateInfo.text = "Về sớm :"
                        cell.lblWordDateValue.text = workdateItem.et
                    case 7:
                        cell.lblWorkDateInfo.text = "ut :"
                        cell.lblWordDateValue.text = workdateItem.ut
                    case 8:
                        cell.lblWorkDateInfo.text = "Meal :"
                        cell.lblWordDateValue.text = workdateItem.meal
                        
                    default:
                        print("")
                    }
                }
            }
        }
        return cell
    }
    
}



