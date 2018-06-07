//
//  Model_Product.swift
//  Employee
//
//  Created by Thanh Tuan on 4/10/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Model_Product: NSObject {
    var imageUrl: String = ""
    var idProduct:String = ""
    var type: String = ""
    var info:String = ""
    var url: String = ""
    var price : String = ""
    var numberSale : String = ""
    
    init(imageUrl: String,idProduct: String, type: String,info:String,url:String) {
        self.imageUrl = imageUrl
        self.idProduct = idProduct
        self.type = type
        self.info = info
        self.url = url
    }
    class func loadProduct(_ infoData:JSON?) -> Model_Product? {
        
        let object_Product : Model_Product = Model_Product.init(imageUrl: "", idProduct: "", type: "", info: "", url: "")
        
        guard let infoData = infoData else {
            return object_Product
        }
        if let Id = infoData["Id"].string {
            object_Product.idProduct = Id
        }
        
        if let Image = infoData["Image"].string {
            object_Product.imageUrl = Image
        }
        
        if let ModelType = infoData["ModelType"].string {
            object_Product.type = ModelType
        }
        
        if let Info = infoData["Info"].string {
            object_Product.info = Info
        }
        
        if let NumberSales = infoData["NumberSales"].string {
            object_Product.numberSale = NumberSales
        }
        
        if let Price = infoData["Price"].string {
            object_Product.price = Price
        }
        
        return object_Product
    }
}
