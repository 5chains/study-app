//
//  PageMenuModel.swift
//  study-app
//
//  Created by 笹野　駿 on 2016/08/18.
//  Copyright © 2016年 shun-sasano. All rights reserved.
//

import Foundation
import PageMenu

class PageMenuModel {
    var pageMenu: CAPSPageMenu?
    let params: [CAPSPageMenuOption]
    var controllerArray: [UIViewController] = []
    
    init() {
        params = [
            .scrollMenuBackgroundColor(UIColor.black),
            .viewBackgroundColor(UIColor.black),
            .selectionIndicatorColor(UIColor.blue),
            .bottomMenuHairlineColor(UIColor.black),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 14.0)!),
            .menuHeight(40.0),
            .menuItemWidth(50.0),
            .centerMenuItems(true),
            .menuItemSeparatorWidth(4.3)   ]
    }
    func addController(_ viewController: UIViewController) {
        self.controllerArray.append(viewController)
    }
    
    func setPageMenu(_ baseViewController: UIViewController) {
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 65.0, width: baseViewController.view.frame.width, height: baseViewController.view.frame.height), pageMenuOptions: params)
        baseViewController.view.addSubview(pageMenu!.view)
        
    }
}
