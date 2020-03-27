//
//  TabBarVC.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 3/26/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit
class TabBarVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // tell our UITabBarController subclass to handle its own delegate methods
        self.delegate = self
    }

    // called whenever a tab button is tapped
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if let firstVC = viewController as? HomeVC {
            firstVC.AmiiboData()
        }

        if viewController is HomeVC {
            print("First tab")
        } else if viewController is DataVC {
            print("Second tab")
        }
    }
}
