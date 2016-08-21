//
//  MathViewController.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/18.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

protocol MathViewControllerDelegate: class {
    func goChatView()
}

class MathViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    weak var delegate: MathViewControllerDelegate!
    
    var tableView = UITableView()
    let pageMenuViewController:PageMenuViewController = PageMenuViewController(nibName: "PageMenuViewController",bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.brownColor()
        
        let frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        tableView = MathTableView(frame: frame,style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        self.view.addSubview(tableView)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionTableViewCell", forIndexPath: indexPath) as! QuestionTableViewCell
        
        cell.questionUserNameLabel.text = "shun"
        cell.questionThemeLabel.text = "三角関数まぢむりぃ"
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // デリゲートメソッドを呼び出す
        delegate?.goChatView()
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
