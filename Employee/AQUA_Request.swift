//
//  AQUA_Profile.swift
//  Employee
//
//  Created by Thanh Tuan on 3/8/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AQUA_Request: NSObject {
    
    fileprivate static let instance = AQUA_Request()
    
    class var sharedRequest: AQUA_Request {
        return instance
    }
    
    func getData(_ url: String, parameters: NSDictionary?, completion: @escaping (_ success: Bool, _ responseObject: AnyObject?) -> ()) {
        Alamofire.request(url, method: .get).responseJSON { responseData in
            if(responseData.result.isSuccess) {
                print(responseData)
                print("Request Success")
                if let data = responseData.data {
                    do {
                        let json = try JSON(data: data)
                        completion(true, json as AnyObject?)
                    } catch {
                        print("Do not data")
                        completion(false, responseData as AnyObject?)
                    }
                }
            }else {
                print("Request Fail")
                completion(false, responseData as AnyObject?)
            }
        }
    }
    
    func postData(_ url: String, parameters: [String: AnyObject], completion: @escaping (_ success: Bool, _ responseObject: AnyObject?) -> ()) {
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { responseData in
                print(responseData)
                if(responseData.result.isSuccess) {
                    print("Request Success")
                    if let data = responseData.data {
                        do {
                            let json = try JSON(data: data)
                            completion(true, json as AnyObject?)
                        } catch {
                            print("Do not data")
                            completion(false, responseData as AnyObject?)
                        }
                    }
                }else {
                    print("Request Fail")
                    completion(false, responseData as AnyObject?)
                }
        }
    }
    
    func getDataWithHeader(_ url: String, header: [String:String], parameters: NSDictionary?, completion: @escaping (_ success: Bool, _ responseObject: AnyObject?) -> ()) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default,headers: header).responseJSON { responseData in
            if(responseData.result.isSuccess) {
                print(responseData)
                print("Request Success")
                if let data = responseData.data {
                    do {
                        let json = try JSON(data: data)
                        completion(true, json as AnyObject?)
                    } catch {
                        print("Do not data")
                        completion(false, responseData as AnyObject?)
                    }
                }
            }else {
                if(responseData.response?.statusCode == 401) {
                    if let window = Constant.Aqua_AppDelegate?.window {
                        if let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? AQUA_LoginVC{
                            window.rootViewController = loginVC
                            return
                        }
                    }
                }
                print("Request Fail")
                completion(false, responseData as AnyObject?)
            }
        }
    }
    func postDataWithHeader(_ url: String,header: [String:String], parameters: [String: AnyObject], completion: @escaping (_ success: Bool, _ responseObject: AnyObject?) -> ()) {
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default,headers: header)
            .responseJSON { responseData in
                print(responseData)
                if(responseData.result.isSuccess) {
                    print("Request Success")
                    if let data = responseData.data {
                        do {
                            let json = try JSON(data: data)
                            completion(true, json as AnyObject?)
                        } catch {
                            print("Do not data")
                            completion(false, responseData as AnyObject?)
                        }
                    }
                }else {
                    if(responseData.response?.statusCode == 401) {
                        if let window = Constant.Aqua_AppDelegate?.window {
                            if let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? AQUA_LoginVC{
                                window.rootViewController = loginVC
                                return
                            }
                        }
                    }
                    print("Request Fail")
                    completion(false, responseData as AnyObject?)
                }
        }
    }
    func uploadDataWithHeader(_ url: String,image: UIImage,header: [String:String], completion: @escaping (_ success: Bool, _ responseObject: AnyObject?) -> ()) {
        Alamofire.upload(multipartFormData:{ multipartFormData in
            multipartFormData.append(UIImageJPEGRepresentation(image,  0.025)!, withName: "image", fileName: "1.jpeg", mimeType: "image/jpeg")},
                         usingThreshold:UInt64.init(),
                         to:url,
                         method:.post, 
                         headers:header,
                         encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload,_,_):
                                upload.responseJSON { responseData in
//                                    print(responseData.request)
//                                    print(responseData.data)
                                    if(responseData.result.isSuccess){
                                        print("Request Success")
                                        if let data = responseData.data {
                                            do {
                                                let json = try JSON(data: data)
                                                completion(true, json as AnyObject?)
                                            } catch {
                                                print("Do not data")
                                                completion(false, responseData as AnyObject?)
                                            }
                                        }
                                    }else {
                                        if(responseData.response?.statusCode == 401) {
                                            if let window = Constant.Aqua_AppDelegate?.window {
                                                if let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? AQUA_LoginVC{
                                                    window.rootViewController = loginVC
                                                    return
                                                }
                                            }
                                        }
                                        print("Request Fail")
                                        completion(false, responseData as AnyObject?)
                                    }
                                }
                            case .failure(let encodingError):
                                print(encodingError)
                            }
        })
    }
}
