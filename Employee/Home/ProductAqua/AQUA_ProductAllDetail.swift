//
//  AQUA_ProductAllDetail.swift
//  Employee
//
//  Created by Thanh Tuan on 4/11/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_ProductAllDetail: AQUA_ProductDetail {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFeatureDetail()
    }
    override func getProductDetail() {
        self.showCircleLoadingInVC()
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.vwBanner.clvBanner.arrDataClv = self.loadImages(stringURL: self.idProduct, query: "//div[@id='prodGallery1']")
            DispatchQueue.main.async{
                print("completed")
                self.stopCircleLoadingVC()
                if((self.vwBanner.clvBanner.arrDataClv?.count)! > 0) {
                    self.vwBanner.reloadData()
                }
            }
        }
    }
    func getFeatureDetail() {
        self.showCircleLoadingInVC()
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.arrInfo = self.loadFeature(stringURL: self.idProduct, query: "//div[@class='product-info']")
            DispatchQueue.main.async{
                print("completed")
                self.stopCircleLoadingVC()
                if(self.arrInfo.count > 0){
                    self.vwInfo.setupDetailInfo(NSMutableArray.init(array: self.arrInfo))
                }
            }
        }
    }
    func loadImages(stringURL: String?,query: String?) -> NSMutableArray {
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
                        var url : String = ""
                        
                        if let element: TFHppleElement = element as? TFHppleElement {
                            guard let elementA = element.firstChild(withClassName: "item") else {
                                return []
                            }
                            if let imageUrl = elementA.firstChild(withTagName: "img") {
                                if let strUrlImage = imageUrl.object(forKey: "src") {
                                    url = String(format:"%@",strUrlImage)
                                    objects.add(url)
                                }
                            }
                        }
                    }
                }
            }
        }
        return objects
    }
    func loadFeature(stringURL: String?,query: String?) -> NSMutableArray {
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
                        if let element: TFHppleElement = element as? TFHppleElement {
                            guard let elementA = element.firstChild(withClassName: "entry-title") else {
                                return []
                            }
                            if let title = elementA.firstChild.content {
                                print("\(String(format:"%@",title))")
                            }
                            guard let elementB = element.firstChild(withClassName: "short-desc") else {
                                return []
                            }
                            guard let elementC = elementB.firstChild(withTagName: "ul") else {
                                return []
                            }
                            guard let elementD = elementC.children(withTagName: "li") else {
                                return []
                            }
                            if(elementD.count > 0){
                                for element in elementD {
                                    guard let element = element as? TFHppleElement else {
                                        return []
                                    }
                                    if let type = element.firstChild.content {
                                        objects.add(type)
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        }
        return objects
    }
}
