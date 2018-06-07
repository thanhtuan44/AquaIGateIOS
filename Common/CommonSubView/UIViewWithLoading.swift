//
//  CircleLoadingSingleton.swift
//  favant
//
//  Created by MinhAnh on 7/15/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class UIViewWithLoading: UIView {
    var vwCirCleLoading : CircleLoading?
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIViewWithLoading{
    func showCircleLoadingView() {
        vwCirCleLoading = CircleLoading.init(frame: CGRect.zero, superview: self, withClear: false)
    }
    
    func stopCircleLoadingView() {
        if(vwCirCleLoading != nil) {
            vwCirCleLoading?.removeFromSuperview()
            vwCirCleLoading = nil
        }
    }
}
