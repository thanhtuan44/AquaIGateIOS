//
//  CircleLoading.swift
//  favant
//
//  Created by MinhAnh on 7/13/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class CircleLoading: UIView {
    let vwLoading : HYCircleLoadingView = HYCircleLoadingView()
    let image : UIImageView = UIImageView.initUIImageViewAutoLayout()
    init(frame: CGRect,superview:UIView, withClear: Bool) {
        super.init(frame: CGRect.zero);
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = (withClear ? UIColor.clear : UIColor.white)
        superview.addSubview(self)
        superview.bringSubview(toFront: self);
        AutoLayoutCommon.setLayoutFullSuperView(self)
        self.addSubview(vwLoading)
        vwLoading.translatesAutoresizingMaskIntoConstraints = false
        AutoLayoutCommon.setLayoutCenterSuperView(vwLoading)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[vwLoading(==44)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwLoading":vwLoading]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[vwLoading(==44)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwLoading":vwLoading]))
        self.addSubview(image)
        AutoLayoutCommon.setLayoutCenterSuperView(image)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[image(==30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["image":image]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[image(==30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["image":image]))
        vwLoading.startAnimation()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "iconLoading")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

