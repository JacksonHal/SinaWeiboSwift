//
//  WBBaseViewController.swift
//  SinaWeiboSwift
//
//  Created by meixiang02 on 2017/7/3.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit


// MARK: - 各种控制器的基类控制器
class WBBaseViewController: UIViewController {

    
    
    /// 表格视图
    var tableview : UITableView?
    
    //刷新控件
    var refreshController : UIRefreshControl?
    
    //用户是否登录
    var userLogin = false
    
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.hj_ScreenWidth(), height: 64))
    
    //自定义UINavigationItem  以后设置导航栏内的内容，统一使用navItem（不再使用系统自带的）
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        
        //设置UI
        setupUI()
        
        //设置数据源
        loadData()
    }
    
    //重写title方法
    override var title: String?{
        didSet {
            navItem.title = title
        }
    }
    
    
    /// 数据源方法   父类不需要实现，子类需要实现
    func loadData() {
        refreshController?.endRefreshing()
    }

}


/*
 extension 中 不能有属性
 extension 中 不能重写‘父类’的本类的方法。重写父类的方法是子类的职责，扩展是类的职责
 */
// MARK: - 设置UI界面
extension WBBaseViewController  {

    /// 设置UI
    func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        ///设置导航条
        setNavigationBar()
        ///添加表格视图
        setupTableView()
        ///添加访客视图
        userLogin ? setupTableView() : setVisitorView()
        
    }
    
    func setupTableView() {
        tableview = UITableView(frame: view.frame, style: UITableViewStyle.plain)
        tableview?.delegate = self
        tableview?.dataSource = self
        view.insertSubview(tableview!, belowSubview: navigationBar)
        tableview?.contentInset = UIEdgeInsetsMake(navigationBar.bounds.height, 0, tabBarController?.tabBar.bounds.size.height ?? 49, 0)
        
        refreshController = UIRefreshControl()
        tableview?.addSubview(refreshController!)
        refreshController?.addTarget(self, action: #selector(loadData), for: UIControlEvents.valueChanged)
        
        
    }
    
    /// 设置导航条
    func setNavigationBar() {
        
        //添加自定义导航条
        view.addSubview(navigationBar)
        
        //将navItem 添加到 navigationBar
        navigationBar.items = [navItem]
        
        //设置navigationBar的渲染颜色
        navigationBar.barTintColor = UIColor.hj_RGBColor(0xF6F6F6)
        
        //设置navigationBar的title的颜色  深灰色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.darkGray];
    }
    
    func setVisitorView() {
        let visitorView = WBVisitorView(frame: view.bounds)
        
        //visitorView.backgroundColor = UIColor.yellow
        
        view .insertSubview(visitorView, belowSubview: navigationBar)
        
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension WBBaseViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
