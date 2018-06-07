//
//  Utilities.swift
//  favant
//
//  Created by MinhAnh on 6/27/16.
//  Copyright © 2016 MinhAnh. All rights reserved.
//

import UIKit
import UIAlertController_Blocks
class Utilities: NSObject {
    class func checkDataNil(_ data: AnyObject?) {
        guard let _ = data else {
            return
        }
    }
    
    class func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
        return UIColor(red: (CGFloat((rgbValue & 0xFF0000) >> 16)) / 255.0, green: (CGFloat((rgbValue & 0xFF00) >> 8)) / 255.0, blue: (CGFloat(rgbValue & 0xFF)) / 255.0, alpha: 1.0)
    }
    class func UIColorFromRGB(_ rgbValue: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: (CGFloat((rgbValue & 0xFF0000) >> 16)) / 255.0, green: (CGFloat((rgbValue & 0xFF00) >> 8)) / 255.0, blue: (CGFloat(rgbValue & 0xFF)) / 255.0, alpha: alpha)
    }
    class func imageWithColor(_ color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    class func imageWithImage(_ image: UIImage?, scaledToSize newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        if let context = UIGraphicsGetImageFromCurrentImageContext() {
            let newImage: UIImage = context
            UIGraphicsEndImageContext()
            return newImage
        }
        return nil
    }
    


    class func validateEmail(_ candidate: String) -> Bool {
        let emailRegex = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.) {3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailTest.evaluate(with: candidate)
    }
    class func validatePhone(_ candidate: String) -> Bool {
        let phoneRegex = "^((01)[0-9]{9})|((09)[0-9]{8})|((086)[0-9]{7})|((089)[0-9]{7})|((088)[0-9]{7})$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result = phoneTest.evaluate(with: candidate)
        return !result
    }
    class func validateOnlyNumber(_ candidate: String) -> Bool {
        let specialCharacterRegex = "[0-9]*"
        let specialCharacterTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex)
        let result = specialCharacterTest.evaluate(with: candidate)
        return !result
    }
    class func validateName(_ candidate: String) -> Bool {
        let specialCharacterRegex = "[A-Za-z ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]*"
        let specialCharacterTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex)
        let result = specialCharacterTest.evaluate(with: candidate)
        return !result
    }
    class func validateSpecialCharacter(_ candidate: String) -> Bool {
        let specialCharacterRegex = "[A-Z0-9a-z ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]*"
        let specialCharacterTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex)
        let result = specialCharacterTest.evaluate(with: candidate)
        return !result
    }
    
    class func validateSpecialCharacterComment(_ candidate: String) -> Bool {
        let specialCharacterRegex = "[A-Z0-9a-z .,\nÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]*"
        let specialCharacterTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex)
        let result = specialCharacterTest.evaluate(with: candidate)
        return !result
    }
    class func validateSpecialCharacterAddress(_ candidate: String) -> Bool {
        let specialCharacterRegex = "[A-Z0-9a-z .,/ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]*"
        let specialCharacterTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex)
        let result = specialCharacterTest.evaluate(with: candidate)
        return !result
    }
    
    class func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
    class func showAlert(viewController: UIViewController?, message: String?) {
        if let viewController = viewController {
            UIAlertController.showAlert(in: viewController,
                                        withTitle: "",
                                        message: message,
                                        cancelButtonTitle: "OK",
                                        destructiveButtonTitle: nil,
                                        otherButtonTitles: nil,
                                        tap: {(controller, action, buttonIndex) in
                                            switch buttonIndex {
                                            case controller.cancelButtonIndex:
                                                print("OK")
                                            default :
                                                print("")
                                            }
            })
        }
    }
//    class func saveCookie() {
//        let userDefaults = UserDefaults.standard
//        let serverBaseUrl = Constant.DOMAIN + String(format: "/checkout/guest?mid=%@", HSK_User.sharedUser.userHasaki.user_CartId)
//        var cookieDict = [String : AnyObject]()
//        let url = URL(string:serverBaseUrl)
//        if let arrCookie : NSArray = HTTPCookieStorage.shared.cookies(for: url!) as NSArray? {
//            if let cookie = arrCookie[0] as? HTTPCookie {
//                cookieDict[cookie.name] = cookie.properties as AnyObject
//                userDefaults.set(cookieDict, forKey: "cookie")
//            }
//        }
//    }
    
   
    class func convertDateFormater(_ date: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "HH:mm"
        guard let dateValue = date else {
            return ""
        }
        return  dateFormatter.string(from: dateValue)
    }
    class func getCookie() {
        let defaults = UserDefaults.standard
        let cookiesStorage = HTTPCookieStorage.shared
        if let cookieDictionary = defaults.dictionary(forKey:"cookie") {
            for (cookieName, cookieProperties) in cookieDictionary {
                print(cookieName)
                if let cookie = HTTPCookie(properties: cookieProperties as! [HTTPCookiePropertyKey : Any]) {
                    cookiesStorage.setCookie(cookie)
                }
            }
        }
    }
    class func clearCookie() {
        let storage : HTTPCookieStorage = HTTPCookieStorage.shared
        if((storage.cookies?.count)! > 0) {
            for cookie in storage.cookies! {
                storage.deleteCookie(cookie)
            }
        }
    }
    class func clearCache() {
        URLCache.shared.removeAllCachedResponses()
    }
    class func formatter_money(_ money:NSInteger)->String{
        let number = NSNumber(value: money)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
//        formatter.locale = Locale(identifier: "fr_VN")
        formatter.maximumFractionDigits = 0
        let result = String(format: "%@ ₫", formatter.string(from: number)!)
        return result
    }
    
    class func getDateCalendar (date: Date?) -> String{
        guard let date = date else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let returnDate = formatter.string(from: date)
        return returnDate
    }
 
//    class func regiterCheckInternet(viewController: UIViewController?) {
//        
//        let reachability = Reachability()!
//        
//        reachability.whenReachable = { reachability in
//            // this is called on a background thread, but UI updates must
//            // be on the main thread, like this:
//            DispatchQueue.main.async {
//                if reachability.isReachableViaWiFi {
//                    print("Reachable via WiFi")
//                    
//                } else {
//                    print("Reachable via Cellular")
//                    
//                }
//            }
//        }
//        reachability.whenUnreachable = { reachability in
//            // this is called on a background thread, but UI updates must
//            // be on the main thread, like this:
//            DispatchQueue.main.async {
//                if(viewController != nil) {
//                    UIAlertController.showAlert(in: viewController!,
//                                                withTitle: "",
//                                                message: "Internet is not available.Please check your internet",
//                                                cancelButtonTitle: "OK",
//                                                destructiveButtonTitle: nil,
//                                                otherButtonTitles: nil,
//                                                tap: {(controller, action, buttonIndex) in
//                                                    switch buttonIndex {
//                                                    case controller.cancelButtonIndex:
//                                                        viewController?.viewDidLoad()
//                                                    default :
//                                                        print("")
//                                                    }
//                    })
//                }
//            }
//        }
//        
//        do {
//            try reachability.startNotifier()
//        } catch {
//            print("Unable to start notifier")
//        }
//        
//    }
    class func randomColor() -> UIColor {
        return UIColor(red:   CGFloat(arc4random()) / CGFloat(UInt32.max),
                       green: CGFloat(arc4random()) / CGFloat(UInt32.max),
                       blue:  CGFloat(arc4random()) / CGFloat(UInt32.max),
                       alpha: 1.0)
    }
}
