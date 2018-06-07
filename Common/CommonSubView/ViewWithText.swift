//
//  ViewWithText.swift
//  Hasaki
//
//  Created by MinhAnh on 10/4/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class ViewWithText: UIView {
    let label : UILabel = UILabel.initUILableAutoLayout()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect, superView: UIView, string: String?) {
        super.init(frame: frame);
        superView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_BACKGROUND)
        addControl()
        setupLayout()
        label.text = string
        label.font = UIFont(name: Constant.FONT_APP, size: 16)
    }
    func addControl() {
        self.addSubview(label)
    }
    func setupLayout() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(self)
        AutoLayoutCommon.setLayoutFullHeightSuperView(label)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(label, kLeft: 10, kRight: 10)
    }
}
