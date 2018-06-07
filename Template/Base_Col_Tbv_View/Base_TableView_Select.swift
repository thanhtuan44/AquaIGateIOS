//
//  Base_TableView_Select.swift
//  Employee
//
//  Created by Thanh Tuan on 3/15/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
@objc protocol Delegate_BaseTableView_Select: class {
    @objc optional func didSelect_BaseTbvSelectItemAtIndexPath(_ tableView:UITableView, indexPath : IndexPath, arrData: AnyObject?)
}

class Base_TableView_Select: UITableView,UITableViewDelegate,UITableViewDataSource {
    var tbvLoading : CircleLoading?
    var arrDataTbv : NSMutableArray? = []
    var image_Select : String!
    var image_UnSelect : String!
    var index_Select : Int = -1
    weak var delegate_BaseTableView_Select:Delegate_BaseTableView_Select?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect,superView:UIView, data: NSMutableArray?,indexSelect:Int,style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        superView.addSubview(self);
        self.backgroundColor = UIColor.white
        self.delegate = self;
        self.dataSource = self;
        self.translatesAutoresizingMaskIntoConstraints = false
        self.arrDataTbv! = data!;
        self.image_Select = "iconSelected";
        self.image_UnSelect = "iconUnSelect";
        self.index_Select = indexSelect;
        self.register(TableMenuCell.self, forCellReuseIdentifier: "Cell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableMenuCell
        cell.nameLabel.text = self.arrDataTbv![(indexPath as NSIndexPath).row] as? String
        cell.setupImage(self.image_Select, imageUnSelect: self.image_UnSelect, indexPath: indexPath, indexSelect :self.index_Select)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        guard let number = self.arrDataTbv?.count else {
            return 0
        }
        return number
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let arrData = self.arrDataTbv {
            self.index_Select = (indexPath as NSIndexPath).row;
            self.reloadData()
            self.delegate_BaseTableView_Select?.didSelect_BaseTbvSelectItemAtIndexPath?(tableView, indexPath: indexPath, arrData: arrData)
        }
        
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

class Base_TableView_KeyValue_Select : Base_TableView_Select {
    override init(frame: CGRect,superView:UIView, data: NSMutableArray?,indexSelect:Int,style: UITableViewStyle) {
        super.init(frame: frame, superView: superView, data: data, indexSelect: indexSelect, style: style)
        superView.addSubview(self);
        self.backgroundColor = UIColor.white
        self.delegate = self;
        self.dataSource = self;
        self.translatesAutoresizingMaskIntoConstraints = false
        self.arrDataTbv! = data!;
        self.image_Select = "iconSelected";
        self.image_UnSelect = "iconUnSelect";
        self.index_Select = indexSelect;
        self.register(TableMenuCell.self, forCellReuseIdentifier: "Cell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableMenuCell
        if let arrDataTbv = self.arrDataTbv {
            if let object = arrDataTbv.object(at: indexPath.row) as? IdValueObject {
                cell.nameLabel.text = String(format:"%@",object.value)
            }
        }
        cell.setupImage(self.image_Select, imageUnSelect: self.image_UnSelect, indexPath: indexPath, indexSelect :self.index_Select)
        return cell
    }
}
class TableMenuCell: UITableViewCell {
    
    var nameLabel : UILabel = UILabel.initUILableAutoLayout()
    var imv : UIImageView = UIImageView.initUIImageViewAutoLayout()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.white
        selectionStyle = .none
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        imv.contentMode = UIViewContentMode.center
        contentView.addSubview(imv)
        setLayoutHeight()
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[nameLabel]-10-[imv(==44)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["nameLabel" : nameLabel,"imv" : imv]));
    }
    func setLayoutHeight() {
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(imv)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(imv)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(>=44)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["nameLabel" : nameLabel]));
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    func setupImage(_ imageSelect:String,imageUnSelect:String,indexPath:IndexPath,indexSelect :Int ) {
        if((indexPath as NSIndexPath).row == indexSelect) {
            imv.image = Utilities.imageWithImage(UIImage(named:imageSelect), scaledToSize: CGSize(width: 24, height: 24))
        }else{
            imv.image = UIImage(named:imageUnSelect)
        }
    }
    func setupImageAndLabel(_ imageSelect:String,imageUnSelect:String,indexPath:IndexPath,indexSelect :Int ) {
        if((indexPath as NSIndexPath).row == indexSelect) {
            imv.image = Utilities.imageWithImage(UIImage(named:imageSelect), scaledToSize: CGSize(width: 24, height: 24))
            nameLabel.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        }else{
            imv.image = UIImage(named:imageUnSelect)
            nameLabel.textColor = UIColor.black
        }
    }
    func setupUI(_ indexPath:IndexPath,arrData:NSMutableArray) {
        
    }
    
    func setupData(_ indexPath:IndexPath,arrData:NSMutableArray) {
        
    }
    
    
}
