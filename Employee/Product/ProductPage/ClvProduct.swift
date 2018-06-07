//
//  ClvProduct.swift
//  Employee
//
//  Created by Thanh Tuan on 4/11/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
class ClvProdut: Base_CollectionView {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(ClvProdutCell.self, forCellWithReuseIdentifier: "ClvProdutCell")
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvProdutCell", for: indexPath) as! ClvProdutCell
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
class ClvProdutCell: Base_CollectionViewCell {
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
        AddLineBorder.addBottomLine(contentView, color: 0xffffff)
        AddLineBorder.addRightLine(contentView, color: 0xffffff)
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
            self.lblCategoryID.text = product.type
            self.lblCategoryType.text = String(format:"Giá: %@ vnđ",product.price)
            self.lblCategoryInfo.text = String(format:"Số lượng: %@",product.numberSale)
        }
    }
}
class ClvProdutFlowLayout: UICollectionViewFlowLayout,UICollectionViewDelegateFlowLayout {
    
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
