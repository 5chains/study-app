//
//  ChatTableView.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/19.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

class ChatTableView: UITableView,UITableViewDelegate,UITableViewDataSource {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame,style: style)
        self.delegate = self
        self.dataSource = self
        
        self.registerNib(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChatTableViewCell", forIndexPath: indexPath) as! ChatTableViewCell
        
        cell.nameLabel.text = "shun"
        cell.contentLabel.text = "三角関数はあれでやると簡単"
        return cell
    }


}
