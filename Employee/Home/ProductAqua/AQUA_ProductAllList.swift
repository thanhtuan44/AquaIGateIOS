//
//  AQUA_ProductAllDetail.swift
//  Employee
//
//  Created by Thanh Tuan on 4/10/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import WebKit

class AQUA_ProductAllList: Base_BackViewController, Delegate_BaseCollectionView {

    var clvProduct : ClvProdutCategory!
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupClvProdutCategoryItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupClvProdutCategoryItem(){
        self.clvProduct = ClvProdutCategory.init(frame: CGRect.zero, collectionViewLayout: ClvProdutCategoryFlowLayout())
        self.view.addSubview(clvProduct)
        clvProduct.delegate_ClvBase = self
        
        AutoLayoutCommon.setLayoutFullSuperView(clvProduct)
        self.showCircleLoadingInVC()
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.clvProduct.arrDataClv = self.loadTutorials(stringURL: self.urlString, query: "//div[@class='product-item']")
            DispatchQueue.main.async{
                print("completed")
                self.stopCircleLoadingVC()
                if((self.clvProduct.arrDataClv?.count)! == 0) {
                    self.showViewNoData(title: "Hiện tại chưa có sản phẩm bán cho nhân viên\nCông ty sẽ cố gắng sắp xếp trong thời gian gần nhât", haveTabbar: false)
                }else {
                    self.clvProduct.reloadData()
                }
            }
        }
    }
    func didSelect_BaseClvItemAtIndexPath(_ collectionview: UICollectionView, indexPath: IndexPath, arrData: AnyObject?) {
        guard let arrData = arrData else {
            return
        }
        if(indexPath.row < arrData.count) {
            if let product = arrData.object(at: indexPath.row) as? Model_Product {
                if let productAllDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductAllDetailVC") as? AQUA_ProductAllDetail {
                    productAllDetailVC.hidesBottomBarWhenPushed = true
                    productAllDetailVC.idProduct = product.url
                    self.navigationController?.pushViewController(productAllDetailVC, animated: true)
                }
            }
        }
    }
    func loadTutorials(stringURL: String?,query: String?) -> NSMutableArray {
        let objects : NSMutableArray = []
        guard let stringURL = stringURL else {
            return []
        }
        guard let query = query else {
            return []
        }
        if let data = NSData(contentsOf: (NSURL(string: stringURL) as URL?)!) {
            let tutorialsParser = TFHpple(htmlData: data as Data)
            let tutorialsXPathString = String(format: "%@", query)
            if let tutorialNodes = tutorialsParser?.search(withXPathQuery: tutorialsXPathString) as AnyObject? as? NSArray {
                if(tutorialNodes.count == 0) {
                    print("empty here")
                }else{
                    for element in tutorialNodes{
                        let product : Model_Product = Model_Product.init(imageUrl: "", idProduct: "", type: "", info: "",url: "")
                        if let element: TFHppleElement = element as? TFHppleElement {
                            guard let elementA = element.firstChild(withTagName: "a") else {
                                return []
                            }
                            if let imageUrl = elementA.firstChild(withTagName: "img") {
                                if let strUrl = imageUrl.object(forKey: "src") {
                                    product.imageUrl = String(format:"%@",strUrl)
                                }

                            }
                            if let url = elementA.object(forKey: "href") {
                                product.url = String(format:"%@",url)
                            }
                            
                            guard let elementTitle = element.firstChild(withClassName: "title") else {
                                return []
                            }
                            if let idProduct = elementTitle.firstChild.content {
                                product.idProduct = String(format:"%@",idProduct)
                            }
                            
                            guard let elementProductInfo = element.firstChild(withClassName: "product-info") else {
                                return []
                            }
                            
                            guard let elementListUnstyled = elementProductInfo.children(withClassName: "list-unstyled") else {
                                return []
                            }
                            if(elementListUnstyled.count > 0){
                                for element in elementListUnstyled {
                                    guard let element = element as? TFHppleElement else {
                                        return []
                                    }
                                    for i in 0..<(element.children(withTagName: "li").count) {
                                        if let elementLi = element.children(withTagName: "li")[i] as? TFHppleElement {
                                            if(i == 0){
                                                if let type = elementLi.firstChild.content {
                                                    product.type = String(format:"%@",type)
                                                }
                                                
                                            }else if(i == 1){
                                                if let info = elementLi.firstChild.content {
                                                    product.info = String(format:"%@",info)
                                                }
                                            }
                                        }
                                    }
                                }
                                objects.add(product)
                            }else{
                                guard let elementProductInfo = element.children(withClassName: "product-info") else {
                                    return []
                                }
                                
                                if(elementProductInfo.count > 0){
                                    for element in elementProductInfo {
                                        guard let element = element as? TFHppleElement else {
                                            return []
                                        }
                                        for i in 0..<(element.children(withTagName: "p").count) {
                                            if let elementLi = element.children(withTagName: "p")[i] as? TFHppleElement {
                                                if(i == 0){
                                                    product.type = String(format:"%@",elementLi.firstChild.content)
                                                }else if(i == 1){
                                                    product.info = String(format:"%@",elementLi.firstChild.content)
                                                }
                                            }
                                        }
                                    }
                                    objects.add(product)
                                }
                            }
                        }
                    }
                }
            }
        }
        return objects
    }
    /*
    func getData(completion: () -> ()){
        completion()
    }
    
    func webView(_ webView: WKWebView,didFinish navigation: WKNavigation){
        webView.evaluateJavaScript("document.querySelector('.toolbar').remove();", completionHandler: { (response, error) -> Void in
            print("success")
        })
    }
     */
}
