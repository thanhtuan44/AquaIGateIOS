//
//  AQUA_Bonus.swift
//  Employee
//
//  Created by Thanh Tuan on 4/6/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class AQUA_Bonus: Base_BackViewWithScrollViewController {

    var tbvBonus : TbvBonus!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddLineBorder.addTopLine(self.view, color: Constant.COLOR_LINE)
        self.tbvBonus = TbvBonus.init(frame: CGRect.zero, superView: self.view)
        AutoLayoutCommon.setLayoutFullWithNavigationSuperView(self.tbvBonus)
        getBonus()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
class TbvBonus: TbvWorkDateDetail {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect,superView:UIView) {
        super.init(frame: frame, superView: superView)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 8
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TbvWorkDateDetailCell", for: indexPath) as! TbvWorkDateDetailCell
        if let arrWorkDate = self.arrDataTbv {
            if(indexPath.row == 0) {
                cell.lblWordDateValue.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
            }else{
                cell.lblWordDateValue.textColor = UIColor.black
            }
            if(arrWorkDate.count > 0) {
                if let bonusItem = arrWorkDate.object(at: 0) as? Model_Bonus {
                    switch indexPath.row {
                    case 0:
                        cell.lblWorkDateInfo.text = "Chuyên cần :"
                        cell.lblWordDateValue.text = bonusItem.bonus
                    case 1:
                        cell.lblWorkDateInfo.text = "Đi trễ :"
                        cell.lblWordDateValue.text = bonusItem.inLate
                    case 2:
                        cell.lblWorkDateInfo.text = "Về sớm :"
                        cell.lblWordDateValue.text = bonusItem.outEarly
                    case 3:
                        cell.lblWorkDateInfo.text = "Unpaid thời gian :"
                        cell.lblWordDateValue.text = bonusItem.UnpaidTime
                    case 4:
                        cell.lblWorkDateInfo.text = "Không quẹt thẻ :"
                        cell.lblWordDateValue.text = bonusItem.NoneScan
                    case 5:
                        cell.lblWorkDateInfo.text = "LeaveNoBonus :"
                        cell.lblWordDateValue.text = bonusItem.LeaveNoBonus
                    case 6:
                        cell.lblWorkDateInfo.text = "Ngày nghỉ :"
                        cell.lblWordDateValue.text = bonusItem.DayOff
                    case 7:
                        cell.lblWorkDateInfo.text = "Đổi ca :"
                        cell.lblWordDateValue.text = bonusItem.ChangeShift
                        
                    default:
                        print("")
                    }
                }
            }
        }
        return cell
    }
    
}
extension AQUA_Bonus {
    func getBonus() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_BONUS)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            let bonus : JSON = dataResponse["diligentBonus"]
                            if let bonusItem = Model_Bonus.loadBonus(bonus) {
                                self.tbvBonus.arrDataTbv?.add(bonusItem)
                                self.tbvBonus.reloadData()
                            }
                        }else{
                            if let message = dataResponse["message"].string {
                                self.showViewNoData(title: message, haveTabbar: true)
                            }
                        }
                    }
                }
            }
        }
    }
}
