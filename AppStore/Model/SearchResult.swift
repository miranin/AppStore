//
//  SearchResult.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 12.09.2022.
//

import Foundation
import SDWebImage


struct SearchResult: Decodable {
    
    let resultCount: Int
    let results: [Results]
}

struct Results: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String 
}
