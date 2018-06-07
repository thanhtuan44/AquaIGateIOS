//
//  UIViewBlock.swift
//  favant
//
//  Created by MinhAnh on 7/1/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class UIViewBlock: UIView {
    var actionBlock: (() -> ())?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setTouchActionBlock(_ actionBlock: @escaping () -> Void) {
        self.isUserInteractionEnabled = true
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action:#selector(didTapWithGesture))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        self.actionBlock = actionBlock
    }
    
    @objc func didTapWithGesture(_ tapGesture: UITapGestureRecognizer) {
        if let actionBlock = actionBlock {
            actionBlock()
        }
    }
}

