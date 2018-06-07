//
//  AddLineBorder.swift
//  favant
//
//  Created by MinhAnh on 6/27/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit

class AddLineBorder: NSObject {
    class func addTopLine(_ view :UIView,color : NSInteger) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lineBase(==1)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func addTopLine(_ view :UIView,color : NSInteger,kWidth: CGFloat) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        let metrics = Dictionary(dictionaryLiteral: ("kWidth",kWidth));
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lineBase(==kWidth)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
    }
    class func addLeftLine(_ view :UIView,color : NSInteger) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[lineBase(==1)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func addLeftLine(_ view :UIView,color : NSInteger,kWidth: CGFloat) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        let metrics = Dictionary(dictionaryLiteral: ("kWidth",kWidth));
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[lineBase(==kWidth)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func addBottomLine(_ view :UIView,color : NSInteger) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineBase(==1)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func addBottomLine(_ view :UIView,color : NSInteger,kWidth: CGFloat) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        let metrics = Dictionary(dictionaryLiteral: ("kWidth",kWidth));
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineBase(==kWidth)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
    }
    class func addRightLine(_ view :UIView,color : NSInteger) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[lineBase(==1)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func addRightLine(_ view :UIView,color : NSInteger,kWidth: CGFloat) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        let metrics = Dictionary(dictionaryLiteral: ("kWidth",kWidth));
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[lineBase(==kWidth)]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
    }
    class func addCenterHorLine(_ view :UIView,color : NSInteger) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineBase(==1)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints([NSLayoutConstraint(item: lineBase, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)]);
    }
    class func addCenterVerLine(_ view :UIView,color : NSInteger) {
        let lineBase : UIView =  UIView.initUIViewAutoLayout();
        lineBase.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        view.addSubview(lineBase);
        view.bringSubview(toFront: lineBase);
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["lineBase"] = lineBase
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[lineBase(==1)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lineBase]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewBindingsDict))
        view.addConstraints([NSLayoutConstraint(item: lineBase, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)]);
    }
    
}
