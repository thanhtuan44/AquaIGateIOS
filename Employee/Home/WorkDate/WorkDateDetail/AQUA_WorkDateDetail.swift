//
//  AQUA_WorkDateDetail.swift
//  Employee
//
//  Created by Thanh Tuan on 3/14/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwipeMenuViewController
import SwiftyJSON

class AQUA_WorkDateDetail: Base_BackViewController, SwipeMenuViewDataSource{
    var swipeView : SwipeMenuView!
    var arrViewController : NSMutableArray = []
    var arrTitle : NSMutableArray = ["WorkTime Detail 1","WorkTime Detail 2"]
    let vc = AQUA_WorkTime1()
    let vc2 = AQUA_WorkTime2()
    var dateSelect = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.swipeView = SwipeMenuView.init(frame: CGRect(x: 1, y: 1, width: 1, height: 1))
        self.swipeView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.swipeView)
        AutoLayoutCommon.setLayoutFullWidthSuperView(self.swipeView)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[swipeView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["swipeView":swipeView]))
        self.swipeView.dataSource = self
        
        var options: SwipeMenuViewOptions             = .init()
        options.tabView.style                         = .flexible
        options.tabView.underlineView.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        options.tabView.itemView.textColor            = UIColor.lightGray
        options.tabView.itemView.selectedTextColor    = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        
        self.swipeView.options = options
        self.arrViewController.add(vc)
        self.arrViewController.add(vc2)
        self.swipeView.reloadData()
        getWorkDateDetail()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @objc override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
//        // Codes
//    }
//
//    @objc override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
//        // Codes
//    }
//
//    @objc override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
//        // Codes
//    }
//
//    @objc override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
//        // Codes
//    }
    
    
    // MARK - SwipeMenuViewDataSource
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return arrViewController.count
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return arrTitle.object(at: index) as! String
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let viewController = arrViewController.object(at: index) as! UIViewController
        return viewController
    }
    
    func getWorkDateDetail() {
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@%@", Constant.DOMAIN,API.GET_WORKTIMEDAILY_DETAIL,self.dateSelect)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            let dicWorkTime : JSON = dataResponse["daily"]
                            if let dataWorkTime = Model_WorkTimeDaily.loadWorkingDaily(dicWorkTime) {
                                self.vc.reloadData(dataWorkTime)
                                self.vc2.reloadData(dataWorkTime)
                            }
                        }else{
                            if let message = dataResponse["message"].string {
                                Utilities.showAlert(viewController: self, message: message)
                            }
                        }
                    }
                }
            }
        }
    }
}

