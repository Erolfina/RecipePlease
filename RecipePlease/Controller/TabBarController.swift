//
//  TabBarController.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-11.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    let tabBarMenu = UITabBarItem.appearance()
    let fontTabBar = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 18)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarCustomized()
      
        
        // Do any additional setup after loading the view.
    }

    private func tabBarCustomized() {
        tabBarMenu.setTitleTextAttributes(fontTabBar as [NSAttributedString.Key : Any], for: .normal)
    }
    



}
