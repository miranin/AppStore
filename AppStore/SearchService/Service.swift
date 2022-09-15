//
//  Service.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 12.09.2022.
//

import UIKit

class Service {
    static let shared = Service()
    func fetchApps(searchItem: String, completion: @escaping ([Results], Error?)->() ) {
        let urlString = "https://itunes.apple.com/search?term=\(searchItem)&entity=software"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error occured during fetching apps in search, \(error)")
                completion([], nil)
                return
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch {
                print("Failed to decode data in AppSearchController, \(error)")
            }
        }.resume()
    }
    
    func fetchTopPaidApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/kz/apps/top-paid/50/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopFreeApps(completion: @escaping(AppGroup?, Error?)->()){
        let urlString = "https://rss.applemarketingtools.com/api/v2/kz/apps/top-free/50/apps.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchTopSongs(completion: @escaping(AppGroup?,Error?)->()){
        let urlString = "https://rss.applemarketingtools.com/api/v2/kz/music/most-played/50/songs.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    
    func fetchSocialApps(completion: @escaping ([SocialApps]?, Error?)-> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString )
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil,error)
                print("Error occured during fetchin games, \(error.localizedDescription)")
                return
            }
            do {
                let objects = try JSONDecoder().decode([SocialApps].self, from: data!)
                completion(objects, nil)
            } catch {
                completion( nil, error)
                print("failed to decode data for AppGroup \(error)")
            }
        }.resume()
         
    }
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?)-> Void) {
        guard let url = URL(string: urlString )
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil,error)
                print("Error occured during fetchin games, \(error.localizedDescription)")
                return
            }
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                completion(appGroup, nil)
            } catch {
                completion( nil, error)
                print("failed to decode data for AppGroup \(error)")
            }
        }.resume()
    }
}

