//
//  ViewHomePage_ClvCategoryItem.swift
//  Employee
//
//  Created by Thanh Tuan on 3/13/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ViewHomePage_ClvCategoryItem: UIView, Delegate_BaseCollectionView {

    var clvCategoryItem : ClvCategoryItem!
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(frame: CGRect,superView : UIView) {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        superView.addSubview(self)
        addControl(superView)
        setupLayout(superView)
    }
    func addControl(_ superView:UIView) {
        clvCategoryItem = ClvCategoryItem.init(frame: CGRect.zero, collectionViewLayout: ClvCategoryItemFlowLayout())
        clvCategoryItem.isPagingEnabled = true
        clvCategoryItem.delegate_ClvBase = self
        clvCategoryItem.showsHorizontalScrollIndicator = false
        self.addSubview(clvCategoryItem)
    }
    func setupLayout(_ superView:UIView) {
        AutoLayoutCommon.setLayoutFullWidthSuperView(self)
        AutoLayoutCommon.setLayoutFullSuperView(clvCategoryItem)
    }

}

class ClvCategoryItem: Base_CollectionView {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(ClvCategoryItemCell.self, forCellWithReuseIdentifier: "ClvCategoryItemCell")
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvCategoryItemCell", for: indexPath) as! ClvCategoryItemCell
        cell.setupData(indexPath, arrData: self.arrDataClv)
        return cell
    }
    
}

class ClvCategoryItemCell: Base_CollectionViewCell {
    let vwContentCategory = UIView.initUIViewAutoLayout()
    let imvCategory = UIImageView.initUIImageViewAutoLayout()
    let lblCategory = UILabel.initUILableAutoLayout()
    override func addControl() {
        self.imvCategory.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(vwContentCategory)
        vwContentCategory.addSubview(imvCategory)
        imvCategory.contentMode = .scaleAspectFit
        contentView.addSubview(lblCategory)
        self.lblCategory.textAlignment = .center
        AddLineBorder.addBottomLine(contentView, color: 0xffffff)
        AddLineBorder.addRightLine(contentView, color: 0xffffff)
    }
    override func setupLayout() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwContentCategory)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblCategory)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[vwContentCategory][lblCategory(==30)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwContentCategory":vwContentCategory,"lblCategory":lblCategory]))
        setupLayoutViewContentCategory()
    }
    func setupLayoutViewContentCategory() {
        AutoLayoutCommon.setLayoutWidthAPartWidthSuperView(imvCategory, part: 0.5)
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(imvCategory)
        AutoLayoutCommon.setLayoutCenterSuperView(imvCategory)
    }
    override func setupUI(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        
    }
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrCategory = arrData else {
            return
        }
        if let category = arrCategory.object(at: indexPath.row) as? ProductCategory {
            self.imvCategory.image = category.photo
            self.lblCategory.text = category.name
        }
    }
}

class ClvCategoryItemFlowLayout: UICollectionViewFlowLayout,UICollectionViewDelegateFlowLayout {
    
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
            self.itemSize = CGSize(width: itemWidth()/3, height: itemWidth()/3)
        }
        get {
            return CGSize(width: itemWidth()/3, height: itemWidth()/3 )
        }
    }
}
