//
//  AmiiboList.swift
//  Amiibo
//
//  Created by Lazaro Ambrosio on 2/29/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import Foundation

struct AmiiboList: Codable {
       let amiibo: [Amiibo]
   }

   // MARK: - Amiibo
   struct Amiibo: Codable {
        let amiiboSeries: String?
        let character: String?
        let gameSeries: String?
        let head: String?
        let image: String?
        let name: String?
        let release: Release?
        let tail: String?
        let type: String?
}
   // MARK: - Release
   struct Release: Codable {
    let au: String?
    let eu: String?
    let jp: String?
    let na: String?
}
