//
//  TbvProductCategory.swift
//  Employee
//
//  Created by Thanh Tuan on 4/4/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class TbvProductCategory: Base_TableView {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(frame: CGRect,superView:UIView) {
        super.init(frame: CGRect.zero, style: .plain)
        superView.addSubview(self);
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.delegate = self;
        self.dataSource = self;
        self.separatorColor = UIColor.clear
        self.register(TbvProductCategoryCell.self, forCellReuseIdentifier: "TbvProductCategoryCell")
        self.register(TbvProductCategoryOddCell.self, forCellReuseIdentifier: "TbvProductCategoryOddCell")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if(indexPath.row % 2 == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "TbvProductCategoryOddCell", for: indexPath) as! TbvProductCategoryOddCell
            cell.setupData(indexPath, arrData: self.arrDataTbv)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TbvProductCategoryCell", for: indexPath) as! TbvProductCategoryCell
            cell.setupData(indexPath, arrData: self.arrDataTbv)
            return cell
        }
        
    }
    
}

class TbvProductCategoryOddCell: TbvProductCategoryCell {
    override func setVerticalArrange() {
        vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[vwContentInfo(==imvProduct)][imvProduct]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvProduct":imvProduct,"vwContentInfo":vwContentInfo]))
    }
}
class TbvProductCategoryCell: Base_TableViewCell {
    let imvProduct = UIImageView.initUIImageViewAutoLayout()
    let vwContentInfo = UIView.initUIViewAutoLayout()
    let lblCategory = UILabel.initUILableAutoLayout()
    let lblInfo = UILabel.initUILableAutoLayout()
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func addControl() {
        vwContentCell.addSubview(imvProduct)
        vwContentCell.addSubview(vwContentInfo)
        vwContentInfo.addSubview(lblInfo)
        vwContentInfo.addSubview(lblCategory)
        lblCategory.numberOfLines = 0
        lblCategory.textColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        lblInfo.numberOfLines = 0
        lblCategory.font = UIFont(name: Constant.FONT_APP, size: 18)
        lblInfo.font = UIFont(name: Constant.FONT_APP, size: 14)
        lblCategory.textAlignment = .center
        imvProduct.contentMode = .scaleAspectFit
    }
    
    override func setupLayout() {
        AutoLayoutCommon.setLayoutWidthEqualHeightItSelf(imvProduct)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(imvProduct, kTop: 10, kBottom: 10)
        AutoLayoutCommon.setLayoutCenterVerticalSuperView(vwContentInfo)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblCategory, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblInfo, kLeft: 10, kRight: 10)
        setVerticalArrange()
        vwContentInfo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lblCategory]-5-[lblInfo]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["lblCategory":lblCategory,"lblInfo":lblInfo]))
    }
    
    func setVerticalArrange() {
        vwContentCell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[imvProduct(==vwContentInfo)][vwContentInfo]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["imvProduct":imvProduct,"vwContentInfo":vwContentInfo]))
    }
    
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrData = arrData else {
            return
        }
        if let subCate = arrData.object(at: indexPath.row) as? ProductSubCategory {
            self.lblCategory.text = subCate.name
            self.lblInfo.text = subCate.info
            imvProduct.sd_setImage(with: URL(string: String(format: "%@",subCate.photo)), placeholderImage:UIImage(named: "iconLogoAqua"))
//            self.imvProduct.sd_setImage(with: URL(string: String(format: "%@",subCate.photo))) { (image, error, cache, urls) in
//                if (error != nil) {
//                    self.imvProduct.image = UIImage(named: "iconLogoAqua")
//                    self.imvProduct.contentMode = .center
//                } else {
//                    self.imvProduct.image = image
//                }
//            }
        }
    }

}


