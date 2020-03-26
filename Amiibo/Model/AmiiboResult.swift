//
//  AmiiboResult.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 2/8/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit

struct AmiiboApi {
    
    static let shared = AmiiboApi()
    
    func fetchAmiiboList(searchTerm: String, onCompletion: @escaping([Amiibo]) -> ()) {
    let urlString =  "https://www.amiiboapi.com/api/amiibo/?character=\(searchTerm)"
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
            guard let data = data else {
                print("data was nil")
                return
            }
            
            //Sucess
            guard let amiiboList = try? JSONDecoder().decode(AmiiboList.self, from: data) else {
                print("Could not decode")
                return
            }
            onCompletion((amiiboList.amiibo))
        }
        task.resume()
    }
}

struct AmiiboApiList {
    
    static let shared = AmiiboApiList()
    
    func fetchAmiiboApiList(onCompletion: @escaping([Amiibo]) -> ()) {
    let urlString =  "https://www.amiiboapi.com/api/amiibo/?"
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, error) in
            guard let data = data else {
                print("data was nil")
                return
            }
            
            //Sucess
            guard let amiiboList = try? JSONDecoder().decode(AmiiboList.self, from: data) else {
                print("Could not decode")
                return
            }
            onCompletion((amiiboList.amiibo))
        }
        task.resume()
    }
}
