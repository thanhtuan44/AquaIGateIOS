//
//  AQUA_TabbarController.swift
//  Employee
//
//  Created by Thanh Tuan on 3/7/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SDWebImage

@objc protocol Delegate_BaseTableView: class {
    @objc optional func didSelect_BaseTbvItemAtIndexPath(_ tableView:UITableView, indexPath : IndexPath, arrData: AnyObject?)
}
class Base_TableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    var tbvLoading : CircleLoading?
    var arrDataTbv : NSMutableArray? = []
    
    
    weak var delegate_BaseTableView:Delegate_BaseTableView?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: CGRect.zero, style: style)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.separatorColor = UIColor.white
        self.delegate = self;
        self.dataSource = self;
        self.register(Base_TableViewCell.self, forCellReuseIdentifier: "Base_TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        guard let number = self.arrDataTbv?.count else {
            return 0
        }
        return number
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Base_TableViewCell", for: indexPath) as! Base_TableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let arrData = self.arrDataTbv else {
            return
        }
        self.delegate_BaseTableView?.didSelect_BaseTbvItemAtIndexPath?(tableView, indexPath: indexPath, arrData: arrData)
    }
    func showCircleLoadingView() {
        tbvLoading = CircleLoading.init(frame: CGRect.zero, superview: self, withClear: false)
    }
    func stopCircleLoadingView() {
        if(tbvLoading != nil) {
            tbvLoading?.removeFromSuperview()
            tbvLoading = nil
        }
    }
    
    override func reloadData() {
        guard let _ = self.arrDataTbv?.count else {
            return 
        }
        super.reloadData()
    }
}


class Base_TableViewCell : UITableViewCell {
    let vwContentCell = UIView.initUIViewAutoLayout()
    let line = UILabel.initUILableAutoLayout()
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        selectionStyle = .none
        addControl()
        setupLayout()
        contentView.addSubview(vwContentCell)
        contentView.addSubview(line)
        line.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        AutoLayoutCommon.setLayoutFullWidthSuperView(line)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwContentCell)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwContentCell][line(==1)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwContentCell":vwContentCell,"line":line]))
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func addControl() {
        
    }
    
    func setupLayout() {
        
    }
    
    func setupUI(_ indexPath:IndexPath,arrData:NSMutableArray?) {

    }
    
    func setupData(_ indexPath:IndexPath,arrData:NSMutableArray?) {
        
    }
}
