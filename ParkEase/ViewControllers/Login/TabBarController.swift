//
//  TabBarController.swift
//  ParkEase
//
//  Created by Сергей Поляков on 14.05.2023.
//

import UIKit

class TabBarController: UITabBarController {
   
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - Private Methods
    private func setupTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
