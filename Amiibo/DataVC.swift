//
//  DataVC.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 2/7/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit

protocol DataVCDelegate: class {
    func didAddToFavorites(_ amiibo: AmiiboForView?)
}

class DataVC: UIViewController, UITabBarDelegate, UITabBarControllerDelegate {
    
    weak var delegate: DataVCDelegate?
    var amiibo: AmiiboForView?
    
    @IBOutlet var dataView: UIView!
    @IBOutlet weak var avatarImage: CustomImageView?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var amiiboSeriesLabel: UILabel!
    @IBOutlet weak var releaseDateLabelReal: UILabel!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var nameHolderLabel: UILabel!
    @IBOutlet weak var amiiboSeriesHolderLabel: UILabel!
    @IBOutlet weak var gameSeriesHolderLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var addToFavortiesBtn: UIButton!
    
    @IBAction func AddToFavorites(_ sender: Any) {
        amiibo?.isFavorite = true
        delegate?.didAddToFavorites(amiibo)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        view.backgroundColor                = .white
        redView.layer.cornerRadius          = 20
}
    
    func setupData() {
         if let amiibo = amiibo,
            let url    = URL(string: amiibo.imageUrl ?? "nil")
        {
            avatarImage?.loadImage(from: url)
            nameLabel.text            = amiibo.name
            seriesLabel.text          = amiibo.gameSeries
            amiiboSeriesLabel.text    = amiibo.series
            releaseDateLabelReal.text = "NA:" + (amiibo.releaseDate ?? "nil")            
        }
         else {
            print ("Error")
        }
    }
 }
