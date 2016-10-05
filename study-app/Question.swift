//
//  Question.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/09/09.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

enum SubjectSegment:Int {
    case math = 0
    case english = 1
    case japanese = 2
    case social = 3
    case science = 4
}

class Question: NSObject {
    
    var title: String
    var content: String
    var subjectSegment: SubjectSegment = .math
    var user: User? //?をつけることによってinitにuserを入れる必要なくなる。
    
    init(title: String,content: String) {
        self.title = title
        self.content = content
    }
    
    
    func save(_ callback: @escaping () -> Void) {
        let questionObject = NCMBObject(className: "Question")
        questionObject?.setObject(title, forKey:"title")
        questionObject?.setObject(content, forKey: "content")
        questionObject?.setObject(subjectSegment.rawValue, forKey: "subjectSegment")
        questionObject?.setObject(NCMBUser.current(), forKey: "user")
        questionObject?.saveInBackground{ (error) in
            if error == nil {
                callback()
            }
        }
    }

}
