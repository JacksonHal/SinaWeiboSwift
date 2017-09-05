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
        setComposeBtn()
    }
    
    /**
     portrait : 横屏
     landscape: 竖屏
     */
    /// 视屏幕支持横屏
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    //@objc作用   能够允许该函数在“运行时” 通过OC 的消息转发机制被调用
    @objc fileprivate func composeClick(btn : UIButton) {
        print("撰写方法")
        
        /*
         测试横屏代码：方向旋转
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.orange
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
        */
    }
    
    /// 懒加载
    lazy var composeBtn : UIButton = {
        let composeBtn : UIButton = UIButton()
        composeBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControlState.normal)
        composeBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        return composeBtn
    }()

}

//extension 类似于 OC 中的分类， 在Swift中还可以用来切分代码块
//可以把相近功能的函数，放在一个extension中
//便于代码的维护
//注意：和OC的分类一样，extension中不能定义属性
// MARK: - 设置界面
extension WBMainTabBarController {
    
    
    /// 设置撰写按钮
    fileprivate func setComposeBtn() {
        
        tabBar.addSubview(composeBtn)
        //tabbar上按钮的个数
        let count = CGFloat(childViewControllers.count)
        //按钮的宽度
        let w = tabBar.bounds.width/count - 1
        //CGRectInSet    正数向内缩进，负数想外扩展  注意：这一步非常有必要
        composeBtn.frame = tabBar.bounds.insetBy(dx: 2*w, dy: 0)
        print(composeBtn.frame.width)
        
        composeBtn.addTarget(self, action:#selector(composeClick(btn:)), for: UIControlEvents.touchUpInside)
        
    }
    
    /// 设置所有的控制器
    fileprivate func setupChildViewControllers() {
        let array = [
            ["clsName":"WBHomeViewController", "title":"首页", "imageName":"tabbar_home"],
            ["clsName":"WBMessageViewController", "title":"消息", "imageName":"tabbar_message_center" ],
            ["clsName":""],
            ["clsName":"WBDiscoverViewController", "title":"发现", "imageName":"tabbar_discover"],
            ["clsName":"WBMineViewController", "title":"我", "imageName":"tabbar_profile", "selectImageName":"tabbar_profile_highlighted"]
        ]
        var mArray = [UIViewController]()
        for dict in array {
            mArray.append(controller(dict: dict))
        }
        
        //设置tabbar的标题的属性 方法一：
        /*
         UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 14)], for: UIControlState.normal)
         UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName : UIColor.orange], for: UIControlState.selected)
         */
        
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
        
        let visitorInfo : [String : String]?
        switch clsName {
        case "WBHomeViewController":
            visitorInfo = ["imageName":"", "message":"关注一些人，回这里看看有什么惊喜"]
        case "WBMessageViewController":
            visitorInfo = ["imageName":"visitordiscover_image_message", "message":"登录后，别人评论你的微博，发给你的消息，都会在这里收到通知"]
        case "WBDiscoverViewController":
            visitorInfo = ["imageName":"visitordiscover_image_message", "message":"登陆后，最新、最热微博尽在掌握，不再会与事实潮流擦肩而过"]
        case "WBMineViewController":
            visitorInfo = ["imageName":"visitordiscover_image_profile", "message":"登录后，你的w微博，相册，个人资料会显示在这里，展示给别人"]
        default:
            visitorInfo = nil
        }
        
        
        //创建控制器
        let vc = cls.init()
        vc.title = title
        
        (vc as! WBBaseViewController).visitorInfo = visitorInfo
        
        //创建navigationController
        let nav = WBNavigationViewController(rootViewController: vc)
        
        //设置tabbar的图标
        nav.tabBarItem.image = UIImage(named: imageName )?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        nav.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        //设置tabbar的标题
        nav.tabBarItem.title = title
        //设置高亮时标题的颜色
        nav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 1.0, green: 0.51, blue: 0.0, alpha: 1.0)], for: .highlighted)
        //设置tabbar的标题的大小  默认是 12
        nav.tabBarItem.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 13)], for: UIControlState.normal)
        
        return nav
        
    }
}
