//
//  ScienceTableView.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/18.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit


class ScienceTableView: UITableView,UITableViewDataSource,UITableViewDelegate {
    
    
    
    
    override init(frame: CGRect,style: UITableViewStyle) {
        super.init(frame: frame,style: style)
        self.delegate = self
        self.dataSource = self
        
        self.registerNib(UINib(nibName: "QuestionTableViewCell", bundle: nil), forCellReuseIdentifier: "QuestionTableViewCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionTableViewCell", forIndexPath: indexPath) as! QuestionTableViewCell
        
        cell.questionUserNameLabel.text = "kota"
        cell.questionThemeLabel.text = "アボガドロ数まぢむり"
        return cell
    }
    
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
