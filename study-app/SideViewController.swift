//
//  SideViewController.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/09/08.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

class SideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        NCMBUser.logOut()
        performSegue(withIdentifier: "loginViewController", sender: nil)
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
