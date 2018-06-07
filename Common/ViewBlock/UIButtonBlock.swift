//
//  UIButtonBlock.swift
//  favant
//
//  Created by MinhAnh on 7/11/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class UIButtonBlock: UIButton {
    var actionBlock: (() -> ())?
   
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:)") }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func setTouchActionBlock(_ actionBlock: @escaping () -> Void) {
        addTarget(self, action: #selector(UIButtonBlock.touchDown(_:)), for: .touchUpInside)
        self.actionBlock = actionBlock
    }
    //actions
    @objc func touchDown(_ sender: UIButton) {
        if let actionBlock = actionBlock {
            actionBlock()
        }
    }
}

