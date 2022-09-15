//
//  Service.swift
//  AppStore
//
//  Created by Tamirlan Aubakirov on 12.09.2022.
//

import UIKit

class Service {
    static let shared = Service()
    func fetchApps(searchItem: String, completion: @escaping (SearchResult?, Error?)->() ) {
        let urlString = "https://itunes.apple.com/search?term=\(searchItem)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopPaidApps(completion: @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/kz/apps/top-paid/50/apps.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopFreeApps(completion: @escaping(AppGroup?, Error?)->()){
        let urlString = "https://rss.applemarketingtools.com/api/v2/kz/apps/top-free/50/apps.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopSongs(completion: @escaping(AppGroup?,Error?)->()){
        let urlString = "https://rss.applemarketingtools.com/api/v2/kz/music/most-played/50/songs.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApps]?, Error?)-> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?)-> Void) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping(T?, Error?)->()) {
        
        print("T is type \(T.self)")
        guard let url = URL(string: urlString )
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil,error)
                print("Error occured during fetchin games, \(error.localizedDescription)")
                return
            }
            do {
                let appGroup = try JSONDecoder().decode(T.self, from: data!)
                completion(appGroup, nil)
            } catch {
                completion( nil, error)
                print("failed to decode data for AppGroup \(error)")
            }
        }.resume()
    }
}

