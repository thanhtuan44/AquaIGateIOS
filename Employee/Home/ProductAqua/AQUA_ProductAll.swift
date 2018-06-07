//
//  AQUA_ProductAll.swift
//  Employee
//
//  Created by Thanh Tuan on 4/10/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_ProductAll: Base_BackViewController, Delegate_BaseTableView {

    var indexSelect = 0
    var tbvCategory : TbvProductCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategory()
        setupData(select: indexSelect)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCategory() {
        self.tbvCategory = TbvProductCategory.init(frame: CGRect.zero, superView: self.view)
        self.tbvCategory.delegate_BaseTableView = self
        AutoLayoutCommon.setLayoutFullSuperView(tbvCategory)
        
    }
    func setupData(select: Int) {
        var subCate : [ProductSubCategory] = []
        switch select {
        case 0:
            subCate = [ProductSubCategory.init(name: "Máy Giặt Lồng Ngang",info:"Công nghệ Auto Dosing - tự động phân bổ nước giặt và xả: đổ đầy 1 lần giặt khoảng 20 lần",photo: "http://aquavietnam.com.vn/wp-content/uploads/2018/01/AQD-DD1000A.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-giat/may-giat-long-ngang/"),ProductSubCategory.init(name: "Máy Giặt Lồng Đứng",info: "Công nghệ mới Mâm giặt kép mang lại hiệu quả giặt tốt nhất",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/09/may-giat-long-dung.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-giat/may-giat-long-dung/"),ProductSubCategory.init(name: "Máy Giặt Thùng Nghiêng",info: "Máy giặt với tác động giặt 3 chiều, tăng hiệu quả giặt sạch",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/09/may-giat-long-nghieng.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-giat/may-giat-long-nghieng/"),ProductSubCategory.init(name: "Tất Cả Máy Giặt", info: "", photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/09/tat-ca-may-giat.jpg", url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-giat/tat-ca-may-giat/")]
        case 1:
            subCate = [ProductSubCategory.init(name: "Side By Side",info: "Tủ lạnh thiết kế mặt gương sang trọng, dung tích ngăn đông lớn, tiện dụng",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/AQR-IG585AS-L-copy1.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/tu-lanh/side-by-side/"),ProductSubCategory.init(name: "Nhiều Cửa",info: "Tủ lạnh với ngăn khô và ẩm riêng biệt, giúp bảo vệ đa dạng thực phẩm",photo: "http://aquavietnam.com.vn/wp-content/uploads/2018/01/1111.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/tu-lanh/tu-lanh-nhieu-cua/"),ProductSubCategory.init(name: "Ngăn Thực Phẩm Trên",info: "Thiết kế ngăn thực phẩm trên nâng tầm tiện nghi, bảo vệ cột sống",photo: "http://aquavietnam.com.vn/wp-content/uploads/2018/03/thuc-pham-tren-2.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/tu-lanh/ngan-thuc-pham-tren/"),ProductSubCategory.init(name: "Ngăn Đá Trên",info: "TThiết kế mặt gương sang trọng, Inverter tiết kiệm điện",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/AQR-IG377DN-GBOPEN12.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/tu-lanh/ngan-da-tren/"),ProductSubCategory.init(name: "Làm Lạnh Trực Tiếp",info: "Nhỏ gọn, phù hợp với mọi không gian",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/AQR-95AR_L-1.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/tu-lanh/lam-lanh-truc-tiep/"),ProductSubCategory.init(name: "Tất Cả Tủ Lạnh", info: "", photo: "http://aquavietnam.com.vn/wp-content/uploads/2018/03/NHIEU-TU-LANH.png", url: "http://aquavietnam.com.vn/danh-muc-san-pham/tu-lanh/tat-ca-tu-lanh/")]
        case 2:
            subCate = [ProductSubCategory.init(name: "Điều Hoà Cao Cấp",info: "Thiết kế độc đáo cùng công nghệ tự làm sạch 3 bước độc quyền",photo: "http://aquavietnam.com.vn/wp-content/uploads/2018/04/dieu-hoa-dawn1.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-dieu-hoa/dieu-hoa-cao-cap/"),ProductSubCategory.init(name: "Điều Hoà Inverter",info: "Hoạt động êm ái và tiết kiệm điện lên đến 63%",photo: "http://aquavietnam.com.vn/wp-content/uploads/2018/04/dieu-hoa-flexis1.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-dieu-hoa/may-dieu-hoa-inverter/"),ProductSubCategory.init(name: "Điều Hòa Hai Chiều",info: "Làm lạnh và sưởi ấm",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/AQA-KCH12JA-Right.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-dieu-hoa/may-dieu-hoa-hai-chieu/"),ProductSubCategory.init(name: "Điều Hoà Phổ Thông",info: "Làm lạnh nhanh",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/AQA-KR12JA-Left.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-dieu-hoa/may-lanh-pho-thong/"),ProductSubCategory.init(name: "Tất Cả Điều Hoà", info: "", photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/Asset-5.png", url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-dieu-hoa/tat-ca-may-lanh/")]
        case 3:
            subCate = [ProductSubCategory.init(name: "Máy Nước Nóng Gián Tiếp",info: "Công nghệ chống sốc điện - Shock Proof (Safe Care) - an toàn tuyệt đối, lựa chọn tối ưu, bảo vệ cho người sử dụng",photo: "http://aquavietnam.com.vn/wp-content/uploads/2018/01/AQH-45VP1-L-1.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-nuoc-nong/may-nuoc-nong-gian-tiep/"),ProductSubCategory.init(name: "Tất Cả Máy Nước Nóng", info: "", photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/DVCSFSDFSD-1.png", url: "http://aquavietnam.com.vn/danh-muc-san-pham/may-nuoc-nong/tat-ca-may-nuoc-nong/")]
        case 4:
            subCate = [ProductSubCategory.init(name: "Tủ Đông",info: "Tủ đông Aqua được sản xuất theo công nghệ tiên tiến từ Nhật Bản, làm lạnh nhanh chóng và tiết kiệm điện năng tối ưu",photo: "http://aquavietnam.com.vn/wp-content/uploads/2018/03/tudong-icon.jpg",url: "http://aquavietnam.com.vn/danh-muc-san-pham/san-pham-khac/tu-dong/"),ProductSubCategory.init(name: "Tủ Mát",info: "Tủ mát AQUA sở hữu thiết kế thanh gọn, hiện đại phù hợp với mọi không gian, cùng hệ thống làm bằng lồng sóc giúp duy trì nhiệt độ làm lạnh ổn định, bảo vệ thực phẩm, đồ uống luôn tươi ngon, mát lạnh mỗi ngày",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/may-giat-long-ngang.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/san-pham-khac/tu-mat/"),ProductSubCategory.init(name: "Tủ Rượu",info: "Tủ rượu AQUA hoạt động êm ái, cùng hệ thống bảo quản nhiệt độ tiên tiến giúp giữ nguyên sức hấp dẫn và mùi vị cay nồng đặc trưng của từng loại rượu",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/WS49GDB-800x800-copy.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/san-pham-khac/tu-ruou/"),ProductSubCategory.init(name: "Dụng Cụ Cầm Tay - Tẩy Rửa Quần Áo",info: "Dụng cụ cầm tay - tẩy rửa quần áo với thiết kế siêu nhỏ gọn và tiện lợi, giặt nhanh chóng chỉ trong 30s giúp cho cuộc sống đơn giản hơn",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/coton02.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/san-pham-khac/dung-cu-tay-rua-quan-ao/"),ProductSubCategory.init(name: "Hàng Gia Dụng",info: "Sự kết hợp tinh tế giữa thiết kế trang nhã mang phong cách đương đại cùng các tính năng tiên tiến Nhật Bản, sản phẩm gia dụng AQUA tự tin mang đến người sử dụng những tiện ích tuyệt vời, đồng thời góp phần làm tăng thêm vẻ đẹp cho không gian sống của bạn",photo: "http://aquavietnam.com.vn/wp-content/uploads/2017/10/121312.png",url: "http://aquavietnam.com.vn/danh-muc-san-pham/san-pham-khac/hang-gia-dung/")]
        default:
            print("")
        }
        
        for subCate in subCate{
            self.tbvCategory.arrDataTbv?.add(subCate)
        }
        self.tbvCategory.reloadData()
    }
    
    func didSelect_BaseTbvItemAtIndexPath(_ tableView: UITableView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(indexPath.row < arrData.count) {
            if let subCate = arrData.object(at: indexPath.row) as? ProductSubCategory {
                if(subCate.url != "") {
                    if let productAllListVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductAllListVC") as? AQUA_ProductAllList {
                        productAllListVC.hidesBottomBarWhenPushed = true
                        productAllListVC.urlString = subCate.url
                        self.navigationController?.pushViewController(productAllListVC, animated: true)
                    }
                }
            }
        }
    }
}
