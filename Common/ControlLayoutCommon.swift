//
//  ControlLayoutCommon.swift
//  favant
//
//  Created by MinhAnh on 6/27/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit
class ControlLayoutCommon: NSObject {
    
}
extension UIViewWithLoading {
    class func initUIViewWithLoadingBlockAutoLayout()->UIViewWithLoading {
        let view : UIViewWithLoading = UIViewWithLoading.init(frame: CGRect.zero);
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }

}
extension UIView {
    
    class func initUIViewAutoLayout()->UIView {
        
        let view : UIView = UIView.init(frame: CGRect.zero);
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }
    func setBorderView(_ color : UIColor) {
        self.layer.borderColor = color.cgColor;
        self.layer.borderWidth = 1;
    }
    
}
extension UIViewBlock {
    class func initUIViewBlockAutoLayout()->UIViewBlock {
        let view : UIViewBlock = UIViewBlock.init(frame: CGRect.zero);
        view.translatesAutoresizingMaskIntoConstraints = false;
        return view;
    }
}

extension UIScrollView {
    class func initUIScrollViewAutoLayout()->UIScrollView {
        let scrollView : UIScrollView = UIScrollView.init(frame: CGRect.zero);
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        return scrollView;
    }
}
extension UILabel {
    class func initUILableAutoLayout()->UILabel {
        let label : UILabel = UILabel.init(frame: CGRect.zero);
        label.font = UIFont(name: Constant.FONT_APP, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false;
        return label;
    }
}
extension UITextView {
    class func initUITextViewAutoLayout()->UITextView {
        let textview : UITextView = UITextView.init(frame: CGRect.zero);
        textview.font = UIFont(name: Constant.FONT_APP, size: 16)
        textview.translatesAutoresizingMaskIntoConstraints = false;
        return textview;
    }
    func setBorder(_ color : UIColor) {
        self.layer.borderColor = color.cgColor;
        self.layer.borderWidth = 1;
    }
}
extension UITextField {
    class func initUITextFieldAutoLayout()->UITextField {
        let textfield : UITextField = UITextField.init(frame: CGRect.zero);
        textfield.font = UIFont(name: Constant.FONT_APP, size: 16)
        textfield.translatesAutoresizingMaskIntoConstraints = false;
        return textfield;
    }
}
extension UITextFieldBlock {
    class func initUITextFieldBlockAutoLayout()->UITextFieldBlock {
        let textfield : UITextFieldBlock = UITextFieldBlock.init(frame: CGRect.zero);
        textfield.font = UIFont(name: Constant.FONT_APP, size: 16)
        textfield.translatesAutoresizingMaskIntoConstraints = false;
        textfield.autocorrectionType = .no
        return textfield;
    }
}
extension UITableView {
    class func initUITableViewAutoLayout()->UITableView {
        let tableview : UITableView = UITableView.init(frame: CGRect.zero);
        tableview.translatesAutoresizingMaskIntoConstraints = false;
        return tableview;
    }
}
extension UICollectionView {
    class func initUICollectionViewAutoLayout()->UICollectionView {
        let collectionView : UICollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout());
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        return collectionView;
    }
    class func initUICollectionViewWithFlowAutoLayout(_ flowLayout: UICollectionViewFlowLayout)->UICollectionView {
        let collectionView : UICollectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout);
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        return collectionView;
    }
}
extension UIImageView {
    class func initUIImageViewAutoLayout()->UIImageView {
        let imageView : UIImageView = UIImageView.init(frame: CGRect.zero);
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView;
    }
}
extension UIButton {
    class func initUIButtonAutoLayout()->UIButton {
        let button : UIButton = UIButton(type: UIButtonType.roundedRect);
        button.tintColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.titleLabel?.font = UIFont(name: Constant.FONT_APP, size: 16)
        return button;
    }
}

extension UIButtonBlock {
    class func initUIButtonBlockAutoLayout()->UIButtonBlock {
        let button : UIButtonBlock = UIButtonBlock(type: UIButtonType.roundedRect);
        button.tintColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.titleLabel?.font = UIFont(name: Constant.FONT_APP, size: 16)
        return button;
    }
    func setBorder(_ color : UIColor) {
        self.layer.borderColor = color.cgColor;
        self.layer.borderWidth = 1;
    }

}

extension UISlider {
    class func initUISliderAutoLayout()->UISlider {
        let slider : UISlider = UISlider.init(frame: CGRect.zero);
        slider.translatesAutoresizingMaskIntoConstraints = false;
        return slider;
    }
}

extension UIPageControl {
    class func initUIPageControlAutoLayout()->UIPageControl {
        let pageController : UIPageControl = UIPageControl.init(frame: CGRect.zero);
        pageController.translatesAutoresizingMaskIntoConstraints = false;
        return pageController;
    }
}
extension UIProgressView {
    class func initUIProgressViewAutoLayout()->UIProgressView {
        let progress : UIProgressView = UIProgressView.init(frame: CGRect.zero)
        progress.translatesAutoresizingMaskIntoConstraints = false;
        return progress;
    }
}
extension NSMutableAttributedString{
    func setColorForText(_ textToFind: String?, withColor color: UIColor?) {
        guard let textToFind = textToFind else {
            return
        }
        guard let color = color else {
            return
        }
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
        }
    }
    func setColorAndFontForText(_ textToFind: String?,font :UIFont?, withColor color: UIColor?) {
        guard let textToFind = textToFind else {
            return
        }
        guard let font = font else {
            return
        }
        guard let color = color else {
            return
        }
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
            self.addAttribute(NSAttributedStringKey.font, value: font, range: range)
        }
    }
}
