//
//  FavoritesCell.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 3/19/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import Foundation
import UIKit

class FavoritesCell : UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amiiboImg: CustomImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
