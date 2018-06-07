//
//  AQUA_User.swift
//  Employee
//
//  Created by Thanh Tuan on 3/9/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//
let userRememberKey = "userRememberKey"

import UIKit

class AQUA_User: NSObject {
    var userPushNotificationInfo : UserNotificationInfo = UserNotificationInfo()
    var userAqua : User = User()
    fileprivate static let instance = AQUA_User()
    class var shared: AQUA_User {
        return instance
    }
    func saveUser(user: User?) {
        var arrUser = [User]()
        if let user = user {
            arrUser.append(user)
            if(arrUser.count > 0){
                let encodedData = NSKeyedArchiver.archivedData(withRootObject: arrUser)
                UserDefaults.standard.set(encodedData, forKey: "SaveUser")
                getUser()
            }
        }
    }
    func getUser() {
        if let data = UserDefaults.standard.data(forKey: "SaveUser"),
            let arrUser = NSKeyedUnarchiver.unarchiveObject(with: data) as? [User] {
            if(arrUser.count > 0) {
                let user = arrUser[0]
                userAqua = user
            }else {
                userAqua = User.init(userID: "", userToken: "", isRememberID: false, isLogin: false)
            }
        } else {
            userAqua = User.init(userID: "", userToken: "", isRememberID: false, isLogin: false)
        }
    }
    func logoutUser() {
        if(userAqua.isRememberID == true) {
            let user = User.init(userID: userAqua.userID, userToken: "", isRememberID: userAqua.isRememberID, isLogin: false)
            self.saveUser(user: user)
        }else {
            let user = User.init(userID: "", userToken: "", isRememberID: false, isLogin: false)
            self.saveUser(user: user)
        }
    }
}


class User : NSObject, NSCoding {
    var userID : String = ""
    var userToken : String = ""
    var isRememberID : Bool = false
    var isLogin : Bool = false
    init(userID: String, userToken: String, isRememberID : Bool, isLogin : Bool) {
        self.userID = userID
        self.userToken = userToken
        self.isRememberID = isRememberID
        self.isLogin = isLogin
    }
    override init() {
        self.userID = ""
        self.userToken = ""
        self.isRememberID = false
        self.isLogin = false
    }
    required init(coder decoder: NSCoder) {
        self.userID = decoder.decodeObject(forKey: "userID") as? String ?? ""
        self.userToken = decoder.decodeObject(forKey: "userToken") as? String ?? ""
        self.isRememberID = decoder.decodeBool(forKey: "isRememberID")
        self.isLogin = decoder.decodeBool(forKey: "isLogin")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.userID, forKey: "userID")
        coder.encode(self.userToken, forKey: "userToken")
        coder.encode(self.isRememberID, forKey: "isRememberID")
        coder.encode(self.isLogin, forKey: "isLogin")
    }
    
    
}
class UserNotificationInfo: NSObject {
    var isReceivePush : Bool = false
    var pushInfo : String = ""
    init(isReceivePush: Bool, pushInfo: String) {
        self.isReceivePush = isReceivePush
        self.pushInfo = pushInfo
    }
    override init() {
        self.pushInfo = ""
        self.isReceivePush = false
    }
}
