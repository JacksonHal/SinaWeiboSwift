//
//  WBMainTabBarController.swift
//  SinaWeiboSwift
//
//  Created by meixiang02 on 2017/7/3.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit

class WBMainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildViewControllers()
    }

}

//extension 类似于 OC 中的分类， 在Swift中还可以用来切分代码块
//可以把相近功能的函数，放在一个extension中
//便于代码的维护
//注意：和OC的分类一样，extension中不能定义属性
// MARK: - 设置界面
extension WBMainTabBarController {
    
    //设置所有的控制器
     func setupChildViewControllers() {
        let array = [["clsName":"WBHomeViewController", "title":"首页", "imageName":"hehe"]
        
        ]
        var mArray = [UIViewController]()
        for dict in array {
            mArray.append(controller(dict: dict))
        }
        viewControllers = mArray
        
        
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典
    /// - Returns: 子控制器
    private func controller(dict: [String : String]) -> UIViewController {
        guard let  clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else {
                return UIViewController();
        }
        
        let vc = cls.init()
        vc.title = title
        let nav = WBNavigationViewController(rootViewController: vc)
        return nav
        
    }
}
