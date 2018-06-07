//
//  ClvService.swift
//  Employee
//
//  Created by Thanh Tuan on 3/15/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ClvService: Base_CollectionView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(ClvServiceCell.self, forCellWithReuseIdentifier: "ClvServiceCell")
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvServiceCell", for: indexPath) as! ClvServiceCell
        cell.setupData(indexPath, arrData: self.arrDataClv)
        return cell
    }
    
}

class ClvServiceCell: Base_CollectionViewCell {
    let vwContentCategory = UIView.initUIViewAutoLayout()
    let imvCategory = UIImageView.initUIImageViewAutoLayout()
    let lblCategory = UILabel.initUILableAutoLayout()
    override func addControl() {
        self.imvCategory.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(vwContentCategory)
        vwContentCategory.addSubview(imvCategory)
        contentView.addSubview(lblCategory)
        self.lblCategory.textAlignment = .center
        AddLineBorder.addBottomLine(contentView, color: 0xffffff)
        AddLineBorder.addRightLine(contentView, color: 0xffffff)
    }
    override func setupLayout() {
        AutoLayoutCommon.setLayoutFullWidthSuperView(vwContentCategory)
        AutoLayoutCommon.setLayoutFullWidthSuperView(lblCategory)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[vwContentCategory][lblCategory(==54)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["vwContentCategory":vwContentCategory,"lblCategory":lblCategory]))
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

class ClvServiceFlowLayout: UICollectionViewFlowLayout,UICollectionViewDelegateFlowLayout {
    
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
            self.itemSize = CGSize(width: itemWidth()/2, height: itemWidth()/2)
        }
        get {
            return CGSize(width: itemWidth()/2, height: itemWidth()/2 )
        }
    }
}

