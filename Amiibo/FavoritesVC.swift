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
     
    @IBOutlet weak var FavTableView: UITableView?
          
    var favorites: [AmiiboForView] = [] {
        didSet {
            FavTableView?.reloadData()
        }
    }
    override func viewDidLoad() {
          super.viewDidLoad()
         self.tabBarItem.title      = "Favorites"
         FavTableView?.delegate     = self
         FavTableView?.dataSource   = self
         self.tabBarController?.delegate = self
         self.tabBarController?.navigationItem.title = "Favorites"

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
