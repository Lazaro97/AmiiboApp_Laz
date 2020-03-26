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

class DataVC: UIViewController {
    weak var delegate: DataVCDelegate?
    var amiibo: AmiiboForView?
    
    @IBOutlet weak var dataViewBoderOne: UIView!
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
    
    @IBOutlet weak var addToFav: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor       = .white
        setupData()
        redView.layer.cornerRadius = 20
        dataViewBoderOne.layer.cornerRadius = 10
}
    
    
    func setupData() {
         if let amiibo = amiibo,
            let url    = URL(string: amiibo.imageUrl ?? "nil")
        {
            avatarImage?.loadImage(from: url)
            nameLabel.text            = amiibo.name
            seriesLabel.text          = amiibo.gameSeries
            amiiboSeriesLabel.text    = amiibo.series
            releaseDateLabelReal.text = "NA:" + amiibo.releaseDate!            
        }
         else {
            print ("Error")
        }
    }
 }
//TEST
