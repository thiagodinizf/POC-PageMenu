//
//  ViewController.swift
//  POC-PageMenu
//
//  Created by Thiago Diniz on 12/04/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit

struct TabModel {
    let id: Int
    let title: String
}

class MenuViewController: UIViewController {

    var pageMenu : CAPSPageMenu?
    
    var tabs = [TabModel(id: 30031, title: "Filmes (46)"),
                TabModel(id: 30032, title: "Programas de TV / Séries (5)"),
                TabModel(id: 30033, title: "Filmes para alugar (23)")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search"

        var controllerArray : [UIViewController] = []

        for tab in tabs {
            let controller = StoryboardScene.Main.resultViewController.instantiate()
            if let navigation = self.navigationController {
                controller.parent?.addChildViewController(navigation)
            }
            controller.title = tab.title
            controller.filter = tab.id
            controllerArray.append(controller)
        }
        
        // Customize menu (Optional)
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(1.0),
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .bottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .selectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .menuMargin(10.0),
            .menuHeight(40.0),
            .selectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .unselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
            .useMenuLikeSegmentedControl(false),
            .menuItemSeparatorRoundEdges(true),
            .selectionIndicatorHeight(2.0),
            .menuItemSeparatorPercentageHeight(0.1),
            .scrollAnimationDurationOnMenuItemTap(250),
            .menuItemWidthBasedOnTitleTextWidth(true)
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 64.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        // Optional delegate
        pageMenu!.delegate = self
        
        self.view.addSubview(pageMenu!.view)
    }
}

extension MenuViewController: CAPSPageMenuDelegate {
    
    func didMoveToPage(_ controller: UIViewController, index: Int) {
//        print("did move to page")
    }
    
    func willMoveToPage(_ controller: UIViewController, index: Int) {
//        print("will move to page")
    }
}

