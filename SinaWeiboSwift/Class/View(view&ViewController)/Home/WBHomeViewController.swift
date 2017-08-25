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
    
    lazy var statusList = [String]()

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
        
        refreshController = UIRefreshControl()
        tableview?.addSubview(refreshController!)
        refreshController?.addTarget(self, action: #selector(loadData), for: UIControlEvents.valueChanged)
    }
    
    override func loadData() {
        if statusList.count > 0 {
            statusList.removeAll()
        }
        for i in 0..<20 {
            statusList.insert(i.description, at: 0)
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
}
