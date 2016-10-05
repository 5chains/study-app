//
//  ViewController.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/17.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//


import UIKit
import PageMenu
import MMDrawerController

class PageMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MathViewControllerDelegate,EnglishViewControllerDelegate,JapaneseViewControllerDelegate {
    
    var pageMenuModel = PageMenuModel()
    let questionManager = QuestionManager.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NCMBUser.current() == nil{
            performSegue(withIdentifier: "loginViewController", sender: nil)
        }
                
        let controller1:MathViewController = MathViewController(nibName: "MathViewController",bundle: nil)
        controller1.title = "数学"
        controller1.tableView.delegate = self
        controller1.tableView.dataSource = self
        controller1.delegate = self
        
        let controller2:EnglishViewController = EnglishViewController(nibName: "EnglishViewController",bundle: nil)
        controller2.title = "英語"
        controller2.delegate = self
        let controller3:JapaneseViewController = JapaneseViewController(nibName: "JapaneseViewController",bundle: nil)
        controller3.title = "国語"
        controller3.delegate = self
        controller3.view.backgroundColor = UIColor.blue
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
        
        
        
        
    }
    
    func goChatView() {
     
        performSegue(withIdentifier: "chatViewControllerFromCell", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "投稿", style: .plain, target: self, action: #selector(PageMenuViewController.createQuestionGo))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: nil,style: .plain,target: self,action: #selector(PageMenuViewController.humber))
        let size = CGSize(width: 30, height: 30)
        UIGraphicsBeginImageContext(size)
        let images = UIImage(named: "humbergerMenu.png")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        images?.draw(in: CGRect(x: 0, y: 0, width: size.height,height: size.width ))
        navigationItem.leftBarButtonItem?.image = images
        
        
    }
    func humber(){
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left,animated: true, completion:nil)
    }
    
    func createQuestionGo() {
        performSegue(withIdentifier: "questionCreateViewController", sender: nil)
    }
    
//    func logout() {
//        NCMBUser.logOut()
//        performSegueWithIdentifier("loginViewController", sender: nil)
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionManager.questions.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
        
        
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
