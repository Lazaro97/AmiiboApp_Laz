//
//  HomeCell.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 2/7/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage:CustomImageView?
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var characterNameHolder: UILabel!
    @IBOutlet weak var amiiboSeriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage?.layer.cornerRadius = 10
        
    }
}
