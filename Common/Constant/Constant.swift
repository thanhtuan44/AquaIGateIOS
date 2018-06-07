//
//  Constant.swift
//  favant
//
//  Created by MinhAnh on 7/12/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit
class Constant: NSObject {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let COLOR_LINE = 0xd7d7d7
    static let COLOR_BACKGROUND = 0xF1F1F5
    static let COLOR_AQUA = 0x1966A7
    static let COLOR_ORANGE_HASAKI = 0xfe6700
    static let FONT_APP = "TimesNewRomanPSMT"
    static let DOMAIN = "http://webapi.aquavietnam.vn/HRMS/"
    static let Aqua_AppDelegate = UIApplication.shared.delegate as? AppDelegate

}
class API: NSObject{
    static let LOGIN = "api/employee/login"
    static let GET_PROFILE = "api/employee/info"
    static let GET_WORKTIMEDAILY = "api/daily/inout"
    static let GET_WORKTIMEDAILY_DETAIL = "api/daily/detail?workDate="
    static let GET_BONUS = "api/bonus"
    static let GET_LIST_MANAGER = "api/absent/manager"
    static let POST_REGISTER_DATEOFF = "api/absent/insert"
    static let POST_REGISTER_OVERTIME = "api/overtime/insert"
    static let POST_REGISTER_MISSING_NONSCAN = "api/confirm/insert"
    static let GET_LIST_REGISTER_DATEOFF = "api/absent/view"
    static let GET_LIST_REGISTER_OVERTIME = "api/overtime/view"
    static let GET_LIST_REGISTER_MISSING_NONSCAN = "api/confirm/view"
    static let GET_LIST_ANNUALLEAVE = "api/annualleave"
    static let GET_LIST_MISSING_NONSCAN = "api/missingnonscan"
    static let GET_LIST_REGISTER_DATEOFF_FORMANAGER = "api/absent/pending/request"
    static let GET_LIST_REGISTER_OVERTIME_FORMANAGER = "api/overtime/pending/request"
    static let GET_LIST_REGISTER_NONSCAN_FORMANAGER = "api/confirm/pending/request"
    static let POST_DATEOFF_APPROVED = "api/absent/approved"
    static let POST_OVERTIME_APPROVED = "api/overtime/approved"
    static let POST_NONSCAN_APPROVED = "api/confirm/approved"
    static let GET_LIST_PRODUCT = "api/get/products"
    static let GET_PRODUCT_DETAIL = "api/product/detail?productId="
    static let POST_DEVICE_TOKEN = "api/update/deviceToken"
    static let LOGOUT = "api/employee/logout"
}
