//
//  BaseScrollViewController.swift
//  favant
//
//  Created by MinhAnh on 6/25/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class Base_ScrollViewController: UIViewController {
    var vwCirCleLoading : CircleLoading?
    var vwNoData : UIViewWithNoData?
    let scvBase : UIScrollView = UIScrollView.initUIScrollViewAutoLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
        logo.tintColor = UIColor.white
        logo.contentMode = .scaleAspectFit
        logo.image = Utilities.imageWithImage(UIImage(named:"iconLogoAqua"), scaledToSize: CGSize(width: 80, height: 20))
        self.navigationItem.titleView = logo
        self.view.addSubview(scvBase);
        AutoLayoutCommon.setLayoutFullSuperView(scvBase)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}

extension Base_ScrollViewController {
    
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

class Base_BackViewWithScrollViewController: Base_ScrollViewController {
    
    var btnBack : UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBack =  UIBarButtonItem(image: UIImage(named: "iconBack"), style: .plain, target: self, action: #selector(Base_BackViewController.backView))
        self.navigationItem.leftBarButtonItems = [btnBack];
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func backView() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
}
