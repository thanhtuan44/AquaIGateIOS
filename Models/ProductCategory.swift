//
//  ProductCategory.swift
//  Employee
//
//  Created by Thanh Tuan on 4/5/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class ProductCategoryWithSub: NSObject {
    var name: String
    var photo: UIImage?
    var subCate: [ProductSubCategory?] = []
    
    init(name: String, photo: String?, subCate: [ProductSubCategory]?) {
        self.name = name
        if let photo = photo {
            self.photo = UIImage.init(named: photo)
        }
        if let subCate = subCate {
            self.subCate = subCate
        }
    }
}
class ProductSubCategory: NSObject {
    var name: String = ""
    var info:String = ""
    var photo: String = ""
    var url:String = ""
    init(name: String,info: String, photo: String,url:String) {
        self.name = name
        self.info = info
        self.photo = photo
        self.url = url
    }
}
class ProductCategory: NSObject {
    var name: String
    var photo: UIImage?
    
    init(name: String, photo: String?) {
        self.name = name
        if let photo = photo {
            self.photo = UIImage.init(named: photo)
        }
    }
}
class IdValueObject: NSObject {
    var id: String = ""
    var value: String = ""
    
    init(id: String?, value: String?) {
        if let id = id {
            self.id = id
        }
        if let value = value {
            self.value = value
        }
    }
}
