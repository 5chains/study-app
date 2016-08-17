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
            .ScrollMenuBackgroundColor(UIColor.blackColor()),
            .ViewBackgroundColor(UIColor.blackColor()),
            .SelectionIndicatorColor(UIColor.orangeColor()),
            .BottomMenuHairlineColor(UIColor.blackColor()),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 21.0)!),
            .MenuHeight(60.0),
            .MenuItemWidth(100.0),
            .CenterMenuItems(true),
            .MenuItemSeparatorWidth(4.3)   ]
    }
    func addController(viewController: UIViewController) {
        self.controllerArray.append(viewController)
    }
    
    func setPageMenu(baseViewController: UIViewController) {
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 50.0, baseViewController.view.frame.width, baseViewController.view.frame.height), pageMenuOptions: params)
        baseViewController.view.addSubview(pageMenu!.view)
        
    }
}