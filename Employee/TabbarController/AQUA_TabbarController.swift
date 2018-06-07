//
//  AQUA_TabbarController.swift
//  Employee
//
//  Created by Thanh Tuan on 3/7/18.
//  Copyright © 2018 Thanh Tuan. All rights reserved.
//

import UIKit

class AQUA_TabbarController: UITabBarController {

    var items0 : UITabBarItem = UITabBarItem()
    var items1 : UITabBarItem = UITabBarItem()
    var items2 : UITabBarItem = UITabBarItem()
    var items3 : UITabBarItem = UITabBarItem()
    
    init() {
        super.init(nibName:nil, bundle:nil)
        self.view.backgroundColor = UIColor.white
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let HomePageNav : UINavigationController = storyboard.instantiateViewController(withIdentifier: "HomePageNAV") as! UINavigationController
        let ServiceNAV : UINavigationController = storyboard.instantiateViewController(withIdentifier: "ServiceNAV") as! UINavigationController
        let ProductNAV : UINavigationController = storyboard.instantiateViewController(withIdentifier: "ProductNAV") as! UINavigationController
        let ProfileNAV : UINavigationController = storyboard.instantiateViewController(withIdentifier: "ProfileNAV") as! UINavigationController
        self.viewControllers = [HomePageNav,ServiceNAV,ProductNAV,ProfileNAV]
        
        items0 = self.tabBar.items![0]
        items0.title = "Trang Chủ"
        items0.image = UIImage(named: "iconHomePage.png")
        
        items1 = self.tabBar.items![1]
        items1.title = "Tiện ích"
        items1.image = UIImage(named: "iconTool.png")
        
        items2 = self.tabBar.items![2]
        items2.title = "Sản Phẩm"
        items2.image = UIImage(named: "iconCart.png")
        
        items3 = self.tabBar.items![3]
        items3.title = "Thông tin cá nhân"
        items3.image = UIImage(named: "iconAccount.png")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    

}
