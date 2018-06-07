//
//  UIImageViewBlock.swift
//  Hasaki
//
//  Created by Thanh Tuan on 12/26/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class UIImageViewBlock: UIImageView {

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
class UIImageViewLongBlock: UIImageView {
    var tapLongGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
    var actionBlock: (() -> ())?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setTouchActionBlock(_ actionBlock: @escaping () -> Void) {
        self.isUserInteractionEnabled = true
        tapLongGesture = UILongPressGestureRecognizer.init(target: self, action:#selector(didTapWithGesture))
        tapLongGesture.minimumPressDuration = 0.5
        self.addGestureRecognizer(tapLongGesture)
        self.actionBlock = actionBlock
    }
    
    @objc func didTapWithGesture(_ tapGesture: UILongPressGestureRecognizer) {
        if let actionBlock = actionBlock {
            actionBlock()
        }
    }
    
    
}
