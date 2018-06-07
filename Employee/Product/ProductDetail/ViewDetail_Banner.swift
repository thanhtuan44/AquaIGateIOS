//
//  ViewDetail_Banner.swift
//  Employee
//
//  Created by Thanh Tuan on 4/11/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

//
//  HomePage_Banner.swift
//  Employee
//
//  Created by Thanh Tuan on 3/7/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ViewDetail_Banner: UIView, Delegate_BaseCollectionView, UIScrollViewDelegate {
    var clvBanner : ClvDetailBanner!
    var pageControl : UIPageControl = UIPageControl.initUIPageControlAutoLayout()
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
        clvBanner = ClvDetailBanner.init(frame: CGRect.zero, collectionViewLayout: ClvDetailBannerBannerFlowLayout())
        clvBanner.isPagingEnabled = true
        clvBanner.delegate_ClvBase = self
        clvBanner.showsHorizontalScrollIndicator = false
        self.addSubview(clvBanner)
        pageControl.currentPageIndicatorTintColor = Utilities.UIColorFromRGB(Constant.COLOR_AQUA)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.numberOfPages = 0
        self.addSubview(pageControl)
        self.bringSubview(toFront: pageControl)
    }
    func setupLayout(_ superView:UIView) {
        AutoLayoutCommon.setLayoutFullWidthSuperView(self)
        AutoLayoutCommon.setLayoutHeightEqualWidthItSelf(self)
        AutoLayoutCommon.setLayoutFullSuperView(clvBanner)
        AutoLayoutCommon.setLayoutFullWidthSuperView(pageControl)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[pageControl(==44)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["pageControl":pageControl]))
    }
    func reloadData() {
        self.clvBanner.reloadData()
        pageControl.numberOfPages = (self.clvBanner.arrDataClv?.count)!
    }
}

class ClvDetailBanner: Base_CollectionView {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(ClvDetailBannerBannerCell.self, forCellWithReuseIdentifier: "ClvDetailBannerBannerCell")
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClvDetailBannerBannerCell", for: indexPath) as! ClvDetailBannerBannerCell
        cell.setupData(indexPath, arrData: self.arrDataClv)
        return cell
    }
}

class ClvDetailBannerBannerCell: Base_CollectionViewCell {
    let imvBanner = UIImageView.initUIImageViewAutoLayout()
    
    override func addControl() {
        contentView.addSubview(imvBanner)
        self.imvBanner.contentMode = UIViewContentMode.scaleAspectFill
    }
    override func setupLayout() {
        AutoLayoutCommon.setLayoutFullSuperView(imvBanner)
    }
    override func setupUI(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        
    }
    override func setupData(_ indexPath: IndexPath, arrData: NSMutableArray?) {
        guard let arrImages = arrData else {
            return
        }
        if let image = arrImages.object(at: indexPath.row) as? String {
            self.imvBanner.sd_setImage(with: URL(string: String(format: "%@",image)), placeholderImage:UIImage(named: ""))
        }
    }
}

class ClvDetailBannerBannerFlowLayout: UICollectionViewFlowLayout,UICollectionViewDelegateFlowLayout {
    
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
        scrollDirection = .horizontal
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

