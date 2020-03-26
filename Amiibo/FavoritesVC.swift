//
//  FavoritesVC.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 3/19/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import Foundation
import UIKit

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //TEST 
    
    
    @IBOutlet weak var FavTableView: UITableView!
    var favorites: [AmiiboForView] = [] {
        didSet {
            FavTableView.reloadData()
        }
    } 
    
    override func viewDidLoad() {
          super.viewDidLoad()
          navigationItem.title      = "Fav"
          self.tabBarItem.title     = "Favorites"
          FavTableView.delegate     = self
          FavTableView.dataSource   = self
      }
    
    //GET FAV FUNCTION MUST CREATE
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell") as! FavoritesCell
        let favorite = favorites[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let homeVC = DataVC()
    }
}
