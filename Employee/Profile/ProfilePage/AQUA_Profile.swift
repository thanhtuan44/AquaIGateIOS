//
//  AQUA_Profile.swift
//  Employee
//
//  Created by Thanh Tuan on 3/8/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_Profile: Base_ScrollViewController {

    let vwTileAccount = UIView.initUIViewAutoLayout()
    let imvLogo = UIImageView.initUIImageViewAutoLayout()
    let lblUserName = UILabel.initUILableAutoLayout()
    var vwInfoTransaction : ViewWithText!
    var btnRegisDateOff : ButtonWithArrow!
    var btnRegisOvertime : ButtonWithArrow!
    var btnRegisNonScan : ButtonWithArrow!
    var vwConfirm : ViewConfirm!
    var vwInfoAccount : ViewWithText!
    var btnUpdateProfile : ButtonWithArrow!
    var vwLogout : UIViewWithLoading = UIViewWithLoading.initUIViewWithLoadingBlockAutoLayout()
    var btnSignOut = UIButtonBlock.initUIButtonBlockAutoLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addControl()
        setupLayout()
        setupAction()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProfile()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func addControl() {
        scvBase.addSubview(vwTileAccount)
        vwTileAccount.addSubview(imvLogo)
        lblUserName.text = "UserName"
        vwTileAccount.addSubview(lblUserName)
        vwInfoTransaction = ViewWithText.init(frame: CGRect.zero, superView: scvBase, string: "Tiện ích")
        scvBase.addSubview(vwInfoTransaction)
        btnRegisDateOff = ButtonWithArrow.init(frame: CGRect.zero, superView: scvBase, string: "Đăng kí nghỉ phép")
        AddLineBorder.addBottomLine(btnRegisDateOff, color: Constant.COLOR_LINE)
        scvBase.addSubview(btnRegisDateOff)
        btnRegisOvertime = ButtonWithArrow.init(frame: CGRect.zero, superView: scvBase, string: "Đăng kí tăng ca")
        AddLineBorder.addBottomLine(btnRegisOvertime, color: Constant.COLOR_LINE)
        scvBase.addSubview(btnRegisOvertime)
        btnRegisNonScan = ButtonWithArrow.init(frame: CGRect.zero, superView: scvBase, string: "Xác nhận quẹt thẻ ")
        AddLineBorder.addBottomLine(btnRegisNonScan, color: Constant.COLOR_LINE)
        scvBase.addSubview(btnRegisNonScan)
        
        vwConfirm = ViewConfirm.init(frame: CGRect.zero, superView: scvBase)
        vwInfoAccount = ViewWithText.init(frame: CGRect.zero, superView: scvBase, string: "Thông báo")
        scvBase.addSubview(vwInfoAccount)
        btnUpdateProfile = ButtonWithArrow.init(frame: CGRect.zero, superView: scvBase, string: "Danh sách thông báo")
        AddLineBorder.addBottomLine(btnUpdateProfile, color: Constant.COLOR_LINE)
        scvBase.addSubview(btnUpdateProfile)
        vwLogout.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_BACKGROUND)
        scvBase.addSubview(vwLogout)
        btnSignOut.clipsToBounds = true
        btnSignOut.layer.cornerRadius = 4.0
        btnSignOut.setTitleColor(UIColor.white, for: UIControlState())
        btnSignOut.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA)), for: UIControlState())
        vwLogout.addSubview(btnSignOut)
        btnSignOut.setTitle("ĐĂNG XUẤT", for: UIControlState())
        imvLogo.image = Utilities.imageWithImage(UIImage(named:"icon_avatar"), scaledToSize: CGSize(width: 44, height: 44))
    }
    
    func setupLayout() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwTileAccount)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwInfoTransaction)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwInfoAccount)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwLogout)
        setupLayoutViewTitle()
        setupLayoutViewLogOut()
        scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwTileAccount(==64)][vwInfoTransaction(==50)][btnRegisDateOff(==44)][btnRegisOvertime(==44)][btnRegisNonScan(==44)][vwConfirm][vwInfoAccount(==50)][btnUpdateProfile(==44)]-50-[vwLogout(==64)]-(>=20)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwTileAccount":vwTileAccount,"vwInfoTransaction":vwInfoTransaction,"btnRegisDateOff":btnRegisDateOff,"btnRegisOvertime":btnRegisOvertime,"btnRegisNonScan":btnRegisNonScan,"vwConfirm":vwConfirm,"vwInfoAccount":vwInfoAccount,"btnUpdateProfile":btnUpdateProfile,"vwLogout":vwLogout]))
        
    }
    func setupLayoutViewLogOut() {
        AutoLayoutCommon.setLayoutSuperViewWithMargin(btnSignOut, kTop: 10, kLeft: 10, kBottom: 10, kRight: 10)
    }
    func setupLayoutViewTitle() {
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(imvLogo, kTop: 10, kBottom: 10)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(lblUserName, kTop: 10, kBottom: 10)
        vwTileAccount.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[imvLogo(==44)]-20-[lblUserName]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvLogo":imvLogo,"lblUserName":lblUserName]))
    }
}
