//
//  UITextFieldBlock.swift
//  favant
//
//  Created by MinhAnh on 7/27/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class UITextFieldBlock: UITextField {
    let clearButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let showPass = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    override init(frame: CGRect) {
        super.init(frame: frame)
        clearButton.setImage(Utilities.imageWithImage(UIImage(named: "iconClose.png"), scaledToSize: CGSize(width: 20, height: 20)), for: UIControlState())
        self.rightView = clearButton
        clearButton.addTarget(self, action: #selector(UITextFieldBlock.clearClicked(_:)), for: UIControlEvents.touchUpInside)
        self.rightViewMode = UITextFieldViewMode.whileEditing    
    }
    
    @objc func clearClicked(_ sender:UIButton) {
        self.text = ""
    }
    func setStylePassWord() {
        showPass.setImage(Utilities.imageWithImage(UIImage(named: "iconHidePass.png"), scaledToSize: CGSize(width: 20, height: 20)), for: UIControlState())
        self.isSecureTextEntry = true
        self.rightView = showPass
        showPass.addTarget(self, action: #selector(UITextFieldBlock.showHidePass(_:)), for: UIControlEvents.touchUpInside)
        self.rightViewMode = UITextFieldViewMode.whileEditing
    }
    @objc func showHidePass(_ sender:UIButton) {
        if(self.isSecureTextEntry == true) {
            showPass.setImage(Utilities.imageWithImage(UIImage(named: "iconShowPass.png"), scaledToSize: CGSize(width: 20, height: 20)), for: UIControlState())
            self.isSecureTextEntry = false
        }else{
            showPass.setImage(Utilities.imageWithImage(UIImage(named: "iconHidePass.png"), scaledToSize: CGSize(width: 20, height: 20)), for: UIControlState())
            self.isSecureTextEntry = true
        }
        let stringValue : NSString = self.text! as NSString
        self.text = ""
        self.text = stringValue as String
        
    }
    func setPlaceHolderAttribute(_ text:String?) {
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.red,
            NSAttributedStringKey.font : UIFont(name: Constant.FONT_APP, size: 14)!]
        self.attributedPlaceholder = NSAttributedString(string:text!, attributes:attributes)
    }
    
}
