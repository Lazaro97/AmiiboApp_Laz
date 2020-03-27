//
//  FavoritesVC.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 3/19/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import Foundation
import UIKit

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate {
     
    @IBOutlet weak var FavTableView: UITableView!
      
    var favorites: [AmiiboForView] = [] {
            didSet {
                func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
                        //ask where it is first tab bar item
                        if self.tabBarController?.selectedIndex == 0 {
                            self.FavTableView.reloadData()
                    }
                        else if tabBarController?.selectedIndex == 1 {
                            self.FavTableView.reloadData()
                    }
                }
            }
        }
    
//    var favorites: [AmiiboForView] = [] {
//        didSet {
//            return    //  self.FavTableView.reloadData()
//        }
//    }
//
//    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//
//        //ask where it is first tab bar item
//        if self.tabBarController?.selectedIndex == 0 {
//            // your action, e.g.:
//            self.FavTableView.reloadData()
//        }
//    }
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          navigationItem.title      = "Fav"
          self.tabBarItem.title     = "Favorites"
          FavTableView.delegate     = self
          FavTableView.dataSource   = self
        self.tabBarController?.delegate = self

}
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell") as! FavoritesCell
        let favorite = favorites[indexPath.row]
        cell.nameLabel.text = favorite.name!
        
        if let url = URL(string: favorite.imageUrl ?? "nil") {
            cell.amiiboImg?.loadImage(from: url)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let homeVC = DataVC()
    }
}
