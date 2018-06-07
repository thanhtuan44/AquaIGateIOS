//
//  AQUA_WorkDay.swift
//  Employee
//
//  Created by Thanh Tuan on 3/14/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_WorkDate: Base_BackViewController, Delegate_BaseTableView {

    var tbvWorkDate : TbvWorkDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTbvWorkDate()
        getWorkTimeDaily()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTbvWorkDate() {
        self.tbvWorkDate = TbvWorkDate.init(frame: CGRect.zero, superView: self.view)
        self.tbvWorkDate.delegate_BaseTableView = self
        AutoLayoutCommon.setLayoutFullSuperView(tbvWorkDate)
    }
    
    func didSelect_BaseTbvItemAtIndexPath(_ tableView: UITableView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(indexPath.row < arrData.count) {
            if(tableView == self.tbvWorkDate) {
                if let workDateDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "WorkDateDetailVC") as? AQUA_WorkDateDetail {
                    if let workDate = arrData.object(at: indexPath.row) as? Model_WorkTimeDaily {
                        workDateDetailVC.dateSelect = workDate.workDate
                        self.navigationController?.pushViewController(workDateDetailVC, animated: true)
                    }
                    
                }
            }
        }
    }
}


