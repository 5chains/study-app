//
//  ChatViewController.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/17.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatScrollView: UIScrollView!
        override func viewDidLoad() {
        super.viewDidLoad()
        let chatTableView:ChatTableView = ChatTableView(frame: CGRectMake(0, 0,1000, chatScrollView.frame.width),style: .Plain)
        
        chatScrollView.addSubview(chatTableView)

        // Do any additional setup after loading the view.
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
