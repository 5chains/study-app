//
//  SocietyViewController.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/18.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

class SocietyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.brownColor()
        
        let frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let tableView = SocietyTableView(frame: frame,style: .Plain)
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
