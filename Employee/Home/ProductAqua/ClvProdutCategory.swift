//
//  Product.swift
//  Employee
//
//  Created by Thanh Tuan on 3/13/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ClvProdutCategory: Base_CollectionView {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(ClvProdutCategoryCell.self, forCellWithReuseIdentifier: "ClvProdutCategoryCell")
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvProdutCategoryCell", for: indexPath) as! ClvProdutCategoryCell
        cell.setupData(indexPath, arrData: self.arrDataClv)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let arrData = self.arrDataClv else {
            return
        }
        self.delegate_ClvBase?.didSelect_BaseClvItemAtIndexPath!(collectionView, indexPath: indexPath, arrData: arrData)
    }

}
class ClvProdutCategoryCell: Base_CollectionViewCell {
    let vwContentCategory = UIView.initUIViewAutoLayout()
    let imvCategory = UIImageView.initUIImageViewAutoLayout()
    let lblCategoryID = UILabel.initUILableAutoLayout()
    let lblCategoryType = UILabel.initUILableAutoLayout()
    let lblCategoryInfo = UILabel.initUILableAutoLayout()
    
    override func addControl() {
        self.imvCategory.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(vwContentCategory)
        vwContentCategory.addSubview(imvCategory)
        contentView.addSubview(lblCategoryID)
        contentView.addSubview(lblCategoryType)
        contentView.addSubview(lblCategoryInfo)
        self.lblCategoryID.textAlignment = .center
        self.lblCategoryType.textAlignment = .center
        self.lblCategoryInfo.textAlignment = .center
        AddLineBorder.addBottomLine(contentView, color: 0xffffff)
        AddLineBorder.addLeftLine(contentView, color: 0xffffff)
        imvCategory.contentMode = UIViewContentMode.scaleAspectFit
//        lblCategoryID.numberOfLines = 0
    }
    override func setupLayout() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwContentCategory)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblCategoryID, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblCategoryType, kLeft: 10, kRight: 10)
        AutoLayoutCommon.setLayoutWidthWithMarginSuperView(lblCategoryInfo, kLeft: 10, kRight: 10)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwContentCategory][lblCategoryID(==25@999)][lblCategoryType(==25@999)][lblCategoryInfo(==25@999)]-5-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwContentCategory":vwContentCategory,"lblCategoryID":lblCategoryID,"lblCategoryType":lblCategoryType,"lblCategoryInfo":lblCategoryInfo]))
        setupLayoutViewContentCategory()
    }
    func setupLayoutViewContentCategory() {
        AutoLayoutCommon.setLayoutSuperViewWithMargin(imvCategory, kTop: 10, kLeft: 10, kBottom: 10, kRight: 10)
        AutoLayoutCommon.setLayoutCenterSuperView(imvCategory)
    }
    override func setupUI(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        
    }
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrCategory = arrData else {
            return
        }
        if let product = arrCategory.object(at: indexPath.row) as? Model_Product {
            imvCategory.sd_setImage(with: URL(string: String(format: "%@",product.imageUrl)), placeholderImage:UIImage(named: "iconLogoAqua"))
            self.lblCategoryID.text = product.idProduct
            self.lblCategoryType.text = product.type
            self.lblCategoryInfo.text = product.info
        }
    }
}
class ClvProdutCategoryFlowLayout: UICollectionViewFlowLayout,UICollectionViewDelegateFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = .vertical
    }
    
    func itemWidth() -> CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.frame.width
    }
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth()/2, height: itemWidth()/2 + 100)
        }
        get {
            return CGSize(width: itemWidth()/2, height: itemWidth()/2 + 100)
        }
    }
}

/*
class ClvProdutCategory: Base_CollectionView {
    var index_Select : Int = 0
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(ClvProdutCategoryCell.self, forCellWithReuseIdentifier: "ClvProdutCategoryCell")
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvProdutCategoryCell", for: indexPath) as! ClvProdutCategoryCell
        cell.setupData(indexPath, arrData: self.arrDataClv)
        cell.setupUI(index_Select, indexPath: indexPath, arrData: self.arrDataClv)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let arrData = self.arrDataClv else {
            return
        }
        index_Select = indexPath.row
        self.reloadData()
        self.delegate_ClvBase?.didSelect_BaseClvItemAtIndexPath!(collectionView, indexPath: indexPath, arrData: arrData)
    }
}

class ClvProdutCategoryCell: Base_CollectionViewCell {
    let vwBackGround = UIView.initUIViewAutoLayout()
    let vwContentCategory = UIView.initUIViewAutoLayout()
    let imvCategory = UIImageView.initUIImageViewAutoLayout()
    let lblCategory = UILabel.initUILableAutoLayout()
    override func addControl() {
        self.imvCategory.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(vwBackGround)
        vwBackGround.addSubview(vwContentCategory)
        vwContentCategory.addSubview(imvCategory)
        vwBackGround.addSubview(lblCategory)
        self.lblCategory.textColor = UIColor.white
        self.lblCategory.textAlignment = .center
        lblCategory.numberOfLines = 0
        lblCategory.adjustsFontSizeToFitWidth = true
        AddLineBorder.addBottomLine(contentView, color: 0xffffff)
        AddLineBorder.addLeftLine(contentView, color: 0xffffff)
        vwBackGround.layer.cornerRadius = 4.0
        vwBackGround.clipsToBounds = true
    }
    override func setupLayout() {
        AutoLayoutCommon.setLayoutSuperViewWithMargin(vwBackGround, kTop: 10, kLeft: 10, kBottom: 10, kRight: 10)
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwContentCategory)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblCategory)
        vwBackGround.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(==5@999)-[vwContentCategory][lblCategory(==34)]-(==5@999)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwContentCategory":vwContentCategory,"lblCategory":lblCategory]))
        setupLayoutViewContentCategory()
    }
    func setupLayoutViewContentCategory() {
        AutoLayoutCommon.setLayoutWidthAPartWidthSuperView(imvCategory, part: 0.5)
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(imvCategory)
        AutoLayoutCommon.setLayoutCenterSuperView(imvCategory)
    }
    
    func setupUI(_ indexSelect: Int,indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let _ = arrData else {
            return
        }
        if(indexPath.row == indexSelect) {
            vwBackGround.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        }else{
            vwBackGround.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA).withAlphaComponent(0.5)
        }
    }
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrCategory = arrData else {
            return
        }
        if let category = arrCategory.object(at: indexPath.row) as? ProductCategoryWithSub {
            self.imvCategory.image = category.photo
            self.lblCategory.text = category.name
        }
    }
}

class ClvProdutCategoryFlowLayout: UICollectionViewFlowLayout,UICollectionViewDelegateFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = .vertical
    }
    
    func itemWidth() -> CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        return collectionView.frame.width
    }
    
    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth(), height: itemWidth())
        }
        get {
            return CGSize(width: itemWidth(), height: itemWidth())
        }
    }
}
*/
