//
//  Base_BackViewController.swift
//  Employee
//
//  Created by Thanh Tuan on 3/13/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class Base_BackViewController: UIViewController {
    var btnBack : UIBarButtonItem!
    var vwCirCleLoading : CircleLoading?
    var vwNoData : UIViewWithNoData?
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBack =  UIBarButtonItem(image: UIImage(named: "iconBack"), style: .plain, target: self, action: #selector(Base_BackViewController.backView))
        self.navigationItem.leftBarButtonItems = [btnBack];
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
        logo.tintColor = UIColor.white
        logo.contentMode = .scaleAspectFit
        logo.image = Utilities.imageWithImage(UIImage(named:"iconLogoAqua"), scaledToSize: CGSize(width: 80, height: 20))
        self.navigationItem.titleView = logo
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func backView() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    func showCircleLoadingInVC() {
        if(vwCirCleLoading == nil) {
            vwCirCleLoading = CircleLoading.init(frame: CGRect.zero, superview: self.view, withClear: false)
        }
    }
    func stopCircleLoadingVC() {
        if(vwCirCleLoading != nil) {
            vwCirCleLoading?.removeFromSuperview()
            vwCirCleLoading = nil
        }
    }
    func showViewNoData(title: String,haveTabbar: Bool) {
        if(vwNoData == nil){
            vwNoData = UIViewWithNoData.init(frame: CGRect.zero, superview: self.view,title: title, haveTabbar: haveTabbar)
        }
    }
    func stopViewNoData() {
        if(vwNoData != nil) {
            vwNoData?.removeFromSuperview()
            vwNoData = nil
        }
    }
}


