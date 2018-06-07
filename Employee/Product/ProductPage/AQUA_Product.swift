//
//  AQUA_Product.swift
//  Employee
//
//  Created by Thanh Tuan on 3/8/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class AQUA_Product: Base_ScrollViewController, Delegate_BaseCollectionView {
    
    var clvProduct : ClvProdut!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClvProdutCategoryItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getListProduct()
    }
    func setupClvProdutCategoryItem(){
        self.clvProduct = ClvProdut.init(frame: CGRect.zero, collectionViewLayout: ClvProdutFlowLayout())
        self.view.addSubview(clvProduct)
        clvProduct.delegate_ClvBase = self
        AutoLayoutCommon.setLayoutFullWidthSuperView(self.clvProduct)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[clvProduct]-49-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["clvProduct":clvProduct]))
    }
    func setupData() {
        if(self.clvProduct.arrDataClv?.count == 0) {
            self.showViewNoData(title: "Hiện tại chưa có sản phẩm bán cho nhân viên\nCông ty sẽ cố gắng sắp xếp trong thời gian gần nhât", haveTabbar: true)
        }else {
            self.clvProduct.reloadData()
        }
    }
    func didSelect_BaseClvItemAtIndexPath(_ collectionview: UICollectionView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(indexPath.row < arrData.count) {
            if let product = arrData.object(at: indexPath.row) as? Model_Product {
                if let productDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as? AQUA_ProductDetail {
                    productDetailVC.hidesBottomBarWhenPushed = true
                    productDetailVC.idProduct = product.idProduct
                    self.navigationController?.pushViewController(productDetailVC, animated: true)
                }
            }
        }
    }
    
}
extension AQUA_Product {
    func getListProduct() {
        if((self.clvProduct.arrDataClv?.count)! > 0){
            self.clvProduct.arrDataClv?.removeAllObjects()
        }
        self.showCircleLoadingInVC()
        let url = String(format: "%@%@", Constant.DOMAIN,API.GET_LIST_PRODUCT)
        AQUA_Request.sharedRequest.getDataWithHeader(url, header: ["AuthorizedToken":AQUA_User.shared.userAqua.userToken], parameters: nil) { (success, responseObject)  in
            self.stopCircleLoadingVC()
            if(success){
                guard let dataResponse = responseObject else {
                    return
                }
                if let dataResponse = dataResponse as? JSON {
                    if let status = dataResponse["status"].string {
                        if(status == "1") {
                            print("\(dataResponse)")
                            if let arrProduct = dataResponse["data"].array {
                                if(arrProduct.count > 0) {
                                    for product in arrProduct {
                                        if let productItem = Model_Product.loadProduct(product) {
                                            self.clvProduct.arrDataClv?.add(productItem)
                                        }
                                    }
                                    self.setupData()
                                }
                            }
                        }else{
                            if let message = dataResponse["message"].string {
                                self.showViewNoData(title: message, haveTabbar: true)
                            }
                        }
                    }
                }
            }
        }
    }
}
/*
class AQUA_Product: Base_ScrollViewController, Delegate_BaseCollectionView, Delegate_BaseTableView {

    var clvCategory : ClvProdutCategory!
    var tbvCategory : TbvProductCategory!
    var line = UIView.initUIViewAutoLayout()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategory()
        setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupCategory() {
        self.clvCategory = ClvProdutCategory.init(frame: CGRect.zero, collectionViewLayout: ClvProdutCategoryFlowLayout())
        self.view.addSubview(clvCategory)
        clvCategory.delegate_ClvBase = self
        self.view.addSubview(line)
        line.backgroundColor = Utilities.UIColorFromRGB(Constant.COLOR_LINE)
        self.tbvCategory = TbvProductCategory.init(frame: CGRect.zero, superView: self.view)
        self.tbvCategory.delegate_BaseTableView = self

        AutoLayoutCommon.setLayoutWidthView(clvCategory, kWidth: (Constant.screenHeight - 49 - 64)/5)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[clvCategory][line(==1)][tbvCategory]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["clvCategory":clvCategory,"line":line,"tbvCategory":tbvCategory]))
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(tbvCategory, kTop: 64, kBottom: 49)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(clvCategory, kTop: 64, kBottom: 49)
        AutoLayoutCommon.setLayoutHeightWithMarginSuperView(line, kTop: 64, kBottom: 49)
        
    }
    func setupData() {
        let subCate1 = [ProductSubCategory.init(name: "Máy Giặt Lồng Ngang",info:"Công nghệ Auto Dosing - tự động phân bổ nước giặt và xả: đổ đầy 1 lần giặt khoảng 20 lần"),ProductSubCategory.init(name: "Máy Giặt Lồng Đứng",info: "Công nghệ mới Mâm giặt kép mang lại hiệu quả giặt tốt nhất"),ProductSubCategory.init(name: "Máy Giặt Thùng Nghiêng",info: "Máy giặt với tác động giặt 3 chiều, tăng hiệu quả giặt sạch"),ProductSubCategory.init(name: "Tất Cả Máy giặt", info: "")]
        let category1 = ProductCategoryWithSub.init(name: "Máy giặt", photo: "imgCategoryMayGiat", subCate: subCate1)
        for subCate in subCate1{
            self.tbvCategory.arrDataTbv?.add(subCate)
        }
        self.clvCategory.arrDataClv?.add(category1)
        
        let subCate2 = [ProductSubCategory.init(name: "Side By Side",info: "Tủ lạnh thiết kế mặt gương sang trọng, dung tích ngăn đông lớn, tiện dụng"),ProductSubCategory.init(name: "Nhiều Cửa",info: "Tủ lạnh với ngăn khô và ẩm riêng biệt, giúp bảo vệ đa dạng thực phẩm"),ProductSubCategory.init(name: "Ngăn Thực Phẩm Trên",info: "Thiết kế ngăn thực phẩm trên nâng tầm tiện nghi, bảo vệ cột sống"),ProductSubCategory.init(name: "Ngăn Đá Trên",info: "TThiết kế mặt gương sang trọng, Inverter tiết kiệm điện"),ProductSubCategory.init(name: "Làm Lạnh Trực Tiếp",info: "Nhỏ gọn, phù hợp với mọi không gian"),ProductSubCategory.init(name: "Tất Cả Tủ lạnh", info: "")]
        let category2  = ProductCategoryWithSub.init(name: "Tủ lạnh", photo:"imgCategoryTuLanh", subCate: subCate2)
        self.clvCategory.arrDataClv?.add(category2)
        
        let subCate3 = [ProductSubCategory.init(name: "Điều Hoà Cao Cấp",info: "Thiết kế độc đáo cùng công nghệ tự làm sạch 3 bước độc quyền"),ProductSubCategory.init(name: "Điều Hoà Inverter",info: "Hoạt động êm ái và tiết kiệm điện lên đến 63%"),ProductSubCategory.init(name: "Điều Hòa Hai Chiều",info: "Làm lạnh và sưởi ấm"),ProductSubCategory.init(name: "Điều Hoà Phổ Thông",info: "Làm lạnh nhanh"),ProductSubCategory.init(name: "Tất Cả Máy điều hòa", info: "")]
        let category3  = ProductCategoryWithSub.init(name: "Máy điều hòa", photo: "imgCategoryMayDieuHoa", subCate: subCate3)
        self.clvCategory.arrDataClv?.add(category3)
        
        let subCate4 = [ProductSubCategory.init(name: "Máy Nước Nóng Gián Tiếp",info: "Công nghệ chống sốc điện - Shock Proof (Safe Care) - an toàn tuyệt đối, lựa chọn tối ưu, bảo vệ cho người sử dụng"),ProductSubCategory.init(name: "Tất Cả Máy nước nóng", info: "")]
        let category4  = ProductCategoryWithSub.init(name: "Máy nước nóng", photo: "imgCategoryMayNuocNong", subCate: subCate4)
        self.clvCategory.arrDataClv?.add(category4)
        
        let subCate5 = [ProductSubCategory.init(name: "Tủ Đông",info: "Tủ đông Aqua được sản xuất theo công nghệ tiên tiến từ Nhật Bản, làm lạnh nhanh chóng và tiết kiệm điện năng tối ưu"),ProductSubCategory.init(name: "Tủ Mát",info: "Tủ mát AQUA sở hữu thiết kế thanh gọn, hiện đại phù hợp với mọi không gian, cùng hệ thống làm bằng lồng sóc giúp duy trì nhiệt độ làm lạnh ổn định, bảo vệ thực phẩm, đồ uống luôn tươi ngon, mát lạnh mỗi ngày"),ProductSubCategory.init(name: "Tủ Rượu",info: "Tủ rượu AQUA hoạt động êm ái, cùng hệ thống bảo quản nhiệt độ tiên tiến giúp giữ nguyên sức hấp dẫn và mùi vị cay nồng đặc trưng của từng loại rượu"),ProductSubCategory.init(name: "Dụng Cụ Cầm Tay - Tẩy Rửa Quần Áo",info: "Dụng cụ cầm tay - tẩy rửa quần áo với thiết kế siêu nhỏ gọn và tiện lợi, giặt nhanh chóng chỉ trong 30s giúp cho cuộc sống đơn giản hơn"),ProductSubCategory.init(name: "Hàng Gia Dụng",info: "Sự kết hợp tinh tế giữa thiết kế trang nhã mang phong cách đương đại cùng các tính năng tiên tiến Nhật Bản, sản phẩm gia dụng AQUA tự tin mang đến người sử dụng những tiện ích tuyệt vời, đồng thời góp phần làm tăng thêm vẻ đẹp cho không gian sống của bạn")]
        let category5  = ProductCategoryWithSub.init(name: "Sản phẩm khác", photo: "imgCategorySanPhamKhac", subCate: subCate5)
        self.clvCategory.arrDataClv?.add(category5)
        
        self.clvCategory.reloadData()
        self.tbvCategory.reloadData()
    }
   
    func didSelect_BaseClvItemAtIndexPath(_ collectionview: UICollectionView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(indexPath.row < arrData.count) {
            if let category = arrData.object(at: indexPath.row) as? ProductCategoryWithSub {
                self.tbvCategory.arrDataTbv?.removeAllObjects()
                for subCate in category.subCate{
                    if let subCategory = subCate {
                        self.tbvCategory.arrDataTbv?.add(subCategory)
                    }
                }
                self.tbvCategory.reloadData()
            }
        }
    }
    func didSelect_BaseTbvItemAtIndexPath(_ tableView: UITableView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(indexPath.row < arrData.count) {
            if let subCate = arrData.object(at: indexPath.row) as? ProductSubCategory {
                if let productListVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductListVC") as? AQUA_ProductList {
                    productListVC.hidesBottomBarWhenPushed = true
                    productListVC.typeProduct = subCate.name
                    self.navigationController?.pushViewController(productListVC, animated: true)
                }
            }
        }
    }
}
*/

