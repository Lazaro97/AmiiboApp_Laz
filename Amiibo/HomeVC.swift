//
//  HomeVC.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 2/5/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
 
    @IBOutlet weak var SearchController: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var listButton: UIButton!
    @IBAction func ReoladData(_ sender: Any) {
        AmiiboData()
        self.collectionView.reloadData()
    }
    
    var amiiboList =  [AmiiboForView]()
    var amiiboToPass: AmiiboForView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title      = "Amiibo"
        self.tabBarItem.title     = "Home"
        self.collectionView.keyboardDismissMode = .onDrag
        collectionView.delegate   = self
        collectionView.dataSource = self
        SearchController.delegate = self
        AmiiboData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationController?.setNavigationBarHidden(true, animated: animated)
    }


      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func AmiiboData () {
            let anonymousFunction = { (fetchedAmiiboList: [Amiibo]) in
            DispatchQueue.main.async {
                let amiiboForView = fetchedAmiiboList.map { amiibo in
    
                return AmiiboForView(
                    name: amiibo.name,
                    series: amiibo.amiiboSeries,
                    gameSeries:amiibo.gameSeries,
                    imageUrl: amiibo.image,
                    releaseDate: amiibo.release?.na
                    )
                }
                self.amiiboList = amiiboForView
                self.collectionView.reloadData()
            }
        }
            AmiiboApiList.shared.fetchAmiiboApiList(onCompletion: anonymousFunction)
    }
    
    var timer: Timer?
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            searchBar.layer.borderWidth = 10
            searchBar.layer.cornerRadius = 10
            searchBar.layer.borderColor = UIColor.white.cgColor
            
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (_) in
            
            let anonymousFunctions = { (fetchedAmiiboList: [Amiibo]) in
                DispatchQueue.main.async {
                    let amiiboForView = fetchedAmiiboList.map { amiibo in
                        return AmiiboForView(
                                          name: amiibo.name,
                                          series: amiibo.amiiboSeries,
                                          gameSeries:amiibo.gameSeries,
                                          imageUrl: amiibo.image,
                                          releaseDate: amiibo.release?.na
                                          )
                    }
                    self.amiiboList = amiiboForView
                    self.collectionView.reloadData()
                }
            }
            AmiiboApi.shared.fetchAmiiboList(searchTerm:searchText, onCompletion: anonymousFunctions)
    })
}
            

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amiiboList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell {

            let amiibo = amiiboList[indexPath.item]
            
            cell.layer.cornerRadius         = 10
            cell.characterNameHolder.text   = "Name: " + amiibo.name!
            cell.seriesLabel.text           = "Amiibo Series: " + amiibo.series!
            cell.amiiboSeriesLabel.text     = "Game Series: " + amiibo.gameSeries!

            if let url = URL(string: amiibo.imageUrl ?? "nil") {
                cell.avatarImage?.loadImage(from: url)
            }
            return cell
        }
        return UICollectionViewCell()
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        amiiboToPass = amiiboList[indexPath.item]
        performSegue(withIdentifier: "toDataVC", sender: self)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DataViewController     = segue.destination as? DataVC {
            DataViewController.amiibo = amiiboToPass
            DataViewController.delegate = self
          }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width         = view.bounds.width
        let cellDimension = (width / 2) 
        return CGSize(width: cellDimension, height: cellDimension)
    }
}

extension HomeVC: DataVCDelegate {
    func didAddToFavorites(_ amiibo: AmiiboForView?) {
        guard let amiibo = amiibo,
            let index = amiiboList.firstIndex(where: { $0.name == amiibo.name }) else {
            return
        }
        
        amiiboList[index] = amiibo
        (tabBarController?.viewControllers?.first(where: { $0 is FavoritesVC }) as? FavoritesVC)?.favorites = amiiboList.filter({ $0.isFavorite })
        
        print("FavoritesVC exists : \((tabBarController?.viewControllers?.first(where: { $0 is FavoritesVC }) as? FavoritesVC) != nil)")
    }
}
