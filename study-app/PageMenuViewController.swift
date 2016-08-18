//
//  ViewController.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/17.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit
import PageMenu

class PageMenuViewController: UIViewController {
    
    var pageMenuModel = PageMenuModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let controller1:MathViewController = MathViewController(nibName: "MathViewController",bundle: nil)
        controller1.title = "数学"
        
        let controller2:EnglishViewController = EnglishViewController(nibName: "EnglishViewController",bundle: nil)
        controller2.title = "英語"
        let controller3:JapaneseViewController = JapaneseViewController(nibName: "JapaneseViewController",bundle: nil)
        controller3.title = "国語"
        controller3.view.backgroundColor = UIColor.blueColor()
        let controller4:SocietyViewController = SocietyViewController(nibName: "SocietyViewController",bundle: nil)
        controller4.title = "社会"
        let controller5:ScienceViewController = ScienceViewController(nibName: "ScienceViewController",bundle: nil)
        controller5.title = "理科"
        
        
        pageMenuModel.addController(controller1)
        pageMenuModel.addController(controller2)
        pageMenuModel.addController(controller3)
        pageMenuModel.addController(controller4)
        pageMenuModel.addController(controller5)
        pageMenuModel.setPageMenu(self)

        
        
        if NCMBUser.currentUser() == nil{
            performSegueWithIdentifier("loginViewController", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "投稿", style: .Plain, target: self, action: #selector(PageMenuViewController.createQuestionGo))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "ログアウト",style: .Plain,target: self,action: #selector(PageMenuViewController.logout))
        
    }
    
    func createQuestionGo() {
        performSegueWithIdentifier("questionCreateViewController", sender: nil)
    }
    
    func logout() {
        NCMBUser.logOut()
        performSegueWithIdentifier("loginViewController", sender: nil)
    }
    
    
    
    
    
    
    
    
    
    

}

