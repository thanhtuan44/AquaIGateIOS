//
//  AutoLayoutCommon.swift
//  favant
//
//  Created by MinhAnh on 6/23/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class AutoLayoutCommon: NSObject {
    class func setLayoutCenterSuperView(_ view :UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)]);
    }
    class func setLayoutCenterSuperViewWithSize(_ view :UIView,size:CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)]);
        let metrics = Dictionary(dictionaryLiteral: ("size",size));
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view(==size)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view(==size)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
    }
    class func setLayoutFullSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)]);
    }
    class func setLayoutFullSuperViewTemp(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)]);
    }
    class func setLayoutFullSuperViewVFL(_ view: UIView) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func setLayoutCenterHorizontalSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)]);
    }
    class func setLayoutCenterHorizontalSuperViewWithSize(_ view:UIView, size:CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)]);
        let metrics = Dictionary(dictionaryLiteral: ("size",size));
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view(==size)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view(==size)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
    }
    class func setLayoutCenterVerticalSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)]);
    }
    class func setLayoutCenterVerticalSuperViewWithSize(_ view: UIView, size:CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)]);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        let metrics = Dictionary(dictionaryLiteral: ("size",size));
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view(==size)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view(==size)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
    }
    class func setLayoutFullWithNavigationSuperView(_ view: UIView) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func setLayoutSuperViewWithMargin(_ view:UIView,kTop:CGFloat,kLeft:CGFloat,kBottom:CGFloat,kRight:CGFloat) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        let metrics = Dictionary(dictionaryLiteral: ("kTop",kTop),("kLeft",kLeft),("kBottom",kBottom),("kRight",kRight));
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-kLeft-[view]-kRight-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-kTop-[view]-kBottom-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
    }
    class func setLayoutHeightView(_ view:UIView,kHeight:CGFloat) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        let metrics = Dictionary(dictionaryLiteral: ("kHeight",kHeight));
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[view(==kHeight)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
    }
    class func setLayoutWidthView(_ view:UIView,kWidth:CGFloat) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        let metrics = Dictionary(dictionaryLiteral: ("kWidth",kWidth));
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[view(==kWidth)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
    }
    class func setLayoutHeightConstraintsSuperView(_ view: UIView, constantValue:CGFloat) -> NSLayoutConstraint {
        let layoutConstraints : NSLayoutConstraint =  NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: constantValue)
        view.addConstraint(layoutConstraints)
        return layoutConstraints;
       
    }
    class func setLayoutHeightConstraintsSuperView(_ view: UIView, constantValue:CGFloat, priority:Int32) -> NSLayoutConstraint {
        let layoutConstraints : NSLayoutConstraint =  NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: constantValue)
        layoutConstraints.priority = UILayoutPriority.init(Float(priority)) 
        view.addConstraint(layoutConstraints)
        return layoutConstraints;
        
    }
    class func setLayoutWidthConstraintsSuperView(_ view: UIView, constantValue:CGFloat) -> NSLayoutConstraint {
        let layoutConstraints : NSLayoutConstraint =  NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: constantValue)
        view.addConstraint(layoutConstraints)
        return layoutConstraints;
        
    }
    class func setLayoutWidthAPartWidthSuperView(_ view: UIView, part:CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.width, multiplier: part, constant: 0)]);
    }
    class func setLayoutWidthAPartWidthSuperView(_ view: UIView,superview : UIView, part:CGFloat) {
        superview.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: superview, attribute: NSLayoutAttribute.width, multiplier: part, constant: 0)]);
    }
    
    class func setLayoutHeightAPartHeightSuperView(_ view: UIView, part:CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.height, multiplier: part, constant: 0)]);
    }
    class func setLayoutHeightAPartHeightSuperView(_ view: UIView,superview : UIView, part:CGFloat) {
        superview.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: superview, attribute: NSLayoutAttribute.height, multiplier: part, constant: 0)]);
    }
    class func setLayoutHeightAPartWidthSuperView(_ view: UIView, part:CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.width, multiplier: part, constant: 0)]);
    }
    class func setLayoutHeightAPartWidthSuperView(_ view: UIView,superview : UIView, part:CGFloat) {
        superview.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: superview, attribute: NSLayoutAttribute.width, multiplier: part, constant: 0)]);
    }
    class func setLayoutWidthAPartHeightSuperView(_ view: UIView, part:CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.height, multiplier: part, constant: 0)]);
    }
    class func setLayoutWidthAPartHeightSuperView(_ view: UIView,superview : UIView, part:CGFloat) {
        superview.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: superview, attribute: NSLayoutAttribute.height, multiplier: part, constant: 0)]);
    }
    
    class func setLayoutWidthEqualHeightItSelf(_ view: UIView) {
        view.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)]);
    }
    class func setLayoutWidthApartHeightItSelf(_ view: UIView, part:CGFloat) {
        view.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.height, multiplier: part, constant: 0)]);
    }
    class func setLayoutHeightEqualWidthItSelf(_ view: UIView) {
        view.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0)]);
    }
    class func setLayoutHeightApartWidthItSelf(_ view: UIView, part:CGFloat) {
        view.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.width, multiplier: part, constant: 0)]);
    }
    class func setLayoutFullWidthSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view":view]))
    }
    class func setLayoutWidthWithMarginSuperView(_ view: UIView, kLeft: CGFloat, kRight: CGFloat) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        let metrics = Dictionary(dictionaryLiteral: ("kLeft",kLeft),("kRight",kRight));
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -(kLeft+kRight))]);
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-kLeft-[view]-kRight-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: ["view":view]))
    }
    class func setLayoutFullHeightSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view":view]))
    }
    class func setLayoutHeightWithMarginSuperView(_ view: UIView, kTop: CGFloat, kBottom: CGFloat) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        let metrics = Dictionary(dictionaryLiteral: ("kTop",kTop),("kBottom",kBottom));
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.height, multiplier: 1, constant: -(kTop+kBottom))]);
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-kTop-[view]-kBottom-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: ["view":view]))
    }
    class func setLayoutWidthEqualHeightSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view":view]))
    }
    class func setLayoutFullHeightWithNavigationSuperView(_ view: UIView) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[view]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func setScrollViewNeed(_ view: UIView) {
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["view"] = view
        view.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-64-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func setLayoutCornerTopLeftSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)]);
    }
    class func setLayoutCornerTopLeftSuperView(_ view: UIView,kValue : CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: kValue)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: kValue)]);
    }
    class func setLayoutCornerTopRightSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0)]);
    }
    class func setLayoutCornerTopRightSuperView(_ view: UIView,kValue : CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: kValue)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -kValue)]);
    }
    class func setLayoutCornerTopRightSuperView(_ view: UIView,kTop : CGFloat, kRight : CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: kTop)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -kRight)]);
    }
    class func setLayoutCornerBottomLeftSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)]);
    }
    class func setLayoutCornerBottomLeftSuperView(_ view: UIView,kValue : CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -kValue)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: kValue)]);
    }
    class func setLayoutCornerBottomRightSuperView(_ view: UIView) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0)]);
    }
    class func setLayoutCornerBottomRightSuperView(_ view: UIView,kValue : CGFloat) {
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -kValue)]);
        view.superview?.addConstraints([NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view.superview, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -kValue)]);
    }
}
