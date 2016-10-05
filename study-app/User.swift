//
//  User.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/18.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String
    var password: String
    
    init(name: String ,password: String) {
        self.name = name
        self.password = password
    }
    
    func signUp(){
        let user = NCMBUser()
        user.userName = name
        user.password = password
        user.signUpInBackground{ (error) in
            if error == nil {
            }
        }


        
        
//        user.signUpInBackgroundWithBlock{(error: NCMBErrorResultBlock) in
//            if error != nil {
//                // 新規登録失敗時の処理
//                
//            }else{
//                // 新規登録成功時の処理
//            }
//        }
        
    }
    
    func login(_ callback: @escaping (_ message: String?) -> Void) {
//        NCMBUser.logInWithUsername(inBackground: self.name, password: self.password) { (user, error) in
//            callback(error?.userInfo["NSLocalizedDescription"] as? String)
//        }
    }


}
