//
//  ViewController.swift
//  Employee
//
//  Created by Thanh Tuan on 3/6/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//


import UIKit
import IQKeyboardManager

protocol DelegateLoginVC: class {
    func actionAfterLoginSuccess()
}
class AQUA_LoginVC: Base_ScrollViewController, UITextFieldDelegate {
    
    let vwContentLogo = UIView.initUIViewAutoLayout()
    let vwLogo = UIImageView.initUIImageViewAutoLayout()
    var vwEmail : ViewWithTextField!
    var vwPassWord : ViewWithTextField!
    let vwRememberPass = UIView.initUIViewAutoLayout()
    let vwCheckRememberPass = UIView.initUIViewAutoLayout()
    let btnCheckRememberPass = UIButtonBlock.initUIButtonBlockAutoLayout()
    let btnRememberPass = UIButtonBlock.initUIButtonBlockAutoLayout()
    let btnForgotPass = UIButtonBlock.initUIButtonBlockAutoLayout()
    let btnSignIn  = UIButtonBlock.initUIButtonBlockAutoLayout()
    let vwFooter = UIView.initUIViewAutoLayout()
    let lblNoAccount = UILabel.initUILableAutoLayout()
    let btnSignUp = UIButtonBlock.initUIButtonBlockAutoLayout()
    var isRememberPass : Bool = false
    weak var delegate_LoginVC : DelegateLoginVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addControl()
        setupLayout()
        setupAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setImageRemember()
    }
    
    func addControl() {
        view.addSubview(scvBase)
        scvBase.addSubview(vwContentLogo)
        vwContentLogo.addSubview(vwLogo)
        vwEmail = ViewWithTextField.init(frame: CGRect.zero, withSuperView: self.scvBase, stringPlaceHolder: "Mã số nhân viên", imvLogo: "iconAccount")
        vwEmail.imvInView.image = Utilities.imageWithImage(vwEmail.imvInView.image, scaledToSize: CGSize(width: 30, height: 30))
        vwEmail.txtInView.keyboardType = UIKeyboardType.emailAddress
        vwPassWord = ViewWithTextField.init(frame: CGRect.zero, withSuperView: self.scvBase, stringPlaceHolder: "Mật khẩu",imvLogo: "iconLock")
        vwPassWord.imvInView.image = Utilities.imageWithImage(vwPassWord.imvInView.image, scaledToSize: CGSize(width: 37.5, height: 48))
        vwEmail.txtInView.keyboardType = UIKeyboardType.numberPad
        vwPassWord.txtInView.isSecureTextEntry = true
        vwPassWord.txtInView.setStylePassWord()
        scvBase.addSubview(vwRememberPass)
        vwRememberPass.addSubview(vwCheckRememberPass)
        vwCheckRememberPass.addSubview(btnCheckRememberPass)
        vwCheckRememberPass.addSubview(btnRememberPass)
        vwRememberPass.addSubview(btnForgotPass)
        scvBase.addSubview(btnSignIn)
        self.view.addSubview(vwFooter)
        vwFooter.addSubview(lblNoAccount)
        vwFooter.addSubview(btnSignUp)
        btnRememberPass.setTitle("Nhớ ID nhân viên", for: UIControlState())
        btnForgotPass.setTitle("Quên mật khẩu", for: UIControlState())
        btnForgotPass.setTitleColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA), for: UIControlState())
        btnSignIn.clipsToBounds = true
        btnSignIn.layer.cornerRadius = 4.0
        btnSignIn.setTitle("Đăng Nhập", for: UIControlState())
        btnSignIn.setTitleColor(UIColor.white, for: UIControlState())
        btnSignIn.setBackgroundImage(Utilities.imageWithColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA)), for: UIControlState())
        lblNoAccount.text = "Bạn muốn đổi mật khẩu?"
        btnSignUp.setTitle("Đổi mật khẩu", for: UIControlState())
        btnSignUp.setTitleColor(Utilities.UIColorFromRGB(Constant.COLOR_AQUA), for: UIControlState())
        btnSignUp.layer.cornerRadius = 4.0
        btnSignUp.clipsToBounds = true
        btnSignUp.layer.borderColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA).cgColor
        btnSignUp.layer.borderWidth = 1.0
        btnSignUp.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: 5)
        vwEmail.txtInView.delegate = self
        vwPassWord.txtInView.delegate = self
        vwLogo.image = UIImage(named: "iconLogoAqua")
        vwLogo.contentMode = UIViewContentMode.scaleAspectFit
    }
    func setupLayout() {
        AutoLayoutCommon.setLayoutFullSuperView(scvBase)
        setupLayoutViewButton()
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(vwEmail, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(vwPassWord, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(vwRememberPass, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(btnSignIn, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutCenterSuperView(vwLogo)
        AutoLayoutCommon.setLayoutHeightView(vwContentLogo, kHeight: Constant.screenWidth*2/3)
        setupViewRememberPass()
        setupLayoutViewFooter()
        scvBase.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwContentLogo][vwEmail(==44)]-15-[vwPassWord(==44)]-30-[btnSignIn(==50)]-10-[vwRememberPass(==44)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwContentLogo":vwContentLogo,"vwEmail":vwEmail,"vwPassWord":vwPassWord,"vwRememberPass":vwRememberPass,"btnSignIn":btnSignIn]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[vwFooter(==44)]-(==20@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwFooter":vwFooter]))
    }
    func setupViewRememberPass() {
        AutoLayoutCommon.setLayoutFullHeightSuperView(vwCheckRememberPass)
        AutoLayoutCommon.setLayoutFullHeightSuperView(btnForgotPass)
        AutoLayoutCommon.setLayoutFullHeightSuperView(btnRememberPass)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(btnCheckRememberPass)
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(btnCheckRememberPass)
        vwCheckRememberPass.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[btnCheckRememberPass(==20)]-5-[btnRememberPass]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["btnRememberPass":btnRememberPass,"btnCheckRememberPass":btnCheckRememberPass]))
        vwRememberPass.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[vwCheckRememberPass]-(>=0)-[btnForgotPass]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwCheckRememberPass":vwCheckRememberPass,"btnForgotPass":btnForgotPass]))
        self.btnCheckRememberPass.setBackgroundImage(Utilities.imageWithImage(UIImage(named: String(format: "iconUnSelect")), scaledToSize: CGSize(width: 20, height: 20)), for: UIControlState())
    }
    func setupLayoutViewButton() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwContentLogo)
    }
    func setupLayoutViewFooter() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwFooter)
        AutoLayoutCommon.setLayoutFullHeightSuperView(lblNoAccount)
        AutoLayoutCommon.setLayoutHeightView(btnSignUp, kHeight: 34)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(btnSignUp)
        vwFooter.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[lblNoAccount]-10-[btnSignUp]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblNoAccount":lblNoAccount,"btnSignUp":btnSignUp]))
    }
    func setImageRemember() {
        self.isRememberPass = AQUA_User.shared.userAqua.isRememberID
        self.btnCheckRememberPass.setBackgroundImage(Utilities.imageWithImage(UIImage(named: String(format: "%@",self.isRememberPass ? "iconSelected" : "iconUnSelect")), scaledToSize: CGSize(width: 20, height: 20)), for: UIControlState())
        self.vwEmail.txtInView.text = AQUA_User.shared.userAqua.userID
    }
    
}


