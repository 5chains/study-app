//
//  EnglishViewController.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/18.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

protocol EnglishViewControllerDelegate: class {
    
    
    func goChatView()
}

class EnglishViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    weak var delegate: EnglishViewControllerDelegate!
    var timer:Timer = Timer()
    
    let controllerNumber :SubjectSegment = .english
    
    
    let refreshControl = UIRefreshControl()
    
    var tableView = UITableView()
    let pageMenuViewController:PageMenuViewController = PageMenuViewController(nibName: "PageMenuViewController",bundle: nil)
    let questionManager = QuestionManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        tableView = MathTableView(frame: frame,style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        self.view.addSubview(tableView)
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "更新中")
        self.refreshControl.addTarget(self, action: #selector(refresh(_:)), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl)
        questionManager.fetchQuestions(controllerNumber){ () in
            self.tableView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionManager.questions.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
        let question = questionManager.questions[(indexPath as NSIndexPath).row]
        //        print(question.subjectSegment)
        
        
        cell.questionUserNameLabel.text = "shun"
        cell.questionThemeLabel.text = question.title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // デリゲートメソッドを呼び出す
        delegate?.goChatView()
    }
    
    
    
    
    
    func refresh(_ sender: UIRefreshControl) {
        //        timer = NSTimer.scheduledTimerWithTimeInterval(5.0,target: self,selector: #selector(self.endRefresh(_:)),userInfo: nil,repeats: false)
        self.questionManager.fetchQuestions(controllerNumber){ (controllerNumber) in
            self.tableView.reloadData()
        }
        self.refreshControl.endRefreshing()
        
        
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
