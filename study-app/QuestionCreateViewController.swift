//
//  QuestionCreateViewController.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/17.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

class QuestionCreateViewController: UIViewController {

    @IBOutlet weak var subjectSegment: UISegmentedControl!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "投稿", style: .plain, target: self, action: #selector(QuestionCreateViewController.createQuestion))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "←", style: .plain, target: self, action: #selector(self.backPageMenu))
        
        
    }
    
    func createQuestion() {
        let question = Question(title: titleTextField.text!, content: contentTextView.text)
        print(SubjectSegment(rawValue: subjectSegment.selectedSegmentIndex)!)
        question.subjectSegment = SubjectSegment(rawValue: subjectSegment.selectedSegmentIndex)!
        
        question.save{ () in
            self.performSegue(withIdentifier: "chatViewController", sender: nil)
        }
    
    }
    
    func backPageMenu() {
        self.dismiss(animated: true, completion: nil)
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
