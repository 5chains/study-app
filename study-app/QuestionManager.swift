//
//  QuestionManager.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/09/09.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

class QuestionManager: NSObject {
    static let sharedInstance = QuestionManager()
    var questions: [Question] = []
    
    func fetchQuestions(_ controllerNumber: SubjectSegment, callback: @escaping () -> Void) {
        let query = NCMBQuery(className: "Question")
        query?.includeKey("user")
        query?.order(byDescending: "createDate")
        query?.findObjectsInBackground{ (objects ,error) in
            if error == nil {
                self.questions = []
                for object in objects!{
                    let title = (object as AnyObject).object(forKey: "title") as! String
                    let content = (object as AnyObject).object(forKey: "content") as! String
                    let subjectSegment = (object as AnyObject).object(forKey: "subjectSegment")
                    let userObject = (object as AnyObject).object(forKey: "user") as! NCMBUser
                    let user = User(name: userObject.userName, password: "")
                    
                    let question = Question(title: title, content: content)
                    let preSubjectSegment = SubjectSegment(rawValue: subjectSegment as! Int)!
                    if preSubjectSegment == controllerNumber {
                        question.subjectSegment = preSubjectSegment
                        question.user = user
                        self.questions.append(question)
                    }
                    
                    callback()
                    
                }
            }
        }
    }

}
