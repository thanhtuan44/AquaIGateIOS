//
//  PushNotification.swift
//  Employee
//
//  Created by Thanh Tuan on 4/14/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit
import UserNotifications
import FirebaseCore
import FirebaseInstanceID
import FirebaseMessaging

extension AppDelegate {
//    func application(received remoteMessage: MessagingRemoteMessage) {
//        print(remoteMessage.appData)
//    }
    
    func registerForPushNotifications() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {(granted, error) in
                if granted {
                    print("Permission is granted")
                } else {
                    print("Permission is fail")
                }
            })
            
            UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {settings in
                guard settings.authorizationStatus == .authorized else {
                    print("authorizations status is failed.")
                    return
                }
                
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            })
//            Messaging.messaging().delegate = self
        }else{
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
//        FirebaseApp.configure()
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map{ data in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device token: \(token)")
        if(token != ""){
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: token)
            UserDefaults.standard.set(encodedData, forKey: "DeviceTokenUser")
        }
//        Messaging.messaging().apnsToken = deviceToken
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("fail to register with error: \(error)")
    }
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, didReceiveRemoteNotification data: [AnyHashable : Any]) {
        // Print notification payload data
        application.applicationIconBadgeNumber = 0
        if(application.applicationState == UIApplicationState.inactive || application.applicationState == UIApplicationState.background) {
            if let window = self.window {
                if(AQUA_User.shared.userAqua.isLogin == true) {
                    window.rootViewController = tabbarController
                    tabbarController?.selectedIndex = 3
                    AQUA_User.shared.userPushNotificationInfo.isReceivePush = true
                    AQUA_User.shared.userPushNotificationInfo.pushInfo = ""
                }else {
                    if let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? AQUA_LoginVC{
                        window.rootViewController = loginVC
                    }
                }
            }
        }else if(application.applicationState == UIApplicationState.active){
            let localNotification = UILocalNotification()
            localNotification.fireDate = Date(timeIntervalSinceNow: 5)
            localNotification.alertBody = String(format:"%@",data)
            localNotification.timeZone = TimeZone.current
            UIApplication.shared.scheduleLocalNotification(localNotification)
        }
    }
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
         completionHandler([.alert, .badge, .sound])
        
    }
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        if let window = self.window {
            if(AQUA_User.shared.userAqua.isLogin == true) {
                window.rootViewController = tabbarController
                tabbarController?.selectedIndex = 3
                let userInfo = response.notification.request.content.userInfo as NSDictionary
                if let aps = userInfo.object(forKey: "aps") as? NSDictionary {
                    if let alert = aps.object(forKey: "alert") as? String {
                        AQUA_User.shared.userPushNotificationInfo.isReceivePush = true
                        AQUA_User.shared.userPushNotificationInfo.pushInfo = alert
                    }
                }
            }else {
                if let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? AQUA_LoginVC{
                    window.rootViewController = loginVC
                }
            }
        }
    }
}
