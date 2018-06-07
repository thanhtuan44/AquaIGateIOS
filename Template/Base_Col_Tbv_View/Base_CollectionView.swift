//
//  AQUA_TabbarController.swift
//  Employee
//
//  Created by Thanh Tuan on 3/7/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
@objc protocol Delegate_BaseCollectionView: class {
    @objc optional func didSelect_BaseClvItemAtIndexPath(_ collectionview:UICollectionView, indexPath : IndexPath, arrData: AnyObject?)
    @objc optional func baseScrollViewDidScroll(_ scrollView: UIScrollView)
}
class Base_CollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate {
    
    var clvLoading : CircleLoading?
    var arrDataClv : NSMutableArray? = []
    weak var delegate_ClvBase:Delegate_BaseCollectionView?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.white
        self.delegate = self;
        self.dataSource = self;
    }
    
    // MARK: collectionView methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let number = self.arrDataClv?.count else {
            return 0
        }
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Base_CollectionViewCell", for: indexPath) as! Base_CollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let arrData = self.arrDataClv {
            self.delegate_ClvBase?.didSelect_BaseClvItemAtIndexPath?(collectionView, indexPath: indexPath, arrData: arrData)
        }
    }
    func showCircleLoadingView() {
        clvLoading = CircleLoading.init(frame: CGRect.zero, superview: self, withClear: false)
    }
    func stopCircleLoadingView() {
        if(clvLoading != nil) {
            clvLoading?.removeFromSuperview()
            clvLoading = nil
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.delegate_ClvBase?.baseScrollViewDidScroll?(scrollView)
    }
    override func reloadData() {
        guard let _ = self.arrDataClv?.count else {
            return
        }
        super.reloadData()
    }
}


class Base_CollectionViewCell: UICollectionViewCell {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        addControl()
        setupLayout()
    }
    func addControl() {
        
    }
    
    func setupLayout() {
        
    }
    
    func setupUI(_ indexPath : IndexPath, arrData: NSMutableArray?) {
        
    }
    
    func setupData(_ indexPath : IndexPath, arrData: NSMutableArray?) {
        
    }
}
