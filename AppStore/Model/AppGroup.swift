//
//  GamesResult.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 14.09.2022.
//

import UIKit


struct AppGroup: Decodable {
    let feed : Feed
}
struct Feed: Decodable {
    let title: String
    let results: [FeedResults]
}

struct FeedResults: Decodable {
    let name: String
    let artistName: String
    let artworkUrl100: String
}

