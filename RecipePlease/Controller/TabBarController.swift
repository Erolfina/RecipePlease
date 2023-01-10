//
//  TabBarController.swift
//  RecipePlease
//
//  Created by Flore Gridaine on 2023-01-11.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    //MARK: Propreties
    let tabBarMenu = UITabBarItem.appearance()
    let fontTabBar = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 18)]
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarCustomized()
    }

    //MARK: Private Methods
    private func tabBarCustomized() {
        tabBarMenu.setTitleTextAttributes(fontTabBar as [NSAttributedString.Key : Any], for: .normal)
    }

}
