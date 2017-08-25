//
//  WBHomeViewController.swift
//  SinaWeiboSwift
//
//  Created by meixiang02 on 2017/7/3.
//  Copyright © 2017年 好杰. All rights reserved.
//

import UIKit

private let cellId = "cellId"
class WBHomeViewController: WBBaseViewController {
    
    //表格视图的数据源
    lazy var statusList = [String]()
    
    //是否是上拉刷新
    lazy var isPullRefresh : Bool = {
        let isPullRefresh = false
        return isPullRefresh
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addFriend(btn : UIButton) {
        
        let test = TestViewController.init()
        
        //test.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(test, animated: true)
    }
    
    override func setupUI() {
        
        //重写父类的方法
        super.setupUI()
        
        navItem.leftBarButtonItem = UIBarButtonItem.init(width: 65, title: "添加好友", normalColor: UIColor.darkGray, highlightColor: UIColor.orange, fontSize: 15.0, target: self, action: #selector(addFriend(btn:)), isBack:false)
        tableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        
    }
    
    override func loadData() {
        if isPullRefresh == false {
            statusList.removeAll()
            for i in 0..<20 {
                statusList.insert(i.description, at: 0)
            }
        }else {
            for i in 0..<10 {
                statusList.append(i.description + "上拉加载")
            }
            isPullRefresh = false
        }
        
        tableview?.reloadData()
        refreshController?.endRefreshing()
    }
}

extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellId)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //将要显示的row
        let row = indexPath.row
        
        if row < 0 {
            return
        }
        //tableView的所有组数
        let  sections = tableview?.numberOfSections
        //tableView的所有的行数
        let rowCount = tableview?.numberOfRows(inSection: sections!-1)
        //判断将要显示的是最后一个cell
        if row == rowCount!-1 {
            isPullRefresh = true
            loadData()
        }
    }
}
